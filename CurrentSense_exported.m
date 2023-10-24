classdef CurrentSense_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure       matlab.ui.Figure
        GridLayout     matlab.ui.container.GridLayout
        LeftPanel      matlab.ui.container.Panel
        Label_Loss     matlab.ui.control.Label
        WindowSlider   matlab.ui.control.Slider
        Label          matlab.ui.control.Label
        RecordSwitch   matlab.ui.control.ToggleSwitch
        Lamp           matlab.ui.control.Lamp
        RightPanel     matlab.ui.container.Panel
        GridLayout2    matlab.ui.container.GridLayout
        UIAxesPSD      matlab.ui.control.UIAxes
        UIAxesCurrent  matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end


    properties (Access = public)
        Data_Tag = uint8(['DATA']);%uint8([0xA0, 0x76, 0x4E, 0x41, 0xE6, 0x70]); %uint8([0xA0, 0x76, 0x4E, 0x41, 0xBD, 0xDC]);%  Description
        CurrentSenseDongle
        recording = false
        timerStreamHandle
        timerPlotHandle
        timerPSDHandle
        stream = []

        data = uint16([])
        packetdataLength = 250-2
        packetmessageLength = 260
        sensor_mac_map % this is used to map mac adresses to sensor indexes

        first_meas = false;

        FS = 8000
        TS;

        Vref = 3;
        G = 11;
        R = 2e3;
        Bias = 3/2;
        ADCBits = 2^16-1;
        %             Uadc = (raw.*(Vref/ADCBits))-Bias;
        %             Uin = Uadc./G;
        %             current = Uin/R;
        conversionFactorADC = (3/(2^16-1));
        conversionFactorIn = 1/(11*2e3);
        packet_ind = [];
        loss = 0;
        packet_received = 0;

    end

    methods (Access = private)
        function current = toAmps(app, raw)
            current = ((raw*app.conversionFactorADC)-app.Bias)*app.conversionFactorIn;
        end
        function current = toMicroAmps(app, raw)
            current = app.toAmps(raw) * 1e6;
        end



        function timerPSDCallback(app, obj, event)
            for i = 1 : size(app.sensor_mac_map,2)
                window = floor(8* app.WindowSlider.Value);
                len = length(app.data{i});

                if(len > window)
                    plotData = app.toAmps(double(app.data{i}(len-window+1 : len)));
                    Nfft = floor(window/10);% 1024;app.WindowSlider.Value;
                    [pxx,f] = pwelch(plotData./(50e-6),gausswin(Nfft),Nfft/2,Nfft,app.FS);
                    %  [pxx,f] = pwelch(plotData);

                    plot(app.UIAxesPSD, f,10*log10(pxx));
                    xlim(app.UIAxesPSD,[0,app.FS/2]);
                    % PSD = mean(10*log10(pxx));
                    % txt = num2str(PSD);
                    % text(app.UIAxesPSD, app.FS/4,PSD, txt ,'FontSize',14)

                    [pks,locs, peakwidth, peakProminence] =findpeaks(10*log10(pxx),f);
                    peaks_prominence = find(peakProminence>5);% &peakwidth>10);
                    text(app.UIAxesPSD,locs(peaks_prominence)-5,pks(peaks_prominence)+.2,[num2str(round(locs(peaks_prominence)))])

                end
            end
            app.Label_Loss.Text = ['Loss ' num2str((length(app.loss)/double(app.packet_received + length(app.loss)))*100) '%'];
        end

        function timerPlotCallback(app, obj, event)
            for i = 1 : size(app.sensor_mac_map,2)
                window = round((app.FS * 1e-3) * app.WindowSlider.Value);
                t = 0:app.TS:(window-1)/app.FS;
                len = length(app.data{i});
                if(len > window)
                    plotData = app.toMicroAmps(app.data{i}(len-window+1 : len));
                    plot(app.UIAxesCurrent,t,plotData,'DisplayName',dec2hex(app.sensor_mac_map(2,i)) );
                    
                    hold(app.UIAxesCurrent,'on');

                end
            end
            hold(app.UIAxesCurrent,'off');
            legend(app.UIAxesCurrent);
            %update Loss


        end

        function timerStreamCallback(app, obj, event)
            if(app.CurrentSenseDongle.NumBytesAvailable>=260)

                    app.stream = [app.stream,uint8(app.CurrentSenseDongle.read(app.CurrentSenseDongle.NumBytesAvailable,'uint8'))];


                extractData(app, app.stream);


            end
        end

        %extracts data and removes it from the stream
        function [out] = extractData(app, stream)
            index = strfind(stream,app.Data_Tag);
            if(index)
                out=uint16(NaN(floor(length(stream)/2),4));%max size

                index_of_first_packet(1:4) = 2^16; % max uint16 packet counter value, this is a hacky solution but should should support up to 4 devices


                if((index(end)+app.packetmessageLength-1)>length(stream)) % check last received packet is complete
                    index(end) = []; % remove last index because package is not complete
                end

                app.stream(1:index(end)+app.packetmessageLength-1) = []; % delete all data that has been read

                for ind = 1 : length(index)
                    %                 len = uint32(typecast(uint8([stream(index(i)+6),stream(index(i)+7)]),'uint16'));
                    %                 disp(length(stream));
                    %                 ende = index(i)+5+len*2;
                    %                 ende = index(i)+5+len*2;


                    mac = swapbytes((typecast([0,0,stream(index(ind)+4:index(ind)+9)],'uint64'))); % add zeroes to make 64bit value and convert


                    [~,mac_index] = find(app.sensor_mac_map == mac); % row 1 = indexes; row 2 = mac-value
                    if(mac_index)
                    else % mac has not been used yet
                        len_mac_map = size(app.sensor_mac_map,2)+1;
                        app.sensor_mac_map(1,len_mac_map) = len_mac_map;
                        app.sensor_mac_map(2,len_mac_map) = mac;
                        mac_index = len_mac_map;
                    end

                    app.packet_received = app.packet_received+1;


                    this_ind = (typecast(stream(index(ind)+10:index(ind)+11),'uint16')); % get packet count index



                    if(this_ind < index_of_first_packet(mac_index)) % this is the first packet of this stream;
                        index_of_first_packet(mac_index) = this_ind;
                    end
                    start(mac_index) = ((this_ind-index_of_first_packet(mac_index))*(app.packetdataLength)/2)+1;     %((ind-1) * (app.packetLength/2) +1);
                    ende(mac_index) = floor(start(mac_index) + ((app.packetdataLength)/2)-1);
                    out(mac_index,start(mac_index):ende(mac_index)) = double(typecast(stream(index(ind)+12:index(ind)+12+app.packetdataLength-1),'uint16'));



                    app.packet_ind{mac_index}(this_ind+1) = this_ind;

                    %   stream(index(ind)+6:index(ind)+5+app.packetLength-1) = NaN;

                end
                for i = 1 : size(app.sensor_mac_map,2)
                    start = index_of_first_packet(i)*(app.packetdataLength/2)+1;

                    app.data{i}(start:start+length(out(i,1:ende(i)))-1) = double(out(i,1:ende(i)));


                end

                %out = double(out(1:ende)); % remove trailing unneccesary zeroes
                %out(out==0) = NaN;
            else
                out = [];
            end

        end

    end


    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.TS = 1/app.FS;

            app.timerStreamHandle = timer('TimerFcn', {@app.timerStreamCallback}, 'ExecutionMode', 'FixedRate', 'Period', 0.1,'StartDelay',.1);
            app.timerPlotHandle = timer('TimerFcn', {@app.timerPlotCallback}, 'ExecutionMode', 'FixedRate', 'Period', .3,'StartDelay',0.5);
            app.timerPSDHandle = timer('TimerFcn', {@app.timerPSDCallback}, 'ExecutionMode', 'FixedRate', 'Period', 5,'StartDelay',15);

            app.UIAxesPSD.Visible = 'on';
           % app.GridLayout2.ColumnWidth = [{'1x'},0];


            SERIAL_PORT = 'COM11';       % change to device port
            BAUD_RATE =  11520;
            app.CurrentSenseDongle = serialport(SERIAL_PORT, BAUD_RATE);
        end

        % Value changed function: RecordSwitch
        function RecordSwitchButtonValueChanged(app, event)
            value = app.RecordSwitch.Value;


            if strcmp(value,'On')
                app.recording = true;
                app.CurrentSenseDongle.flush()
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');

                app.data = [];
                app.loss = [];
                app.packet_received = 0;
                app.packet_ind = [];
                app.Label_Loss.Text = "";
                app.Lamp.Color = 'green';
                app.first_meas = true;
                start(app.timerStreamHandle);
                start(app.timerPlotHandle);
                start(app.timerPSDHandle);



            else
                app.recording = false;
                app.CurrentSenseDongle.write(uint8(2),'uint8');
                app.CurrentSenseDongle.write(uint8(2),'uint8');
                app.CurrentSenseDongle.write(uint8(2),'uint8');
                app.CurrentSenseDongle.write(uint8(2),'uint8');
                app.CurrentSenseDongle.write(uint8(2),'uint8');

                mac_names = dec2hex(app.sensor_mac_map(2,:));
                datastruct = cell2struct(app.data,mac_names,2);
                packetstruct = cell2struct(app.packet_ind,mac_names,2);
            
            assignin('base', ['CS_', datestr(now,'yyyy_mm_dd_HH_MM_SS_'),'data'], (datastruct));
            assignin('base', ['CS_', datestr(now,'yyyy_mm_dd_HH_MM_SS_'),'packets'], (packetstruct));
            app.data = [];
            app.loss = [];
            app.packet_ind = [];
            stop(app.timerStreamHandle);
            stop(app.timerPlotHandle);
            stop(app.timerPSDHandle);
            app.CurrentSenseDongle.flush();
            app.Lamp.Color= 'red';
            end
    
        end

        % Value changed function: WindowSlider
        function WindowSliderValueChanged(app, event)
            value = app.WindowSlider.Value;
            app.Label.Text = num2str(value);
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {513, 513};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {162, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 982 513];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {162, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create Lamp
            app.Lamp = uilamp(app.LeftPanel);
            app.Lamp.Position = [116 235 20 20];
            app.Lamp.Color = [1 0 0];

            % Create RecordSwitch
            app.RecordSwitch = uiswitch(app.LeftPanel, 'toggle');
            app.RecordSwitch.ValueChangedFcn = createCallbackFcn(app, @RecordSwitchButtonValueChanged, true);
            app.RecordSwitch.Position = [117 96 20 45];

            % Create Label
            app.Label = uilabel(app.LeftPanel);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Position = [110 308 39 45];
            app.Label.Text = '100    ';

            % Create WindowSlider
            app.WindowSlider = uislider(app.LeftPanel);
            app.WindowSlider.Limits = [100 10000];
            app.WindowSlider.MajorTicks = [100 10000];
            app.WindowSlider.MajorTickLabels = {'100u', '10s'};
            app.WindowSlider.Orientation = 'vertical';
            app.WindowSlider.ValueChangedFcn = createCallbackFcn(app, @WindowSliderValueChanged, true);
            app.WindowSlider.Position = [107 370 3 99];
            app.WindowSlider.Value = 100;

            % Create Label_Loss
            app.Label_Loss = uilabel(app.LeftPanel);
            app.Label_Loss.FontColor = [1 0 0];
            app.Label_Loss.Position = [7 11 149 22];
            app.Label_Loss.Text = '';

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.RightPanel);
            app.GridLayout2.ColumnWidth = {'5x', '3x'};
            app.GridLayout2.RowHeight = {'1x'};

            % Create UIAxesCurrent
            app.UIAxesCurrent = uiaxes(app.GridLayout2);
            xlabel(app.UIAxesCurrent, 'time [s]')
            ylabel(app.UIAxesCurrent, 'current [\muA]')
            zlabel(app.UIAxesCurrent, 'Z')
            app.UIAxesCurrent.Layout.Row = 1;
            app.UIAxesCurrent.Layout.Column = 1;

            % Create UIAxesPSD
            app.UIAxesPSD = uiaxes(app.GridLayout2);
            title(app.UIAxesPSD, 'Power Spectral Density')
            xlabel(app.UIAxesPSD, 'Frequency (Hz)')
            ylabel(app.UIAxesPSD, 'PSD (dB/Hz)')
            zlabel(app.UIAxesPSD, 'Z')
            app.UIAxesPSD.Layout.Row = 1;
            app.UIAxesPSD.Layout.Column = 2;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = CurrentSense_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end