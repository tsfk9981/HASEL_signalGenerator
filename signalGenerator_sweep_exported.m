classdef signalGenerator_sweep_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        WavesettingsPanel             matlab.ui.container.Panel
        GridLayout                    matlab.ui.container.GridLayout
        Trigger4EditField             matlab.ui.control.NumericEditField
        Trigger4EditFieldLabel        matlab.ui.control.Label
        Trigger3EditField             matlab.ui.control.NumericEditField
        Trigger3EditFieldLabel        matlab.ui.control.Label
        Trigger2EditField             matlab.ui.control.NumericEditField
        Trigger2EditFieldLabel        matlab.ui.control.Label
        kVLabel_4                     matlab.ui.control.Label
        Trigger1EditField             matlab.ui.control.NumericEditField
        Trigger1EditFieldLabel        matlab.ui.control.Label
        TriggerCheckBox               matlab.ui.control.CheckBox
        method4DropDown               matlab.ui.control.DropDown
        method4DropDownLabel          matlab.ui.control.Label
        offset4EditField              matlab.ui.control.NumericEditField
        offset4EditFieldLabel         matlab.ui.control.Label
        Amplitude4EditField           matlab.ui.control.NumericEditField
        Amplitude4EditFieldLabel      matlab.ui.control.Label
        Reversepolarity4Button        matlab.ui.control.StateButton
        method3DropDown               matlab.ui.control.DropDown
        method3DropDownLabel          matlab.ui.control.Label
        offset3EditField              matlab.ui.control.NumericEditField
        offset3EditFieldLabel         matlab.ui.control.Label
        Amplitude3EditField           matlab.ui.control.NumericEditField
        Amplitude3EditFieldLabel      matlab.ui.control.Label
        Reversepolarity3Button        matlab.ui.control.StateButton
        method2DropDown               matlab.ui.control.DropDown
        method2DropDownLabel          matlab.ui.control.Label
        offset2EditField              matlab.ui.control.NumericEditField
        offset2EditFieldLabel         matlab.ui.control.Label
        Amplitude2EditField           matlab.ui.control.NumericEditField
        Amplitude2EditFieldLabel      matlab.ui.control.Label
        Reversepolarity2Button        matlab.ui.control.StateButton
        method1DropDown               matlab.ui.control.DropDown
        method1DropDownLabel          matlab.ui.control.Label
        offset1EditField              matlab.ui.control.NumericEditField
        offset1EditFieldLabel         matlab.ui.control.Label
        Amplitude1EditField           matlab.ui.control.NumericEditField
        Amplitude1Label               matlab.ui.control.Label
        Reversepolarity1Button        matlab.ui.control.StateButton
        methodLabel                   matlab.ui.control.Label
        kVLabel_2                     matlab.ui.control.Label
        kVLabel_3                     matlab.ui.control.Label
        FilenamesPanel                matlab.ui.container.Panel
        GridLayout8                   matlab.ui.container.GridLayout
        FileprefixEditField           matlab.ui.control.EditField
        ProcessedfilenameLabel        matlab.ui.control.Label
        GoButton                      matlab.ui.control.StateButton
        BrowseButton                  matlab.ui.control.Button
        SelectfilepathEditField       matlab.ui.control.EditField
        SelectfilepathEditFieldLabel  matlab.ui.control.Label
        SignalparameterPanel          matlab.ui.container.Panel
        GridLayout7                   matlab.ui.container.GridLayout
        HzLabel_7                     matlab.ui.control.Label
        FrequencystopEditField        matlab.ui.control.NumericEditField
        FrequencystopEditFieldLabel   matlab.ui.control.Label
        sLabel                        matlab.ui.control.Label
        TotaltimeEditField            matlab.ui.control.NumericEditField
        TotaltimeEditFieldLabel       matlab.ui.control.Label
        HzLabel_6                     matlab.ui.control.Label
        FrequencystartEditField       matlab.ui.control.NumericEditField
        FrequencystartEditFieldLabel  matlab.ui.control.Label
        HzLabel_5                     matlab.ui.control.Label
        SamplerateEditField           matlab.ui.control.NumericEditField
        SamplerateEditFieldLabel      matlab.ui.control.Label
        DAQtypeButtonGroup            matlab.ui.container.ButtonGroup
        outputs4Button                matlab.ui.control.RadioButton
        outputs2Button                matlab.ui.control.RadioButton
        UIAxes                        matlab.ui.control.UIAxes
    end

    %% DAQ
    properties (Access = public)
        d;
        Arr;
        fullSignal;
        scanCount = 0;
        timeInit = 1;
        lastDataIndex = 0;
        type_DAQ = 2;
        rawFilename;
    end

    %% currentSense
    properties (Access = public)
        Data_Tag = uint8(['DATA']);%uint8([0xA0, 0x76, 0x4E, 0x41, 0xE6, 0x70]); %uint8([0xA0, 0x76, 0x4E, 0x41, 0xBD, 0xDC]);%  Description
        CurrentSenseDongle;
        CurrentSense_recording = false;
        timerStreamHandle;
        % timerPlotHandle
        % timerPSDHandle
        stream = [];

        data = uint16([]);
        packetdataLength = 250-2;
        packetmessageLength = 260;
        sensor_mac_map; % this is used to map mac adresses to sensor indexes

        first_meas = false;

        FS = 8000;
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
                        % app.sensor_mac_map
                    end

                    app.packet_received = app.packet_received+1;


                    this_ind = (typecast(stream(index(ind)+10:index(ind)+11),'uint16')); % get packet count index



                    if(this_ind < index_of_first_packet(mac_index)) % this is the first packet of this stream;
                        index_of_first_packet(mac_index) = this_ind;
                    end
                    ind_start(mac_index) = ((this_ind-index_of_first_packet(mac_index))*(app.packetdataLength)/2)+1;     %((ind-1) * (app.packetLength/2) +1);
                    ind_ende(mac_index) = floor(ind_start(mac_index) + ((app.packetdataLength)/2)-1);
                    out(mac_index,ind_start(mac_index):ind_ende(mac_index)) = double(typecast(stream(index(ind)+12:index(ind)+12+app.packetdataLength-1),'uint16'));



                    app.packet_ind{mac_index}(this_ind+1) = this_ind;

                    %   stream(index(ind)+6:index(ind)+5+app.packetLength-1) = NaN;

                end
                for i = 1 : size(app.sensor_mac_map,2)
                    ind_start = index_of_first_packet(i)*(app.packetdataLength/2)+1;

                    app.data{i}(ind_start:ind_start+length(out(i,1:ind_ende(i)))-1) = double(out(i,1:ind_ende(i)));


                end

                %out = double(out(1:ende)); % remove trailing unneccesary zeroes
                %out(out==0) = NaN;
            else
                out = [];
            end

        end
        function start_currentSense(app)
            if app.CurrentSense_recording == false
                app.CurrentSense_recording = true;
                app.CurrentSenseDongle.flush();
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');

                app.data = [];
                app.loss = [];
                app.packet_received = 0;
                app.packet_ind = [];
                app.first_meas = true;
                start(app.timerStreamHandle);
                % start(app.timerPlotHandle);
                % start(app.timerPSDHandle);
            end
        end
        function stop_currentSense(app)
            if app.CurrentSense_recording
                app.CurrentSense_recording = false;
                app.CurrentSenseDongle.write(uint8(2),'uint8');
                app.CurrentSenseDongle.write(uint8(2),'uint8');
                app.CurrentSenseDongle.write(uint8(2),'uint8');
                app.CurrentSenseDongle.write(uint8(2),'uint8');
                app.CurrentSenseDongle.write(uint8(2),'uint8');


                num_device = length(app.data);
                mac_names = dec2hex(app.sensor_mac_map(2,:));

                num_packet_loss = cellfun(@(x) nnz(x == 0) - 1, app.packet_ind);
                if sum(num_packet_loss) > 0
                    disp(['packet loss: ' num2str(num_packet_loss)])
                end

                Data = fillWithNan(app, app.data); % make a data array and fill the data length difference with NaN

                mac_names_cell = cell(1, num_device);
                for i = 1: num_device
                    mac_names_cell{i} = ['MAC_', mac_names(i,:)]; % adding MAC_ to avoid producing variable names which start from number
                end

                writetable(array2table(Data, 'VariableNames', mac_names_cell), [app.rawFilename, '_current.dat']);

                app.data = [];
                app.loss = [];
                app.packet_ind = [];
                stop(app.timerStreamHandle);
                app.CurrentSenseDongle.flush();
            end

        end
        function Data_new = fillWithNan(app, Data)
            dataNum = length(Data);
            [r, c] = cellfun(@size, Data);
            dataLengthMax = max(c);

            Data_new = nan(dataLengthMax, dataNum);
            for i = 1: dataNum
                Data_new(1: length(Data{i}), i) = Data{i};
            end
        end


    end

    %% DAQ
    methods (Access = private)

        function buildSignal(app)
            timeTotal = app.TotaltimeEditField.Value;
            sampRate = app.SamplerateEditField.Value;

            % Build voltage signals
            time = (-app.timeInit: 1/sampRate: timeTotal - 1/sampRate)';


            voltageSignal_1 = createBaseSignal(app, time, app.Amplitude1EditField.Value, app.offset1EditField.Value, app.method1DropDown.Value, app.Reversepolarity1Button.Value, app.Trigger1EditField.Value*app.TriggerCheckBox.Value);
            voltageSignal_2 = createBaseSignal(app, time, app.Amplitude2EditField.Value, app.offset2EditField.Value, app.method2DropDown.Value, app.Reversepolarity2Button.Value, app.Trigger2EditField.Value*app.TriggerCheckBox.Value);
            voltageSignal_3 = createBaseSignal(app, time, app.Amplitude3EditField.Value, app.offset3EditField.Value, app.method3DropDown.Value, app.Reversepolarity3Button.Value, app.Trigger3EditField.Value*app.TriggerCheckBox.Value);
            voltageSignal_4 = createBaseSignal(app, time, app.Amplitude4EditField.Value, app.offset4EditField.Value, app.method4DropDown.Value, app.Reversepolarity4Button.Value, app.Trigger4EditField.Value*app.TriggerCheckBox.Value);

            refSignal = zeros(size(time)); % dump signal, originally used for reference signal for TF estimation

            app.fullSignal = [time, refSignal, voltageSignal_1, voltageSignal_2, voltageSignal_3, voltageSignal_4];
        end

        function voltageSignal = createBaseSignal(app, time, amp, offset, method, flag_rp, triggerLevel)
            time_total = app.TotaltimeEditField.Value;

            freq0 = app.FrequencystartEditField.Value;
            freq1 = app.FrequencystopEditField.Value;

            if flag_rp
                voltageSignal = amp*chirp(time, freq0, time_total, freq1, method, 270);
            else
                voltageSignal = amp/2*chirp(time, freq0, time_total, freq1, method, 180) + amp/2;
            end


            voltageSignal = voltageSignal + offset; % add offset

            voltageSignal(time < 0) = 0; % zero padding for initializing time

            if 1
                voltageSignal(time < -0.4) = triggerLevel;
                voltageSignal(time < -0.5) = 0;
            end

        end


        function buildPreview(app)

            buildSignal(app);

            cla(app.UIAxes, "reset")
            title(app.UIAxes, 'prescribed signals')
            hold(app.UIAxes, "on")
            plot(app.UIAxes, app.fullSignal(:, 1), app.fullSignal(:, 3));
            plot(app.UIAxes, app.fullSignal(:, 1), app.fullSignal(:, 4));
            plot(app.UIAxes, app.fullSignal(:, 1), app.fullSignal(:, 5));
            plot(app.UIAxes, app.fullSignal(:, 1), app.fullSignal(:, 6));
            ylabel(app.UIAxes, 'Voltage (kV)');
            grid(app.UIAxes, 'on')



        end

        function storeData(app, ~, ~)
            % This function is called every n = scansAvailableFcnCount data
            % points read by the DAQ

            numScansAvailable = app.d.NumScansAvailable;
            % if numScansAvailable == 0
            %     stop_measurement(app);
            %     disp('suspiciously end')
            %     goButtonSuspection(app);
            %     return;
            % end
            app.scanCount = app.scanCount + 1;


            startIndex = (app.scanCount - 1)*app.d.ScansAvailableFcnCount + 1;
            % location to put next data
            endIndex = (startIndex - 1) + numScansAvailable;
            % location of end of new data
            app.lastDataIndex = endIndex;
            % this global index tells the program where the last data
            % point is, in case of test interruption

            % Read available data from DAQ
            scanData = read(app.d, numScansAvailable, "OutputFormat", "Matrix");

            app.Arr.voltage1(startIndex: endIndex) = scanData(:, 1);
            % channel 1 is voltage input from Trek 1(in volts)

            app.Arr.current1(startIndex: endIndex) = scanData(:, 2);
            % channel 2 is current input from Trek 1 (in volts)

            app.Arr.voltage2(startIndex: endIndex) = scanData(:, 3);
            % channel 3 is voltage input from Trek 2 (in volts)

            app.Arr.current2(startIndex: endIndex) = scanData(:, 4);
            % channel 4 is current input from Trek 2 (in volts)

            app.Arr.voltage3(startIndex: endIndex) = scanData(:, 5);
            % channel 5 is voltage input from Trek 3 (in volts)

            app.Arr.current3(startIndex: endIndex) = scanData(:, 6);
            % channel 6 is current input from Trek 3 (in volts)

            app.Arr.voltage4(startIndex: endIndex) = scanData(:, 7);
            % channel 7 is voltage input from Trek 4 (in volts)

            app.Arr.current4(startIndex: endIndex) = scanData(:, 8);
            % channel 8 is current input from Trek 4 (in volts)

            if app.type_DAQ == 4

                app.Arr.angle1(startIndex: endIndex) = scanData(:, 9);
                % channel 16 is encoder angle 1 (in volts)

                app.Arr.angle2(startIndex: endIndex) = scanData(:, 10);
                % channel 17 is encoder angle 2 (in volts)

                app.Arr.fp1(startIndex: endIndex) = scanData(:, 11);
                % channel 20 is force plate X (in volts)

                app.Arr.fp2(startIndex: endIndex) = scanData(:, 12);
                % channel 21 is force plate Y (in volts)

                app.Arr.fp3(startIndex: endIndex) = scanData(:, 13);
                % channel 22 is force plate Z (in volts)

            end


            % % stop the sequential plot when it is heavy to process
            %             % Plot data every
            %             app.UIAxes.Visible = 0;
            %             cla(app.UIAxes, "reset");
            %             hold(app.UIAxes, "on");
            %             title(app.UIAxes, 'sequential plot')
            %             yyaxis(app.UIAxes, 'left');
            %             plot(app.UIAxes, timeArr(startIndex: endIndex), voltageArr1(startIndex: endIndex), '-');
            %             ylabel(app.UIAxes, 'voltage')
            % 
            %             yyaxis(app.UIAxes, 'right');
            %             plot(app.UIAxes, timeArr(startIndex: endIndex), currentArr1(startIndex: endIndex), '-');
            %             ylabel(app.UIAxes, 'current')
            % %             ylim(app.UIAxes(1), 'auto')
            % %             ylim(app.UIAxes(2), 'auto')
            %             grid(app.UIAxes, "on")
            %             app.UIAxes.Visible = 1;





            if endIndex >= length(app.Arr.time)
                pause(0.5)
                stop_measurement(app);
                disp('successfully end')
                goButtonReady(app);
            end
        end

        function setArr(app)

            % Build output signal and preload
            app.Arr.time = app.fullSignal(:, 1);
            app.Arr.voltageRef1 = app.fullSignal(:, 3);
            app.Arr.voltageRef2 = app.fullSignal(:, 4);
            app.Arr.voltageRef3 = app.fullSignal(:, 5);
            app.Arr.voltageRef4 = app.fullSignal(:, 6);

            app.Arr.voltage1 = zeros(length(app.fullSignal), 1);
            app.Arr.current1 = zeros(length(app.fullSignal), 1);
            app.Arr.voltage2 = zeros(length(app.fullSignal), 1);
            app.Arr.current2 = zeros(length(app.fullSignal), 1);
            app.Arr.voltage3 = zeros(length(app.fullSignal), 1);
            app.Arr.current3 = zeros(length(app.fullSignal), 1);
            app.Arr.voltage4 = zeros(length(app.fullSignal), 1);
            app.Arr.current4 = zeros(length(app.fullSignal), 1);

            app.Arr.angle1 = zeros(length(app.fullSignal), 1);
            app.Arr.angle2 = zeros(length(app.fullSignal), 1);
            app.Arr.fp1 = zeros(length(app.fullSignal), 1);
            app.Arr.fp2 = zeros(length(app.fullSignal), 1);
            app.Arr.fp3 = zeros(length(app.fullSignal), 1);
        end

        function start_DAQ(app)

            if app.type_DAQ == 4
                preload(app.d, app.fullSignal(:, 3:6));
            else
                preload(app.d, app.fullSignal(:, 3:4));
            end

            start(app.d);


        end

        function stop_DAQ(app)
            disp('stop_DAQ: starting stop DAQ')
            if app.d.Running
                try
                    stop(app.d);
                catch
                    disp('failed to stop DAQ!!')
                end

            end

            disp('stop_DAQ: end stop DAQ')


            % Read residual data from DAQ
            if app.d.NumScansAvailable > 0
                disp('reading residual data from DAQ')
                storeData(app, app.d, 0);
            end
            disp('stop_DAQ: store data')
        end

        function plot_result(app)
            cla(app.UIAxes, "reset")
            title(app.UIAxes, 'overall plot');
            yyaxis(app.UIAxes, 'left');
            plot(app.UIAxes, app.Arr.time, app.Arr.voltage1);
            ylabel(app.UIAxes, 'voltage [kV]');
            yyaxis(app.UIAxes, 'right');
            plot(app.UIAxes, app.Arr.time, app.Arr.current1);
            ylabel(app.UIAxes, 'current [uA]');
            xlabel(app.UIAxes, 'time [s]')
            grid(app.UIAxes, "on")
        end


        function saveDAQ(app)

            % file saves
            writetable(table(...
                app.Arr.time,...
                app.Arr.voltageRef1,...
                app.Arr.voltageRef2,...
                app.Arr.voltageRef3,...
                app.Arr.voltageRef4,...
                app.Arr.voltage1,...
                app.Arr.current1,...
                app.Arr.voltage2,...
                app.Arr.current2,...
                app.Arr.voltage3,...
                app.Arr.current3,...
                app.Arr.voltage4,...
                app.Arr.current4,...
                app.Arr.angle1,...
                app.Arr.angle2,...
                app.Arr.fp1,...
                app.Arr.fp2,...
                app.Arr.fp3,...
                'VariableNames', {...
                'Time [s]',...
                'Voltage ref 1[kV]',...
                'Voltage ref 2[kV]',...
                'Voltage ref 3[kV]',...
                'Voltage ref 4[kV]',...
                'Voltage 1 [kV]',...
                'Current 1 [uA]',...
                'Voltage 2 [kV]',...
                'Current 2 [uA]',...
                'Voltage 3 [kV]',...
                'Current 3 [uA]',...
                'Voltage 4 [kV]',...
                'Current 4 [uA]',...
                'Angle 1 [V]',...
                'Angle 2 [V]',...
                'force 1 [V]',...
                'force 2 [V]',...
                'force 3 [V]',...
                }), [app.rawFilename, '_DAQ.dat']);
        end

        function start_measurement(app)
            buildSignal(app);
            setArr(app);
            start_DAQ(app);
            app.scanCount = 0;
            start_currentSense(app);
            goButtonRecording(app);
        end

        function stop_measurement(app)
            setFname(app);
            stop_currentSense(app);
            disp('saved current')
            stop_DAQ(app);
            disp('stopped DAQ')
            goButtonSaving(app);
            disp('changed button')
            plot_result(app);
            disp('plotted result')
            saveDAQ(app)
            disp('saved DAQ')


            % Fush the DAQ and ensure zero voltage
            flush(app.d);
            disp('flashed DAQ')
            if app.type_DAQ == 4
                write(app.d, [0, 0, 0, 0]);
            else
                write(app.d, [0, 0]);
            end
            disp('wrote 0 to DAQ')


        end

        function goButtonReady(app)
            app.GoButton.BackgroundColor = 'green';
            app.GoButton.Text = 'Run';
            app.GoButton.Value = 0;
        end
        function goButtonSuspection(app)
            app.GoButton.BackgroundColor = 'yellow';
            app.GoButton.Text = {'incorrect', 'stop', 'data length=', num2str(app.lastDataIndex)};
            warning('check the data saved')
            dataLength = app.lastDataIndex
            app.GoButton.Value = 0;
        end
        function goButtonRecording(app)
            app.GoButton.BackgroundColor = 'red';
            app.GoButton.Text = 'Recording';
            app.GoButton.Value = 1;
        end
        function goButtonSaving(app)
            app.GoButton.BackgroundColor = 'white';
            app.GoButton.Text = 'Saving';
            app.GoButton.Value = 1;
        end

        function setup_DAQ(app)
            DQL = daqlist; % get connected device list
            DevName = DQL.DeviceID(1); % select the first one (["Dev1", "SimDev1"] or ["SimDev1"])
            % DevName = "Dev3";

            if app.DAQtypeButtonGroup.SelectedObject.Text == "4 outputs"
                app.type_DAQ = 4;
            else
                app.type_DAQ = 2;
            end
            app.d = daq("ni");
            app.d.Rate = app.SamplerateEditField.Value;

            app.d.ScansAvailableFcn = @(src, event) storeData(app, src, event);
            % call storeData fcn when scans are available

            app.d.ScansAvailableFcnCount = 'auto';
            % d.ScansAvailableFcnCount = app.SamplerateEditField.Value*1; % every 1 second
            % by default, call storeData every cycle

            defineChannels(app, DevName);
            app.d.Channels
            flush(app.d);

        end

        function defineChannels(app, DevName)

            addoutput(app.d, DevName, "ao0", "Voltage");
            % voltage output to TREk1

            addoutput(app.d, DevName, "ao1", "Voltage");
            % voltage output to TREk2

            if app.type_DAQ == 4
                addoutput(app.d, DevName, "ao2", "Voltage");
                % voltage output to TREk3

                addoutput(app.d, DevName, "ao3", "Voltage");
                % voltage output to TREk4
            end

            addinput(app.d, DevName, "ai0", "Voltage");
            % TREK 1 voltage monitor

            addinput(app.d, DevName, "ai1", "Voltage");
            % TREK 1 current monitor

            addinput(app.d, DevName, "ai2", "Voltage");
            % TREK 2 voltage monitor

            addinput(app.d, DevName, "ai3", "Voltage");
            % TREK 2 current monitor

            addinput(app.d, DevName, "ai4", "Voltage");
            % TREK 3 voltage monitor

            addinput(app.d, DevName, "ai5", "Voltage");
            % TREK 3 current monitor

            addinput(app.d, DevName, "ai6", "Voltage");
            % TREK 4 voltage monitor

            addinput(app.d, DevName, "ai7", "Voltage");
            % TREK 4 current monitor

            if app.type_DAQ == 4
                addinput(app.d, DevName, "ai16", "Voltage");
                % hip angle

                addinput(app.d, DevName, "ai17", "Voltage");
                % knee angle

                addinput(app.d, DevName, "ai20", "Voltage");
                % force plate X

                addinput(app.d, DevName, "ai21", "Voltage");
                % force plate Y

                addinput(app.d, DevName, "ai22", "Voltage");
                % force plate Z


            end

        end
        function setFname(app)
            textPara = [...
                app.method1DropDown.Value(1), '_',...
                num2str(app.Amplitude1EditField.Value*10,   '%03.0f'), 'kV_',...
                num2str(app.FrequencystartEditField.Value, '%04.0f'), 'Hz_',...
                num2str(app.FrequencystopEditField.Value, '%04.0f'), 'Hz_',...
                num2str(app.SamplerateEditField.Value,   '%06.0f'), 'Hz_',...
                ];
            app.rawFilename = fullfile(app.SelectfilepathEditField.Value,...
                [app.FileprefixEditField.Value, '_', textPara, char(datetime("now","Format", "yyyy_MM_dd_HHmm_ss"))]);

        end

    end




    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.GoButton.Text = 'Wait';
            app.GoButton.BackgroundColor = 'yellow';
            %% DAQ
            setup_DAQ(app);
            if app.outputs2Button.Value
                app.Reversepolarity3Button.Enable = "off";
                app.Amplitude3EditField.Enable = "off";
                app.offset3EditField.Enable = "off";
                app.method3DropDown.Enable = "off";
                app.Reversepolarity4Button.Enable = "off";
                app.Amplitude4EditField.Enable = "off";
                app.offset4EditField.Enable = "off";
                app.method4DropDown.Enable = "off";
            end

            buildPreview(app);

            goButtonReady(app);



            %% currentSense
            app.TS = 1/app.FS;

            app.timerStreamHandle = timer('TimerFcn', {@app.timerStreamCallback}, 'ExecutionMode', 'FixedRate', 'Period', 0.1,'StartDelay',.1);

            SERIAL_PORT = 'COM3';       % change to device port
            BAUD_RATE =  11520;
            app.CurrentSenseDongle = serialport(SERIAL_PORT, BAUD_RATE);

            
        end

        % Button pushed function: BrowseButton
        function BrowseButtonPushed(app, event)
            filepath = uigetdir;
            try
                app.SelectfilepathEditField.Value = filepath;
            catch
                uiwait(msgbox("No filepath selected", "Warning", 'warn', 'modal'));
                app.SelectfilepathEditField.Value = "";
            end
        end

        % Value changed function: GoButton
        function GoButtonValueChanged(app, event)
            if app.GoButton.Value % start test
                start_measurement(app);
            else
                stop_measurement(app);
                goButtonSuspection(app);
            end
        end

        % Callback function
        function SaverawfileCheckBoxValueChanged(app, event)

        end

        % Value changed function: SamplerateEditField
        function SamplerateEditFieldValueChanged(app, event)
            app.d.Rate = app.SamplerateEditField.Value;
            buildPreview(app);
        end

        % Callback function
        function TREKvoltageconstantkVEditFieldValueChanged(app, event)

        end

        % Callback function
        function TREKcurrentconstantmAEditFieldValueChanged(app, event)

        end

        % Callback function
        function MinfrequencyEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function MaxvoltageEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function NumberofvoltcyclesperstepEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function ReversepolarityCheckBoxValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function LogdistributionCheckBoxValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function MaxforceEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function NumberofforcestepsEditFieldValueChanged(app, event)

        end

        % Callback function
        function MonitorlimittripstatusCheckBoxValueChanged(app, event)

        end

        % Callback function
        function methodDropDownValueChanged(app, event)

        end

        % Callback function
        function MaxfrequencyEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: TotaltimeEditField
        function TotaltimeEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function ConstantforceEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: FrequencystartEditField
        function FrequencystartEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function dutyratio1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function rampSpeedValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function rampspeed1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Amplitude1EditField
        function Amplitude1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Amplitude2EditField
        function Amplitude2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Amplitude3EditField
        function Amplitude3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Amplitude4EditField
        function Amplitude4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function delay1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function delay2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function delay3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function delay4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: method1DropDown
        function method1DropDownValueChanged(app, event)
            if app.method1DropDown.Value == "logarithmic"
                app.FrequencystartEditField.Value = max(0.01, app.FrequencystartEditField.Value);
            end
            buildPreview(app);
        end

        % Value changed function: method2DropDown
        function method2DropDownValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: method3DropDown
        function method3DropDownValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: method4DropDown
        function method4DropDownValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function dutyratio2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function dutyratio3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function dutyratio4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function rampspeed2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function rampspeed3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function rampspeed4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function delayCheckBoxValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function expoEditFieldValueChanging(app, event)
            buildPreview(app);
        end

        % Callback function
        function expo1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function CurrentSenseSwitchValueChanged(app, event)

        end

        % Callback function
        function txPwEditFieldValueChanged(app, event)
            app.CurrentSenseDongle.write(value,'uint8');
        end

        % Value changed function: offset1EditField
        function offset1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: offset2EditField
        function offset2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: offset3EditField
        function offset3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: offset4EditField
        function offset4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function offsetCheckBoxValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function expo2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function expo3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function expo4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function Reversepolarity1ButtonValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function Reversepolarity2ButtonValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function Reversepolarity3ButtonValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function Reversepolarity4ButtonValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Reversepolarity1Button
        function Reversepolarity1ButtonValueChanged2(app, event)
            buildPreview(app);
        end

        % Value changed function: Reversepolarity2Button
        function Reversepolarity2ButtonValueChanged2(app, event)
            buildPreview(app);
        end

        % Value changed function: Reversepolarity3Button
        function Reversepolarity3ButtonValueChanged2(app, event)
            buildPreview(app);
        end

        % Value changed function: Reversepolarity4Button
        function Reversepolarity4ButtonValueChanged2(app, event)
            buildPreview(app);
        end

        % Value changed function: FrequencystopEditField
        function FrequencystopEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: TriggerCheckBox
        function TriggerCheckBoxValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Trigger1EditField
        function Trigger1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Trigger2EditField
        function Trigger2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Trigger3EditField
        function Trigger3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Trigger4EditField
        function Trigger4EditFieldValueChanged(app, event)
            buildPreview(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1313 688];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Data')
            xlabel(app.UIAxes, 'Time (s)')
            ylabel(app.UIAxes, 'Voltage (kV)')
            app.UIAxes.PlotBoxAspectRatio = [1.45226130653266 1 1];
            app.UIAxes.XTickLabelRotation = 0;
            app.UIAxes.YTickLabelRotation = 0;
            app.UIAxes.ZTickLabelRotation = 0;
            app.UIAxes.Position = [21 346 1256 326];

            % Create DAQtypeButtonGroup
            app.DAQtypeButtonGroup = uibuttongroup(app.UIFigure);
            app.DAQtypeButtonGroup.TitlePosition = 'centertop';
            app.DAQtypeButtonGroup.Title = 'DAQ type';
            app.DAQtypeButtonGroup.FontWeight = 'bold';
            app.DAQtypeButtonGroup.Position = [21 221 148 98];

            % Create outputs2Button
            app.outputs2Button = uiradiobutton(app.DAQtypeButtonGroup);
            app.outputs2Button.Enable = 'off';
            app.outputs2Button.Text = '2 outputs';
            app.outputs2Button.Position = [10 40 71 22];
            app.outputs2Button.Value = true;

            % Create outputs4Button
            app.outputs4Button = uiradiobutton(app.DAQtypeButtonGroup);
            app.outputs4Button.Enable = 'off';
            app.outputs4Button.Text = '4 outputs';
            app.outputs4Button.Position = [10 11 71 22];

            % Create SignalparameterPanel
            app.SignalparameterPanel = uipanel(app.UIFigure);
            app.SignalparameterPanel.TitlePosition = 'centertop';
            app.SignalparameterPanel.Title = 'Signal parameter';
            app.SignalparameterPanel.FontWeight = 'bold';
            app.SignalparameterPanel.FontSize = 14;
            app.SignalparameterPanel.Position = [188 221 453 98];

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.SignalparameterPanel);
            app.GridLayout7.ColumnWidth = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
            app.GridLayout7.ColumnSpacing = 10.125;
            app.GridLayout7.Padding = [10.125 10 10.125 10];

            % Create SamplerateEditFieldLabel
            app.SamplerateEditFieldLabel = uilabel(app.GridLayout7);
            app.SamplerateEditFieldLabel.HorizontalAlignment = 'right';
            app.SamplerateEditFieldLabel.Layout.Row = 1;
            app.SamplerateEditFieldLabel.Layout.Column = 1;
            app.SamplerateEditFieldLabel.Text = 'Sample rate';

            % Create SamplerateEditField
            app.SamplerateEditField = uieditfield(app.GridLayout7, 'numeric');
            app.SamplerateEditField.Limits = [0 Inf];
            app.SamplerateEditField.ValueChangedFcn = createCallbackFcn(app, @SamplerateEditFieldValueChanged, true);
            app.SamplerateEditField.Layout.Row = 1;
            app.SamplerateEditField.Layout.Column = 2;
            app.SamplerateEditField.Value = 10000;

            % Create HzLabel_5
            app.HzLabel_5 = uilabel(app.GridLayout7);
            app.HzLabel_5.Layout.Row = 1;
            app.HzLabel_5.Layout.Column = 3;
            app.HzLabel_5.Text = 'Hz';

            % Create FrequencystartEditFieldLabel
            app.FrequencystartEditFieldLabel = uilabel(app.GridLayout7);
            app.FrequencystartEditFieldLabel.HorizontalAlignment = 'right';
            app.FrequencystartEditFieldLabel.Layout.Row = 1;
            app.FrequencystartEditFieldLabel.Layout.Column = 4;
            app.FrequencystartEditFieldLabel.Text = 'Frequency start';

            % Create FrequencystartEditField
            app.FrequencystartEditField = uieditfield(app.GridLayout7, 'numeric');
            app.FrequencystartEditField.Limits = [0 Inf];
            app.FrequencystartEditField.ValueChangedFcn = createCallbackFcn(app, @FrequencystartEditFieldValueChanged, true);
            app.FrequencystartEditField.Layout.Row = 1;
            app.FrequencystartEditField.Layout.Column = 5;

            % Create HzLabel_6
            app.HzLabel_6 = uilabel(app.GridLayout7);
            app.HzLabel_6.Layout.Row = 1;
            app.HzLabel_6.Layout.Column = 6;
            app.HzLabel_6.Text = 'Hz';

            % Create TotaltimeEditFieldLabel
            app.TotaltimeEditFieldLabel = uilabel(app.GridLayout7);
            app.TotaltimeEditFieldLabel.HorizontalAlignment = 'right';
            app.TotaltimeEditFieldLabel.Layout.Row = 2;
            app.TotaltimeEditFieldLabel.Layout.Column = 1;
            app.TotaltimeEditFieldLabel.Text = 'Total time';

            % Create TotaltimeEditField
            app.TotaltimeEditField = uieditfield(app.GridLayout7, 'numeric');
            app.TotaltimeEditField.Limits = [0 Inf];
            app.TotaltimeEditField.ValueChangedFcn = createCallbackFcn(app, @TotaltimeEditFieldValueChanged, true);
            app.TotaltimeEditField.Layout.Row = 2;
            app.TotaltimeEditField.Layout.Column = 2;
            app.TotaltimeEditField.Value = 10;

            % Create sLabel
            app.sLabel = uilabel(app.GridLayout7);
            app.sLabel.Layout.Row = 2;
            app.sLabel.Layout.Column = 3;
            app.sLabel.Text = 's';

            % Create FrequencystopEditFieldLabel
            app.FrequencystopEditFieldLabel = uilabel(app.GridLayout7);
            app.FrequencystopEditFieldLabel.HorizontalAlignment = 'right';
            app.FrequencystopEditFieldLabel.Layout.Row = 2;
            app.FrequencystopEditFieldLabel.Layout.Column = 4;
            app.FrequencystopEditFieldLabel.Text = 'Frequency stop';

            % Create FrequencystopEditField
            app.FrequencystopEditField = uieditfield(app.GridLayout7, 'numeric');
            app.FrequencystopEditField.ValueChangedFcn = createCallbackFcn(app, @FrequencystopEditFieldValueChanged, true);
            app.FrequencystopEditField.Layout.Row = 2;
            app.FrequencystopEditField.Layout.Column = 5;
            app.FrequencystopEditField.Value = 100;

            % Create HzLabel_7
            app.HzLabel_7 = uilabel(app.GridLayout7);
            app.HzLabel_7.Layout.Row = 2;
            app.HzLabel_7.Layout.Column = 6;
            app.HzLabel_7.Text = 'Hz';

            % Create FilenamesPanel
            app.FilenamesPanel = uipanel(app.UIFigure);
            app.FilenamesPanel.TitlePosition = 'centertop';
            app.FilenamesPanel.Title = 'File names';
            app.FilenamesPanel.FontWeight = 'bold';
            app.FilenamesPanel.FontSize = 14;
            app.FilenamesPanel.Position = [666 221 612 98];

            % Create GridLayout8
            app.GridLayout8 = uigridlayout(app.FilenamesPanel);
            app.GridLayout8.ColumnWidth = {'fit', '2x', 'fit', '1x'};

            % Create SelectfilepathEditFieldLabel
            app.SelectfilepathEditFieldLabel = uilabel(app.GridLayout8);
            app.SelectfilepathEditFieldLabel.HorizontalAlignment = 'right';
            app.SelectfilepathEditFieldLabel.Layout.Row = 1;
            app.SelectfilepathEditFieldLabel.Layout.Column = 1;
            app.SelectfilepathEditFieldLabel.Text = 'Select file path:';

            % Create SelectfilepathEditField
            app.SelectfilepathEditField = uieditfield(app.GridLayout8, 'text');
            app.SelectfilepathEditField.Layout.Row = 1;
            app.SelectfilepathEditField.Layout.Column = 2;
            app.SelectfilepathEditField.Value = '\\space\fukushima\RM\prj_simpleEfficiency\experiment_currentSense\20240328_frequencyResponse';

            % Create BrowseButton
            app.BrowseButton = uibutton(app.GridLayout8, 'push');
            app.BrowseButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseButtonPushed, true);
            app.BrowseButton.Layout.Row = 1;
            app.BrowseButton.Layout.Column = 3;
            app.BrowseButton.Text = 'Browse';

            % Create GoButton
            app.GoButton = uibutton(app.GridLayout8, 'state');
            app.GoButton.ValueChangedFcn = createCallbackFcn(app, @GoButtonValueChanged, true);
            app.GoButton.Text = 'Go';
            app.GoButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.GoButton.FontSize = 24;
            app.GoButton.FontWeight = 'bold';
            app.GoButton.Layout.Row = [1 2];
            app.GoButton.Layout.Column = 4;

            % Create ProcessedfilenameLabel
            app.ProcessedfilenameLabel = uilabel(app.GridLayout8);
            app.ProcessedfilenameLabel.HorizontalAlignment = 'right';
            app.ProcessedfilenameLabel.Layout.Row = 2;
            app.ProcessedfilenameLabel.Layout.Column = 1;
            app.ProcessedfilenameLabel.Text = 'File prefix';

            % Create FileprefixEditField
            app.FileprefixEditField = uieditfield(app.GridLayout8, 'text');
            app.FileprefixEditField.Layout.Row = 2;
            app.FileprefixEditField.Layout.Column = 2;
            app.FileprefixEditField.Value = 'FR_L_1p0E6Ohm';

            % Create WavesettingsPanel
            app.WavesettingsPanel = uipanel(app.UIFigure);
            app.WavesettingsPanel.TitlePosition = 'centertop';
            app.WavesettingsPanel.Title = 'Wave settings';
            app.WavesettingsPanel.FontWeight = 'bold';
            app.WavesettingsPanel.FontSize = 14;
            app.WavesettingsPanel.Position = [21 26 1257 184];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.WavesettingsPanel);
            app.GridLayout.ColumnWidth = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x'};

            % Create kVLabel_3
            app.kVLabel_3 = uilabel(app.GridLayout);
            app.kVLabel_3.HorizontalAlignment = 'center';
            app.kVLabel_3.Layout.Row = 1;
            app.kVLabel_3.Layout.Column = 5;
            app.kVLabel_3.Text = 'kV';

            % Create kVLabel_2
            app.kVLabel_2 = uilabel(app.GridLayout);
            app.kVLabel_2.HorizontalAlignment = 'center';
            app.kVLabel_2.Layout.Row = 1;
            app.kVLabel_2.Layout.Column = 7;
            app.kVLabel_2.Text = 'kV';

            % Create methodLabel
            app.methodLabel = uilabel(app.GridLayout);
            app.methodLabel.HorizontalAlignment = 'center';
            app.methodLabel.Layout.Row = 1;
            app.methodLabel.Layout.Column = 9;
            app.methodLabel.Text = 'method';

            % Create Reversepolarity1Button
            app.Reversepolarity1Button = uibutton(app.GridLayout, 'state');
            app.Reversepolarity1Button.ValueChangedFcn = createCallbackFcn(app, @Reversepolarity1ButtonValueChanged2, true);
            app.Reversepolarity1Button.Text = 'Reverse polarity 1';
            app.Reversepolarity1Button.Layout.Row = 2;
            app.Reversepolarity1Button.Layout.Column = 3;
            app.Reversepolarity1Button.Value = true;

            % Create Amplitude1Label
            app.Amplitude1Label = uilabel(app.GridLayout);
            app.Amplitude1Label.HorizontalAlignment = 'right';
            app.Amplitude1Label.Layout.Row = 2;
            app.Amplitude1Label.Layout.Column = 4;
            app.Amplitude1Label.Text = 'Amplitude 1';

            % Create Amplitude1EditField
            app.Amplitude1EditField = uieditfield(app.GridLayout, 'numeric');
            app.Amplitude1EditField.ValueChangedFcn = createCallbackFcn(app, @Amplitude1EditFieldValueChanged, true);
            app.Amplitude1EditField.Layout.Row = 2;
            app.Amplitude1EditField.Layout.Column = 5;
            app.Amplitude1EditField.Value = 10;

            % Create offset1EditFieldLabel
            app.offset1EditFieldLabel = uilabel(app.GridLayout);
            app.offset1EditFieldLabel.HorizontalAlignment = 'right';
            app.offset1EditFieldLabel.Layout.Row = 2;
            app.offset1EditFieldLabel.Layout.Column = 6;
            app.offset1EditFieldLabel.Text = 'offset 1';

            % Create offset1EditField
            app.offset1EditField = uieditfield(app.GridLayout, 'numeric');
            app.offset1EditField.ValueChangedFcn = createCallbackFcn(app, @offset1EditFieldValueChanged, true);
            app.offset1EditField.Layout.Row = 2;
            app.offset1EditField.Layout.Column = 7;

            % Create method1DropDownLabel
            app.method1DropDownLabel = uilabel(app.GridLayout);
            app.method1DropDownLabel.HorizontalAlignment = 'right';
            app.method1DropDownLabel.Layout.Row = 2;
            app.method1DropDownLabel.Layout.Column = 8;
            app.method1DropDownLabel.Text = 'method 1';

            % Create method1DropDown
            app.method1DropDown = uidropdown(app.GridLayout);
            app.method1DropDown.Items = {'linear', 'quadratic', 'logarithmic'};
            app.method1DropDown.ValueChangedFcn = createCallbackFcn(app, @method1DropDownValueChanged, true);
            app.method1DropDown.Layout.Row = 2;
            app.method1DropDown.Layout.Column = 9;
            app.method1DropDown.Value = 'linear';

            % Create Reversepolarity2Button
            app.Reversepolarity2Button = uibutton(app.GridLayout, 'state');
            app.Reversepolarity2Button.ValueChangedFcn = createCallbackFcn(app, @Reversepolarity2ButtonValueChanged2, true);
            app.Reversepolarity2Button.Text = 'Reverse polarity 2';
            app.Reversepolarity2Button.Layout.Row = 3;
            app.Reversepolarity2Button.Layout.Column = 3;

            % Create Amplitude2EditFieldLabel
            app.Amplitude2EditFieldLabel = uilabel(app.GridLayout);
            app.Amplitude2EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude2EditFieldLabel.Layout.Row = 3;
            app.Amplitude2EditFieldLabel.Layout.Column = 4;
            app.Amplitude2EditFieldLabel.Text = 'Amplitude 2';

            % Create Amplitude2EditField
            app.Amplitude2EditField = uieditfield(app.GridLayout, 'numeric');
            app.Amplitude2EditField.ValueChangedFcn = createCallbackFcn(app, @Amplitude2EditFieldValueChanged, true);
            app.Amplitude2EditField.Layout.Row = 3;
            app.Amplitude2EditField.Layout.Column = 5;

            % Create offset2EditFieldLabel
            app.offset2EditFieldLabel = uilabel(app.GridLayout);
            app.offset2EditFieldLabel.HorizontalAlignment = 'right';
            app.offset2EditFieldLabel.Layout.Row = 3;
            app.offset2EditFieldLabel.Layout.Column = 6;
            app.offset2EditFieldLabel.Text = 'offset 2';

            % Create offset2EditField
            app.offset2EditField = uieditfield(app.GridLayout, 'numeric');
            app.offset2EditField.ValueChangedFcn = createCallbackFcn(app, @offset2EditFieldValueChanged, true);
            app.offset2EditField.Layout.Row = 3;
            app.offset2EditField.Layout.Column = 7;

            % Create method2DropDownLabel
            app.method2DropDownLabel = uilabel(app.GridLayout);
            app.method2DropDownLabel.HorizontalAlignment = 'right';
            app.method2DropDownLabel.Layout.Row = 3;
            app.method2DropDownLabel.Layout.Column = 8;
            app.method2DropDownLabel.Text = 'method 2';

            % Create method2DropDown
            app.method2DropDown = uidropdown(app.GridLayout);
            app.method2DropDown.Items = {'linear', 'quadratic', 'logarithmic'};
            app.method2DropDown.ValueChangedFcn = createCallbackFcn(app, @method2DropDownValueChanged, true);
            app.method2DropDown.Layout.Row = 3;
            app.method2DropDown.Layout.Column = 9;
            app.method2DropDown.Value = 'linear';

            % Create Reversepolarity3Button
            app.Reversepolarity3Button = uibutton(app.GridLayout, 'state');
            app.Reversepolarity3Button.ValueChangedFcn = createCallbackFcn(app, @Reversepolarity3ButtonValueChanged2, true);
            app.Reversepolarity3Button.Text = 'Reverse polarity 3';
            app.Reversepolarity3Button.Layout.Row = 4;
            app.Reversepolarity3Button.Layout.Column = 3;

            % Create Amplitude3EditFieldLabel
            app.Amplitude3EditFieldLabel = uilabel(app.GridLayout);
            app.Amplitude3EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude3EditFieldLabel.Layout.Row = 4;
            app.Amplitude3EditFieldLabel.Layout.Column = 4;
            app.Amplitude3EditFieldLabel.Text = 'Amplitude 3';

            % Create Amplitude3EditField
            app.Amplitude3EditField = uieditfield(app.GridLayout, 'numeric');
            app.Amplitude3EditField.ValueChangedFcn = createCallbackFcn(app, @Amplitude3EditFieldValueChanged, true);
            app.Amplitude3EditField.Layout.Row = 4;
            app.Amplitude3EditField.Layout.Column = 5;

            % Create offset3EditFieldLabel
            app.offset3EditFieldLabel = uilabel(app.GridLayout);
            app.offset3EditFieldLabel.HorizontalAlignment = 'right';
            app.offset3EditFieldLabel.Layout.Row = 4;
            app.offset3EditFieldLabel.Layout.Column = 6;
            app.offset3EditFieldLabel.Text = 'offset 3';

            % Create offset3EditField
            app.offset3EditField = uieditfield(app.GridLayout, 'numeric');
            app.offset3EditField.ValueChangedFcn = createCallbackFcn(app, @offset3EditFieldValueChanged, true);
            app.offset3EditField.Layout.Row = 4;
            app.offset3EditField.Layout.Column = 7;

            % Create method3DropDownLabel
            app.method3DropDownLabel = uilabel(app.GridLayout);
            app.method3DropDownLabel.HorizontalAlignment = 'right';
            app.method3DropDownLabel.Layout.Row = 4;
            app.method3DropDownLabel.Layout.Column = 8;
            app.method3DropDownLabel.Text = 'method 3';

            % Create method3DropDown
            app.method3DropDown = uidropdown(app.GridLayout);
            app.method3DropDown.Items = {'linear', 'quadratic', 'logarithmic'};
            app.method3DropDown.ValueChangedFcn = createCallbackFcn(app, @method3DropDownValueChanged, true);
            app.method3DropDown.Layout.Row = 4;
            app.method3DropDown.Layout.Column = 9;
            app.method3DropDown.Value = 'linear';

            % Create Reversepolarity4Button
            app.Reversepolarity4Button = uibutton(app.GridLayout, 'state');
            app.Reversepolarity4Button.ValueChangedFcn = createCallbackFcn(app, @Reversepolarity4ButtonValueChanged2, true);
            app.Reversepolarity4Button.Text = 'Reverse polarity 4';
            app.Reversepolarity4Button.Layout.Row = 5;
            app.Reversepolarity4Button.Layout.Column = 3;

            % Create Amplitude4EditFieldLabel
            app.Amplitude4EditFieldLabel = uilabel(app.GridLayout);
            app.Amplitude4EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude4EditFieldLabel.Layout.Row = 5;
            app.Amplitude4EditFieldLabel.Layout.Column = 4;
            app.Amplitude4EditFieldLabel.Text = 'Amplitude 4';

            % Create Amplitude4EditField
            app.Amplitude4EditField = uieditfield(app.GridLayout, 'numeric');
            app.Amplitude4EditField.ValueChangedFcn = createCallbackFcn(app, @Amplitude4EditFieldValueChanged, true);
            app.Amplitude4EditField.Layout.Row = 5;
            app.Amplitude4EditField.Layout.Column = 5;

            % Create offset4EditFieldLabel
            app.offset4EditFieldLabel = uilabel(app.GridLayout);
            app.offset4EditFieldLabel.HorizontalAlignment = 'right';
            app.offset4EditFieldLabel.Layout.Row = 5;
            app.offset4EditFieldLabel.Layout.Column = 6;
            app.offset4EditFieldLabel.Text = 'offset 4';

            % Create offset4EditField
            app.offset4EditField = uieditfield(app.GridLayout, 'numeric');
            app.offset4EditField.ValueChangedFcn = createCallbackFcn(app, @offset4EditFieldValueChanged, true);
            app.offset4EditField.Layout.Row = 5;
            app.offset4EditField.Layout.Column = 7;

            % Create method4DropDownLabel
            app.method4DropDownLabel = uilabel(app.GridLayout);
            app.method4DropDownLabel.HorizontalAlignment = 'right';
            app.method4DropDownLabel.Layout.Row = 5;
            app.method4DropDownLabel.Layout.Column = 8;
            app.method4DropDownLabel.Text = 'method 4';

            % Create method4DropDown
            app.method4DropDown = uidropdown(app.GridLayout);
            app.method4DropDown.Items = {'linear', 'quadratic', 'logarithmic'};
            app.method4DropDown.ValueChangedFcn = createCallbackFcn(app, @method4DropDownValueChanged, true);
            app.method4DropDown.Layout.Row = 5;
            app.method4DropDown.Layout.Column = 9;
            app.method4DropDown.Value = 'linear';

            % Create TriggerCheckBox
            app.TriggerCheckBox = uicheckbox(app.GridLayout);
            app.TriggerCheckBox.ValueChangedFcn = createCallbackFcn(app, @TriggerCheckBoxValueChanged, true);
            app.TriggerCheckBox.Text = 'Trigger';
            app.TriggerCheckBox.Layout.Row = 1;
            app.TriggerCheckBox.Layout.Column = 1;
            app.TriggerCheckBox.Value = true;

            % Create Trigger1EditFieldLabel
            app.Trigger1EditFieldLabel = uilabel(app.GridLayout);
            app.Trigger1EditFieldLabel.HorizontalAlignment = 'right';
            app.Trigger1EditFieldLabel.Layout.Row = 2;
            app.Trigger1EditFieldLabel.Layout.Column = 1;
            app.Trigger1EditFieldLabel.Text = 'Trigger 1';

            % Create Trigger1EditField
            app.Trigger1EditField = uieditfield(app.GridLayout, 'numeric');
            app.Trigger1EditField.ValueChangedFcn = createCallbackFcn(app, @Trigger1EditFieldValueChanged, true);
            app.Trigger1EditField.Layout.Row = 2;
            app.Trigger1EditField.Layout.Column = 2;
            app.Trigger1EditField.Value = 5;

            % Create kVLabel_4
            app.kVLabel_4 = uilabel(app.GridLayout);
            app.kVLabel_4.HorizontalAlignment = 'center';
            app.kVLabel_4.Layout.Row = 1;
            app.kVLabel_4.Layout.Column = 2;
            app.kVLabel_4.Text = 'kV';

            % Create Trigger2EditFieldLabel
            app.Trigger2EditFieldLabel = uilabel(app.GridLayout);
            app.Trigger2EditFieldLabel.HorizontalAlignment = 'right';
            app.Trigger2EditFieldLabel.Layout.Row = 3;
            app.Trigger2EditFieldLabel.Layout.Column = 1;
            app.Trigger2EditFieldLabel.Text = 'Trigger 2';

            % Create Trigger2EditField
            app.Trigger2EditField = uieditfield(app.GridLayout, 'numeric');
            app.Trigger2EditField.ValueChangedFcn = createCallbackFcn(app, @Trigger2EditFieldValueChanged, true);
            app.Trigger2EditField.Layout.Row = 3;
            app.Trigger2EditField.Layout.Column = 2;

            % Create Trigger3EditFieldLabel
            app.Trigger3EditFieldLabel = uilabel(app.GridLayout);
            app.Trigger3EditFieldLabel.HorizontalAlignment = 'right';
            app.Trigger3EditFieldLabel.Layout.Row = 4;
            app.Trigger3EditFieldLabel.Layout.Column = 1;
            app.Trigger3EditFieldLabel.Text = 'Trigger 3';

            % Create Trigger3EditField
            app.Trigger3EditField = uieditfield(app.GridLayout, 'numeric');
            app.Trigger3EditField.ValueChangedFcn = createCallbackFcn(app, @Trigger3EditFieldValueChanged, true);
            app.Trigger3EditField.Layout.Row = 4;
            app.Trigger3EditField.Layout.Column = 2;

            % Create Trigger4EditFieldLabel
            app.Trigger4EditFieldLabel = uilabel(app.GridLayout);
            app.Trigger4EditFieldLabel.HorizontalAlignment = 'right';
            app.Trigger4EditFieldLabel.Layout.Row = 5;
            app.Trigger4EditFieldLabel.Layout.Column = 1;
            app.Trigger4EditFieldLabel.Text = 'Trigger 4';

            % Create Trigger4EditField
            app.Trigger4EditField = uieditfield(app.GridLayout, 'numeric');
            app.Trigger4EditField.ValueChangedFcn = createCallbackFcn(app, @Trigger4EditFieldValueChanged, true);
            app.Trigger4EditField.Layout.Row = 5;
            app.Trigger4EditField.Layout.Column = 2;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = signalGenerator_sweep_exported

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