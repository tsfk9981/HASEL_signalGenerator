classdef signalGenerator_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        txPwEditField                   matlab.ui.control.NumericEditField
        txPwEditFieldLabel              matlab.ui.control.Label
        expoEditField                   matlab.ui.control.NumericEditField
        expoEditField_2Label            matlab.ui.control.Label
        DAQButtonGroup                  matlab.ui.container.ButtonGroup
        outputs4Button                  matlab.ui.control.RadioButton
        outputs2Button                  matlab.ui.control.RadioButton
        FilenamesPanel                  matlab.ui.container.Panel
        GridLayout8                     matlab.ui.container.GridLayout
        GoButton                        matlab.ui.control.StateButton
        SelectfilepathEditField         matlab.ui.control.EditField
        SelectfilepathEditFieldLabel    matlab.ui.control.Label
        BrowseButton                    matlab.ui.control.Button
        ProcessedfilenameEditField      matlab.ui.control.EditField
        ProcessedfilenameLabel          matlab.ui.control.Label
        RawfileprefixEditField          matlab.ui.control.EditField
        RawfileprefixEditFieldLabel     matlab.ui.control.Label
        WavesettingsPanel               matlab.ui.container.Panel
        GridLayout                      matlab.ui.container.GridLayout
        delayCheckBox                   matlab.ui.control.CheckBox
        rampspeed4EditField             matlab.ui.control.NumericEditField
        rampspeed4EditFieldLabel        matlab.ui.control.Label
        rampspeed3EditField             matlab.ui.control.NumericEditField
        rampspeed3EditFieldLabel        matlab.ui.control.Label
        rampspeed2EditField             matlab.ui.control.NumericEditField
        rampspeed2EditFieldLabel        matlab.ui.control.Label
        forrampLabel                    matlab.ui.control.Label
        forstepLabel                    matlab.ui.control.Label
        kVsLabel                        matlab.ui.control.Label
        rampspeed1EditField             matlab.ui.control.NumericEditField
        rampspeed1EditFieldLabel        matlab.ui.control.Label
        Label                           matlab.ui.control.Label
        dutyratio4EditField             matlab.ui.control.NumericEditField
        dutyratio4EditFieldLabel        matlab.ui.control.Label
        dutyratio3EditField             matlab.ui.control.NumericEditField
        dutyratio3EditFieldLabel        matlab.ui.control.Label
        dutyratio2EditField             matlab.ui.control.NumericEditField
        dutyratio2EditFieldLabel        matlab.ui.control.Label
        dutyratio1EditField             matlab.ui.control.NumericEditField
        dutyratio1EditFieldLabel        matlab.ui.control.Label
        HVamplifierLabel                matlab.ui.control.Label
        muscleLabel                     matlab.ui.control.Label
        methodLabel                     matlab.ui.control.Label
        method4DropDown                 matlab.ui.control.DropDown
        method4DropDownLabel            matlab.ui.control.Label
        method3DropDown                 matlab.ui.control.DropDown
        method3DropDownLabel            matlab.ui.control.Label
        method2DropDown                 matlab.ui.control.DropDown
        method2DropDownLabel            matlab.ui.control.Label
        method1DropDown                 matlab.ui.control.DropDown
        method1DropDownLabel            matlab.ui.control.Label
        Trek3Label_4                    matlab.ui.control.Label
        Trek4Label_4                    matlab.ui.control.Label
        PolyKLabel_2                    matlab.ui.control.Label
        Trek0Label                      matlab.ui.control.Label
        HNLabel                         matlab.ui.control.Label
        KPLabel                         matlab.ui.control.Label
        KNLabel_2                       matlab.ui.control.Label
        HPLabel_2                       matlab.ui.control.Label
        delay4EditField                 matlab.ui.control.NumericEditField
        delay4EditFieldLabel            matlab.ui.control.Label
        delay3EditField                 matlab.ui.control.NumericEditField
        delay3EditFieldLabel            matlab.ui.control.Label
        delay2EditField                 matlab.ui.control.NumericEditField
        delay2EditFieldLabel            matlab.ui.control.Label
        delay1EditField                 matlab.ui.control.NumericEditField
        delay1EditFieldLabel            matlab.ui.control.Label
        gain4EditField                  matlab.ui.control.NumericEditField
        gain4EditFieldLabel             matlab.ui.control.Label
        gain3EditField                  matlab.ui.control.NumericEditField
        gain3EditFieldLabel             matlab.ui.control.Label
        gain2EditField                  matlab.ui.control.NumericEditField
        gain2EditFieldLabel             matlab.ui.control.Label
        gain1EditField                  matlab.ui.control.NumericEditField
        gain1EditFieldLabel             matlab.ui.control.Label
        degLabel                        matlab.ui.control.Label
        kVVLabel                        matlab.ui.control.Label
        Lamp                            matlab.ui.control.Lamp
        MonitorlimittripstatusCheckBox  matlab.ui.control.CheckBox
        PressStopwhentestiscompletedtosavedataLabel  matlab.ui.control.Label
        CalibrationPanel                matlab.ui.container.Panel
        GridLayout2                     matlab.ui.container.GridLayout
        MTlengthconstantkLEditField     matlab.ui.control.NumericEditField
        MTlengthconstantkLLabel         matlab.ui.control.Label
        MTforceconstantkFEditField      matlab.ui.control.NumericEditField
        MTforceconstantkFLabel          matlab.ui.control.Label
        TREKvoltageconstantkVEditField  matlab.ui.control.NumericEditField
        TREKvoltageconstantkVLabel      matlab.ui.control.Label
        SamplerateEditField             matlab.ui.control.NumericEditField
        SamplerateEditFieldLabel        matlab.ui.control.Label
        mmVLabel                        matlab.ui.control.Label
        NVLabel                         matlab.ui.control.Label
        VkVLabel                        matlab.ui.control.Label
        HzLabel                         matlab.ui.control.Label
        VoltageParametersPanel          matlab.ui.container.Panel
        GridLayout7                     matlab.ui.container.GridLayout
        frequencyEditField              matlab.ui.control.NumericEditField
        frequencyEditFieldLabel         matlab.ui.control.Label
        TotaltimeEditField              matlab.ui.control.NumericEditField
        TotaltimeEditFieldLabel         matlab.ui.control.Label
        MaxvoltageEditField             matlab.ui.control.NumericEditField
        MaxvoltageEditFieldLabel        matlab.ui.control.Label
        ReversepolarityCheckBox         matlab.ui.control.CheckBox
        HzLabel_5                       matlab.ui.control.Label
        sLabel                          matlab.ui.control.Label
        kVLabel                         matlab.ui.control.Label
        SaverawfileCheckBox             matlab.ui.control.CheckBox
        SetupPanel_2                    matlab.ui.container.Panel
        GridLayout4                     matlab.ui.container.GridLayout
        GridLayout6                     matlab.ui.container.GridLayout
        kneeLabel                       matlab.ui.control.Label
        encoderLabel_2                  matlab.ui.control.Label
        AI17Label                       matlab.ui.control.Label
        hipLabel                        matlab.ui.control.Label
        encoderLabel                    matlab.ui.control.Label
        AI16Label                       matlab.ui.control.Label
        currentmonitorLabel_4           matlab.ui.control.Label
        Trek4Label_3                    matlab.ui.control.Label
        AI7Label                        matlab.ui.control.Label
        voltagemonitorLabel_11          matlab.ui.control.Label
        Trek4Label_2                    matlab.ui.control.Label
        AI6Label                        matlab.ui.control.Label
        currentmonitorLabel_3           matlab.ui.control.Label
        Trek3Label_3                    matlab.ui.control.Label
        AI5Label                        matlab.ui.control.Label
        voltagemonitorLabel_10          matlab.ui.control.Label
        Trek3Label_2                    matlab.ui.control.Label
        AI4Label                        matlab.ui.control.Label
        currentmonitorLabel_2           matlab.ui.control.Label
        Trek2Label_3                    matlab.ui.control.Label
        AI3Label                        matlab.ui.control.Label
        voltagemonitorLabel_9           matlab.ui.control.Label
        Trek2Label_2                    matlab.ui.control.Label
        AI2Label                        matlab.ui.control.Label
        currentmonitorLabel             matlab.ui.control.Label
        Trek1Label_15                   matlab.ui.control.Label
        AI1Label                        matlab.ui.control.Label
        voltagemonitorLabel_8           matlab.ui.control.Label
        Trek1Label_14                   matlab.ui.control.Label
        AI0Label_8                      matlab.ui.control.Label
        GridLayout5                     matlab.ui.container.GridLayout
        voltageinLabel_4                matlab.ui.control.Label
        Trek4Label                      matlab.ui.control.Label
        voltageinLabel_3                matlab.ui.control.Label
        Trek3Label                      matlab.ui.control.Label
        voltageinLabel_2                matlab.ui.control.Label
        Trek2Label                      matlab.ui.control.Label
        voltageinLabel                  matlab.ui.control.Label
        Trek1Label_22                   matlab.ui.control.Label
        AO0Label_2                      matlab.ui.control.Label
        AO3Label_2                      matlab.ui.control.Label
        AO2Label_2                      matlab.ui.control.Label
        AO1Label_2                      matlab.ui.control.Label
        UIAxes                          matlab.ui.control.UIAxes
    end

    %% DAQ
    properties (Access = public)
        d;
        Arr;
        fullSignal;
        scanCount = 0;
        timeInit = 1;
        lastDataIndex = 0;
        kV;
        kI = 200; %todo: input from the panel
        kF;
        kL;
        type_DAQ = 2;
        rawFilename;
    end
    
    %% currentSense
    properties (Access = public)
        Data_Tag = uint8(['DATA']);%uint8([0xA0, 0x76, 0x4E, 0x41, 0xE6, 0x70]); %uint8([0xA0, 0x76, 0x4E, 0x41, 0xBD, 0xDC]);%  Description
        CurrentSenseDongle
        CurrentSense_recording = false
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
        function start_currentSense(app)
            if app.CurrentSense_recording == false
                app.CurrentSense_recording = true;
                app.CurrentSenseDongle.flush()
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');
                app.CurrentSenseDongle.write(uint8(1),'uint8');

                app.data = [];
                app.loss = [];
                app.packet_received = 0;
                app.packet_ind = [];
                %                 app.Label_Loss.Text = "";
                %                 app.Lamp.Color = 'green';
                app.first_meas = true;
                start(app.timerStreamHandle);
                start(app.timerPlotHandle);
                %start(app.timerPSDHandle);
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

                mac_names = dec2hex(app.sensor_mac_map(2,:));
                datastruct = cell2struct(app.data,mac_names,2);
                packetstruct = cell2struct(app.packet_ind,mac_names,2);

                assignin('base', ['CS_', datestr(now,'yyyy_mm_dd_HH_MM_SS_'),'data'], (datastruct));
                assignin('base', ['CS_', datestr(now,'yyyy_mm_dd_HH_MM_SS_'),'packets'], (packetstruct));


                Data = fillWithNan(app, app.data{1}, app.data{2});
                Packet = fillWithNan(app, app.packet_ind{1}, app.packet_ind{2});
                
                
                writetable(table(...
                    Data(:, 1),...
                    Data(:, 2),...
                    'VariableNames', ...
                    {...
                    mac_names(1, :),...
                    mac_names(2, :)...
                    }),...
                    [app.rawFilename, '_current_data.dat']);
                writetable(table(...
                    Packet(:, 1),...
                    Packet(:, 2),...
                    'VariableNames',...
                    {...
                    mac_names(1, :),...
                    mac_names(2, :)...
                    }),...
                    [app.rawFilename, '_current_packet.dat']);

                
                app.data = [];
                app.loss = [];
                app.packet_ind = [];
                stop(app.timerStreamHandle);
                stop(app.timerPlotHandle);
                stop(app.timerPSDHandle);
                app.CurrentSenseDongle.flush();
                %             app.Lamp.Color= 'red';
            end
        end
        function Data = fillWithNan(app, data1, data2)
            dataLength1 = length(data1);
            dataLength2 = length(data2);
            dataLengthMax = max([dataLength1, dataLength2]);
            data1_new = nan(dataLengthMax, 1);
            data2_new = nan(dataLengthMax, 1);
            data1_new(1: dataLength1) = data1;
            data2_new(1: dataLength2) = data2;
            Data = [data1_new, data2_new];

        end

    end

    %% DAQ
    methods (Access = private)

        function buildSignal(app)
            timeTotal = app.TotaltimeEditField.Value;
            sampRate = app.SamplerateEditField.Value;

            % Build voltage signals
            time = [-app.timeInit: 1/sampRate: timeTotal - 1/sampRate]';


            voltageSignal_1 = createBaseSignal(app, app.method1DropDown.Value, app.dutyratio1EditField.Value, app.rampspeed1EditField.Value, time);
            voltageSignal_2 = createBaseSignal(app, app.method2DropDown.Value, app.dutyratio2EditField.Value, app.rampspeed2EditField.Value, time);
            voltageSignal_3 = createBaseSignal(app, app.method3DropDown.Value, app.dutyratio3EditField.Value, app.rampspeed3EditField.Value, time);
            voltageSignal_4 = createBaseSignal(app, app.method4DropDown.Value, app.dutyratio4EditField.Value, app.rampspeed4EditField.Value, time);

            voltageSignal_1 = voltageSignal_1/app.gain1EditField.Value;
            voltageSignal_2 = voltageSignal_2/app.gain2EditField.Value;
            voltageSignal_3 = voltageSignal_3/app.gain3EditField.Value;
            voltageSignal_4 = voltageSignal_4/app.gain4EditField.Value;

            if app.delayCheckBox.Value

                voltageSignal_1 = shiftPhase(app, voltageSignal_1, app.delay1EditField.Value);
                voltageSignal_2 = shiftPhase(app, voltageSignal_2, app.delay2EditField.Value);
                voltageSignal_3 = shiftPhase(app, voltageSignal_3, app.delay3EditField.Value);
                voltageSignal_4 = shiftPhase(app, voltageSignal_4, app.delay4EditField.Value);

            end

            refSignal = zeros(size(time)); % dump signal, originally used for reference signal for TF estimation

            app.fullSignal = [time, refSignal, voltageSignal_1, voltageSignal_2, voltageSignal_3, voltageSignal_4];
        end

        function Out = createBaseSignal(app, method, dutyRatio, rampSpd, time)
            sampRate = app.SamplerateEditField.Value;
            frequency = app.frequencyEditField.Value/2;
            maxVoltage = app.MaxvoltageEditField.Value/app.kV;
            timeTotal = app.TotaltimeEditField.Value;
            totalSamples = (app.timeInit + timeTotal)*sampRate;

            signalBase = sin(time*2*pi*frequency);
            %             keyboard
            signalBase(time <= 0) = 0;
            mask = sign(signalBase);
            %             size(signalBase)
            %             size(mask)


            voltageSignal = zeros(size(signalBase));
            voltageSignal(signalBase > 0) = maxVoltage;
            voltageSignal(signalBase < 0) = -maxVoltage;
            voltageSignal(time <= 0) = 0;


            i = 0;
            indDurationCycle = fix(sampRate/2/frequency);

            switch method
                case 'sine'
                    expo = app.expoEditField.Value;
                    voltageSignal = signalBase.^expo*maxVoltage; % abs(signalBase.^3) is also fine if you want more smooth zero crossing
                    voltageSignal = voltageSignal.*mask;

                case 'step'
                    while 1
                        indStart = fix(app.timeInit*sampRate) + i*indDurationCycle + 1;
                        indEnd = fix(app.timeInit*sampRate) + (i+1)*indDurationCycle +1;

                        if indEnd <= totalSamples + 1
                            voltageSignal(indStart + fix(indDurationCycle*dutyRatio/100): min(indEnd, length(voltageSignal))) = 0;
                            i = i + 1;
                        elseif indStart <= length(voltageSignal)
                            voltageSignal(indStart: end) = 0;
                            break
                        else
                            break
                        end
                    end

                case 'ramped square'
                    while 1
                        indStart = fix(app.timeInit*sampRate) + i*indDurationCycle + 1;
                        indEnd = fix(app.timeInit*sampRate) + (i+1)*indDurationCycle + 1;

                        if indEnd <= totalSamples + 1
                            indDurationRamp = fix(maxVoltage/rampSpd*sampRate);
                            indDurationKeepOn = fix(indDurationCycle*dutyRatio/100);

                            indRampUpStart = indStart;
                            indKeepOnStart = indRampUpStart + indDurationRamp;
                            indRampDownStart = indKeepOnStart + indDurationKeepOn;
                            indRampDownEnd = indRampDownStart + indDurationRamp;

                            if indRampDownEnd >= indEnd
                                error('Error: 1 cycle is longer than the cycle frequency. DecreaSE the cycle frequency or increase ramp speed.')
                            end

                            voltageSignal(indRampUpStart: indKeepOnStart-1) = linspace(0, voltageSignal(indKeepOnStart), indDurationRamp);
                            %                             voltageSignal(indKeepOnStart: indRampDownStart-1) = maxVoltage;
                            voltageSignal(indRampDownStart: indRampDownEnd-1) = linspace(voltageSignal(indKeepOnStart), 0, indDurationRamp);
                            voltageSignal(indRampDownEnd: min(indEnd, length(voltageSignal))) = 0;

                            i = i + 1;
                        elseif indStart <= length(voltageSignal)
                            voltageSignal(indStart: end) = 0;
                            break
                        else
                            break
                        end
                    end
                    %                     voltageSignal = voltageSignal.*mask;

            end

            if app.ReversepolarityCheckBox.Value == 0
                voltageSignal = abs(voltageSignal);
            end
            Out = voltageSignal;
        end
        function Out = shiftPhase(app, Data, phase)
            sampRate = app.SamplerateEditField.Value;
            freq = app.frequencyEditField.Value;

            ind_signalStart = fix(app.timeInit*sampRate) + 1;

            Data_init = Data(1: ind_signalStart - 1);
            Data_signal = Data(ind_signalStart: end);

            ind_cut = length(Data_signal) - fix((phase/360)*sampRate/freq);

            if mod(length(Data_signal), sampRate/freq*2) ~= 0
                error('error: time duration must fit to end of base signal')
            end

            Data_signal_sifted = [Data_signal(ind_cut: end); Data_signal(1: ind_cut - 1)];

            Out = [Data_init; Data_signal_sifted];


            %             length(Out)
            % todo handling exceptions when phase = 0 or 360
        end


        function buildPreview(app)
            sampRate = app.SamplerateEditField.Value;
            maxVoltage = app.MaxvoltageEditField.Value;

            buildSignal(app);
%             time = linspace(0, length(app.fullSignal)/sampRate, length(app.fullSignal));

            cla(app.UIAxes, "reset")
            title(app.UIAxes, 'prescribed signals')
            hold(app.UIAxes, "on")
            plot(app.UIAxes, app.fullSignal(:, 1), app.fullSignal(:, 3)*app.kV);
            plot(app.UIAxes, app.fullSignal(:, 1), app.fullSignal(:, 4)*app.kV);
            plot(app.UIAxes, app.fullSignal(:, 1), app.fullSignal(:, 5)*app.kV);
            plot(app.UIAxes, app.fullSignal(:, 1), app.fullSignal(:, 6)*app.kV);
            ylim(app.UIAxes, [(-1.5)*maxVoltage, 1.5*maxVoltage])
            ylabel(app.UIAxes, 'Voltage (kV)');
            grid(app.UIAxes, 'on')



        end

        function storeData(app, ~, ~)
            % This function is called every n = scansAvailableFcnCount data
            % points read by the DAQ

            numScansAvailable = app.d.NumScansAvailable;
            if numScansAvailable == 0
                return;
            end
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


            % stop the sequential plot when it is heavy to process
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


            %             trip = scanData(end, 4);
            %             % channel 4 is limit/trip status
            %             if trip < 4 && app.MonitorlimittripstatusCheckBox.Value
            %                 app.Lamp.Color = 'red';
            %                 app.GoButton.Value = 0;
            %                 GoButtonValueChanged(app);
            %             end


            if endIndex == length(app.Arr.time)
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
            % Stop the DAQ
            if app.d.Running
                stop(app.d);
            end

            % stop the currentSense
            %                 currentSense_stop(app);

            % Read residual data from DAQ
            if app.d.NumScansAvailable > 0
                storeData(app, app.d, 0);
            end
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

        function check_fname(app)

            % Check for valid filenames
            if app.ProcessedfilenameEditField == ""
                uiwait(msgbox("Empty filename", "Error", 'modal'));
                app.GoButton.Value = 0;
                buildPreview(app);
                return
            elseif app.SaverawfileCheckBox.Value && app.RawfileprefixEditField == ""
                uiwait(msgbox("Empty filename", "Error", 'modal'));
                app.GoButton.Value = 0;
                buildPreview(app);
                return
            end


            % Check for valid filenames
            if app.SaverawfileCheckBox.Value && app.RawfileprefixEditField.Value == ""
                uiwait(msgbox("Empty filename", "Error", 'modal'));
                app.GoButton.Value = 0;
                return
            elseif app.ProcessedfilenameEditField.Value == ""
                uiwait(msgbox("Empty filename", "Error", 'modal'));
                app.GoButton.Value = 0;
                return
            end
        end

        function saveDAQ(app)

            % file saves
            if app.SaverawfileCheckBox.Value
                writetable(table(...
                    app.Arr.time,...
                    app.Arr.voltageRef1*app.kV,...
                    app.Arr.voltageRef2*app.kV,...
                    app.Arr.voltageRef3*app.kV,...
                    app.Arr.voltageRef4*app.kV,...
                    app.Arr.voltage1*app.kV,...
                    app.Arr.current1*app.kI,...
                    app.Arr.voltage2*app.kV,...
                    app.Arr.current2*app.kI,...
                    app.Arr.voltage3*app.kV,...
                    app.Arr.current3*app.kI,...
                    app.Arr.voltage4*app.kV,...
                    app.Arr.current4*app.kI,...
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
            %                 processedFilename = fullfile(app.SelectfilepathEditField.Value, [app.ProcessedfilenameEditField.Value ,'_sineSweep_', textPara]);
            %                 writetable(table(processedCurve(:, 1), processedCurve(:, 2), processedCurve(:, 3), 'VariableNames',...
            %                     {'Frequency [Hz]', 'Amplitude [dB]', 'Phase [deg]'}), processedFilename);
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
            stop_DAQ(app);
            goButtonSaving(app);
            plot_result(app);
            saveDAQ(app)

            % Fush the DAQ and ensure zero voltage
            flush(app.d);
            if app.type_DAQ == 4
                write(app.d, [0, 0, 0, 0]);
            else
                write(app.d, [0, 0]);
            end

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

            if app.DAQButtonGroup.SelectedObject.Text == "4 outputs"
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
                num2str(app.MaxvoltageEditField.Value*10,   '%02.0f'), 'kV_',...
                num2str(app.frequencyEditField.Value*10, '%03.0f'), 'Hz_',...
                num2str(app.SamplerateEditField.Value,   '%04.0f'), 'Hz_',...
                num2str(app.dutyratio2EditField.Value,   '%04.0f'), 'duty_',...
                num2str(app.expoEditField.Value,         '%02.0f'), 'exp_',...
                num2str(app.delay1EditField.Value,       '%03.0f'), 'deg_',...
                num2str(app.delay2EditField.Value,       '%03.0f'), 'deg_',...
                num2str(app.delay3EditField.Value,       '%03.0f'), 'deg_',...
                num2str(app.delay4EditField.Value,       '%03.0f'), 'deg_',...
                ];
            app.rawFilename = fullfile(app.SelectfilepathEditField.Value,...
                [app.RawfileprefixEditField.Value, app.ProcessedfilenameEditField.Value, '_', textPara, datestr(now,'yyyy_mm_dd_HHMM_SS')]);

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
            app.kV = app.TREKvoltageconstantkVEditField.Value;
            app.kF = app.MTforceconstantkFEditField.Value;
            app.kL = app.MTlengthconstantkLEditField.Value;

            app.RawfileprefixEditField.Enable = 0;


            
            if app.MonitorlimittripstatusCheckBox.Value
                app.Lamp.Enable = 1;
                app.Lamp.Color = 'green';
            else
                app.Lamp.Enable = 0;
                app.Lamp.Color = [0.96, 0.96, 0.96];
            end

            buildPreview(app);

            goButtonReady(app);



            %% currentSense
            app.TS = 1/app.FS;

            app.timerStreamHandle = timer('TimerFcn', {@app.timerStreamCallback}, 'ExecutionMode', 'FixedRate', 'Period', 0.1,'StartDelay',.1);
            app.timerPlotHandle = timer('TimerFcn', {@app.timerPlotCallback}, 'ExecutionMode', 'FixedRate', 'Period', .3,'StartDelay',0.5);
            app.timerPSDHandle = timer('TimerFcn', {@app.timerPSDCallback}, 'ExecutionMode', 'FixedRate', 'Period', 5,'StartDelay',15);

            %             app.UIAxesPSD.Visible = 'off';
            app.GridLayout2.ColumnWidth = [{'1x'},0];


            SERIAL_PORT = 'COM4';       % change to device port
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

        % Value changed function: SaverawfileCheckBox
        function SaverawfileCheckBoxValueChanged(app, event)
            if app.SaverawfileCheckBox.Value
                app.RawfileprefixEditField.Enable = 1;
            else
                app.RawfileprefixEditField.Enable = 0;
            end
        end

        % Value changed function: SamplerateEditField
        function SamplerateEditFieldValueChanged(app, event)
            app.d.Rate = app.SamplerateEditField.Value;
            % change scansAvailableFcnCount here
        end

        % Value changed function: TREKvoltageconstantkVEditField
        function TREKvoltageconstantkVEditFieldValueChanged(app, event)
            app.kV = app.TREKvoltageconstantkVEditField.Value;
        end

        % Value changed function: MTforceconstantkFEditField
        function MTforceconstantkFEditFieldValueChanged(app, event)
            app.kF = app.MTforceconstantkFEditField.Value;
        end

        % Value changed function: MTlengthconstantkLEditField
        function MTlengthconstantkLEditFieldValueChanged(app, event)
            app.kL = app.MTlengthconstantkLEditField.Value;
        end

        % Callback function
        function MinfrequencyEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: MaxvoltageEditField
        function MaxvoltageEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function NumberofvoltcyclesperstepEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: ReversepolarityCheckBox
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
            if app.NumberofforcestepsEditField.Value == 1
                app.LogdistributionCheckBox.Value = 0;
                app.LogdistributionCheckBox.Enable = 0;
            elseif ~app.LogdistributionCheckBox.Enable
                app.LogdistributionCheckBox.Enable = 1;
            end

            buildPreview(app);
        end

        % Value changed function: MonitorlimittripstatusCheckBox
        function MonitorlimittripstatusCheckBoxValueChanged(app, event)
            if app.MonitorlimittripstatusCheckBox.Value
                app.Lamp.Enable = 1;
                app.Lamp.Color = 'green';
            else
                app.Lamp.Enable = 0;
                app.Lamp.Color = [0.96, 0.96, 0.96];
            end
        end

        % Callback function
        function methodDropDownValueChanged(app, event)
            switch app.methodDropDown.Value
                case 'logarithmic'
                    app.MinfrequencyEditField.Value = max(0.01, app.MinfrequencyEditField.Value);
            end
            buildPreview(app);
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

        % Value changed function: frequencyEditField
        function frequencyEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: dutyratio1EditField
        function dutyratio1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function rampSpeedValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: rampspeed1EditField
        function rampspeed1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: gain1EditField
        function gain1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: gain2EditField
        function gain2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: gain3EditField
        function gain3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: gain4EditField
        function gain4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: delay1EditField
        function delay1EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: delay2EditField
        function delay2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: delay3EditField
        function delay3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: delay4EditField
        function delay4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: method1DropDown
        function method1DropDownValueChanged(app, event)
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

        % Value changed function: dutyratio2EditField
        function dutyratio2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: dutyratio3EditField
        function dutyratio3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: dutyratio4EditField
        function dutyratio4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: rampspeed2EditField
        function rampspeed2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: rampspeed3EditField
        function rampspeed3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: rampspeed4EditField
        function rampspeed4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: delayCheckBox
        function delayCheckBoxValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function expoEditFieldValueChanging(app, event)
            buildPreview(app);
        end

        % Value changed function: expoEditField
        function expoEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function CurrentSenseSwitchValueChanged(app, event)

        end

        % Value changed function: txPwEditField
        function txPwEditFieldValueChanged(app, event)
            value = app.txPwEditField.Value;
            app.CurrentSenseDongle.write(value,'uint8');
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1452 775];
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
            app.UIAxes.Position = [24 483 1099 270];

            % Create SetupPanel_2
            app.SetupPanel_2 = uipanel(app.UIFigure);
            app.SetupPanel_2.TitlePosition = 'centertop';
            app.SetupPanel_2.Title = 'Setup';
            app.SetupPanel_2.FontWeight = 'bold';
            app.SetupPanel_2.FontSize = 14;
            app.SetupPanel_2.Position = [1184 101 231 646];

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.SetupPanel_2);
            app.GridLayout4.ColumnWidth = {'1x'};
            app.GridLayout4.RowHeight = {'fit', '1x'};

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.GridLayout4);
            app.GridLayout5.ColumnWidth = {'fit', 'fit', 'fit'};
            app.GridLayout5.RowHeight = {'1x', '1x', '1x', '1x'};
            app.GridLayout5.Layout.Row = 1;
            app.GridLayout5.Layout.Column = 1;

            % Create AO1Label_2
            app.AO1Label_2 = uilabel(app.GridLayout5);
            app.AO1Label_2.Layout.Row = 1;
            app.AO1Label_2.Layout.Column = 1;
            app.AO1Label_2.Text = 'AO1';

            % Create AO2Label_2
            app.AO2Label_2 = uilabel(app.GridLayout5);
            app.AO2Label_2.Layout.Row = 2;
            app.AO2Label_2.Layout.Column = 1;
            app.AO2Label_2.Text = 'AO2';

            % Create AO3Label_2
            app.AO3Label_2 = uilabel(app.GridLayout5);
            app.AO3Label_2.Layout.Row = 3;
            app.AO3Label_2.Layout.Column = 1;
            app.AO3Label_2.Text = 'AO3';

            % Create AO0Label_2
            app.AO0Label_2 = uilabel(app.GridLayout5);
            app.AO0Label_2.Layout.Row = 4;
            app.AO0Label_2.Layout.Column = 1;
            app.AO0Label_2.Text = 'AO0';

            % Create Trek1Label_22
            app.Trek1Label_22 = uilabel(app.GridLayout5);
            app.Trek1Label_22.Layout.Row = 1;
            app.Trek1Label_22.Layout.Column = 2;
            app.Trek1Label_22.Text = 'Trek 1';

            % Create voltageinLabel
            app.voltageinLabel = uilabel(app.GridLayout5);
            app.voltageinLabel.Layout.Row = 1;
            app.voltageinLabel.Layout.Column = 3;
            app.voltageinLabel.Text = 'voltage in';

            % Create Trek2Label
            app.Trek2Label = uilabel(app.GridLayout5);
            app.Trek2Label.Layout.Row = 2;
            app.Trek2Label.Layout.Column = 2;
            app.Trek2Label.Text = 'Trek 2';

            % Create voltageinLabel_2
            app.voltageinLabel_2 = uilabel(app.GridLayout5);
            app.voltageinLabel_2.Layout.Row = 2;
            app.voltageinLabel_2.Layout.Column = 3;
            app.voltageinLabel_2.Text = 'voltage in';

            % Create Trek3Label
            app.Trek3Label = uilabel(app.GridLayout5);
            app.Trek3Label.Layout.Row = 3;
            app.Trek3Label.Layout.Column = 2;
            app.Trek3Label.Text = 'Trek 3';

            % Create voltageinLabel_3
            app.voltageinLabel_3 = uilabel(app.GridLayout5);
            app.voltageinLabel_3.Layout.Row = 3;
            app.voltageinLabel_3.Layout.Column = 3;
            app.voltageinLabel_3.Text = 'voltage in';

            % Create Trek4Label
            app.Trek4Label = uilabel(app.GridLayout5);
            app.Trek4Label.Layout.Row = 4;
            app.Trek4Label.Layout.Column = 2;
            app.Trek4Label.Text = 'Trek 4';

            % Create voltageinLabel_4
            app.voltageinLabel_4 = uilabel(app.GridLayout5);
            app.voltageinLabel_4.Layout.Row = 4;
            app.voltageinLabel_4.Layout.Column = 3;
            app.voltageinLabel_4.Text = 'voltage in';

            % Create GridLayout6
            app.GridLayout6 = uigridlayout(app.GridLayout4);
            app.GridLayout6.ColumnWidth = {'fit', 'fit', 'fit'};
            app.GridLayout6.RowHeight = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
            app.GridLayout6.Layout.Row = 2;
            app.GridLayout6.Layout.Column = 1;

            % Create AI0Label_8
            app.AI0Label_8 = uilabel(app.GridLayout6);
            app.AI0Label_8.Layout.Row = 1;
            app.AI0Label_8.Layout.Column = 1;
            app.AI0Label_8.Text = 'AI0';

            % Create Trek1Label_14
            app.Trek1Label_14 = uilabel(app.GridLayout6);
            app.Trek1Label_14.Layout.Row = 1;
            app.Trek1Label_14.Layout.Column = 2;
            app.Trek1Label_14.Text = 'Trek 1';

            % Create voltagemonitorLabel_8
            app.voltagemonitorLabel_8 = uilabel(app.GridLayout6);
            app.voltagemonitorLabel_8.Layout.Row = 1;
            app.voltagemonitorLabel_8.Layout.Column = 3;
            app.voltagemonitorLabel_8.Text = 'voltage monitor';

            % Create AI1Label
            app.AI1Label = uilabel(app.GridLayout6);
            app.AI1Label.Layout.Row = 2;
            app.AI1Label.Layout.Column = 1;
            app.AI1Label.Text = 'AI1';

            % Create Trek1Label_15
            app.Trek1Label_15 = uilabel(app.GridLayout6);
            app.Trek1Label_15.Layout.Row = 2;
            app.Trek1Label_15.Layout.Column = 2;
            app.Trek1Label_15.Text = 'Trek 1';

            % Create currentmonitorLabel
            app.currentmonitorLabel = uilabel(app.GridLayout6);
            app.currentmonitorLabel.Layout.Row = 2;
            app.currentmonitorLabel.Layout.Column = 3;
            app.currentmonitorLabel.Text = 'current monitor';

            % Create AI2Label
            app.AI2Label = uilabel(app.GridLayout6);
            app.AI2Label.Layout.Row = 3;
            app.AI2Label.Layout.Column = 1;
            app.AI2Label.Text = 'AI2';

            % Create Trek2Label_2
            app.Trek2Label_2 = uilabel(app.GridLayout6);
            app.Trek2Label_2.Layout.Row = 3;
            app.Trek2Label_2.Layout.Column = 2;
            app.Trek2Label_2.Text = 'Trek 2';

            % Create voltagemonitorLabel_9
            app.voltagemonitorLabel_9 = uilabel(app.GridLayout6);
            app.voltagemonitorLabel_9.Layout.Row = 3;
            app.voltagemonitorLabel_9.Layout.Column = 3;
            app.voltagemonitorLabel_9.Text = 'voltage monitor';

            % Create AI3Label
            app.AI3Label = uilabel(app.GridLayout6);
            app.AI3Label.Layout.Row = 4;
            app.AI3Label.Layout.Column = 1;
            app.AI3Label.Text = 'AI3';

            % Create Trek2Label_3
            app.Trek2Label_3 = uilabel(app.GridLayout6);
            app.Trek2Label_3.Layout.Row = 4;
            app.Trek2Label_3.Layout.Column = 2;
            app.Trek2Label_3.Text = 'Trek 2';

            % Create currentmonitorLabel_2
            app.currentmonitorLabel_2 = uilabel(app.GridLayout6);
            app.currentmonitorLabel_2.Layout.Row = 4;
            app.currentmonitorLabel_2.Layout.Column = 3;
            app.currentmonitorLabel_2.Text = 'current monitor';

            % Create AI4Label
            app.AI4Label = uilabel(app.GridLayout6);
            app.AI4Label.Layout.Row = 5;
            app.AI4Label.Layout.Column = 1;
            app.AI4Label.Text = 'AI4';

            % Create Trek3Label_2
            app.Trek3Label_2 = uilabel(app.GridLayout6);
            app.Trek3Label_2.Layout.Row = 5;
            app.Trek3Label_2.Layout.Column = 2;
            app.Trek3Label_2.Text = 'Trek 3';

            % Create voltagemonitorLabel_10
            app.voltagemonitorLabel_10 = uilabel(app.GridLayout6);
            app.voltagemonitorLabel_10.Layout.Row = 5;
            app.voltagemonitorLabel_10.Layout.Column = 3;
            app.voltagemonitorLabel_10.Text = 'voltage monitor';

            % Create AI5Label
            app.AI5Label = uilabel(app.GridLayout6);
            app.AI5Label.Layout.Row = 6;
            app.AI5Label.Layout.Column = 1;
            app.AI5Label.Text = 'AI5';

            % Create Trek3Label_3
            app.Trek3Label_3 = uilabel(app.GridLayout6);
            app.Trek3Label_3.Layout.Row = 6;
            app.Trek3Label_3.Layout.Column = 2;
            app.Trek3Label_3.Text = 'Trek 3';

            % Create currentmonitorLabel_3
            app.currentmonitorLabel_3 = uilabel(app.GridLayout6);
            app.currentmonitorLabel_3.Layout.Row = 6;
            app.currentmonitorLabel_3.Layout.Column = 3;
            app.currentmonitorLabel_3.Text = 'current monitor';

            % Create AI6Label
            app.AI6Label = uilabel(app.GridLayout6);
            app.AI6Label.Layout.Row = 7;
            app.AI6Label.Layout.Column = 1;
            app.AI6Label.Text = 'AI6';

            % Create Trek4Label_2
            app.Trek4Label_2 = uilabel(app.GridLayout6);
            app.Trek4Label_2.Layout.Row = 7;
            app.Trek4Label_2.Layout.Column = 2;
            app.Trek4Label_2.Text = 'Trek 4';

            % Create voltagemonitorLabel_11
            app.voltagemonitorLabel_11 = uilabel(app.GridLayout6);
            app.voltagemonitorLabel_11.Layout.Row = 7;
            app.voltagemonitorLabel_11.Layout.Column = 3;
            app.voltagemonitorLabel_11.Text = 'voltage monitor';

            % Create AI7Label
            app.AI7Label = uilabel(app.GridLayout6);
            app.AI7Label.Layout.Row = 8;
            app.AI7Label.Layout.Column = 1;
            app.AI7Label.Text = 'AI7';

            % Create Trek4Label_3
            app.Trek4Label_3 = uilabel(app.GridLayout6);
            app.Trek4Label_3.Layout.Row = 8;
            app.Trek4Label_3.Layout.Column = 2;
            app.Trek4Label_3.Text = 'Trek 4';

            % Create currentmonitorLabel_4
            app.currentmonitorLabel_4 = uilabel(app.GridLayout6);
            app.currentmonitorLabel_4.Layout.Row = 8;
            app.currentmonitorLabel_4.Layout.Column = 3;
            app.currentmonitorLabel_4.Text = 'current monitor';

            % Create AI16Label
            app.AI16Label = uilabel(app.GridLayout6);
            app.AI16Label.Layout.Row = 9;
            app.AI16Label.Layout.Column = 1;
            app.AI16Label.Text = 'AI16';

            % Create encoderLabel
            app.encoderLabel = uilabel(app.GridLayout6);
            app.encoderLabel.Layout.Row = 9;
            app.encoderLabel.Layout.Column = 2;
            app.encoderLabel.Text = 'encoder';

            % Create hipLabel
            app.hipLabel = uilabel(app.GridLayout6);
            app.hipLabel.Layout.Row = 9;
            app.hipLabel.Layout.Column = 3;
            app.hipLabel.Text = 'hip';

            % Create AI17Label
            app.AI17Label = uilabel(app.GridLayout6);
            app.AI17Label.Layout.Row = 10;
            app.AI17Label.Layout.Column = 1;
            app.AI17Label.Text = 'AI17';

            % Create encoderLabel_2
            app.encoderLabel_2 = uilabel(app.GridLayout6);
            app.encoderLabel_2.Layout.Row = 10;
            app.encoderLabel_2.Layout.Column = 2;
            app.encoderLabel_2.Text = 'encoder';

            % Create kneeLabel
            app.kneeLabel = uilabel(app.GridLayout6);
            app.kneeLabel.Layout.Row = 10;
            app.kneeLabel.Layout.Column = 3;
            app.kneeLabel.Text = 'knee';

            % Create SaverawfileCheckBox
            app.SaverawfileCheckBox = uicheckbox(app.UIFigure);
            app.SaverawfileCheckBox.ValueChangedFcn = createCallbackFcn(app, @SaverawfileCheckBoxValueChanged, true);
            app.SaverawfileCheckBox.Enable = 'off';
            app.SaverawfileCheckBox.Text = 'Save raw file';
            app.SaverawfileCheckBox.Position = [1034 48 90 22];
            app.SaverawfileCheckBox.Value = true;

            % Create VoltageParametersPanel
            app.VoltageParametersPanel = uipanel(app.UIFigure);
            app.VoltageParametersPanel.TitlePosition = 'centertop';
            app.VoltageParametersPanel.Title = 'Voltage Parameters';
            app.VoltageParametersPanel.FontWeight = 'bold';
            app.VoltageParametersPanel.FontSize = 14;
            app.VoltageParametersPanel.Position = [381 297 213 160];

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.VoltageParametersPanel);
            app.GridLayout7.ColumnWidth = {'fit', '1x', 'fit'};
            app.GridLayout7.RowHeight = {'1x', '1x', '1x', '1x'};
            app.GridLayout7.ColumnSpacing = 10.125;
            app.GridLayout7.Padding = [10.125 10 10.125 10];

            % Create kVLabel
            app.kVLabel = uilabel(app.GridLayout7);
            app.kVLabel.Layout.Row = 3;
            app.kVLabel.Layout.Column = 3;
            app.kVLabel.Text = 'kV';

            % Create sLabel
            app.sLabel = uilabel(app.GridLayout7);
            app.sLabel.Layout.Row = 1;
            app.sLabel.Layout.Column = 3;
            app.sLabel.Text = 's';

            % Create HzLabel_5
            app.HzLabel_5 = uilabel(app.GridLayout7);
            app.HzLabel_5.Layout.Row = 2;
            app.HzLabel_5.Layout.Column = 3;
            app.HzLabel_5.Text = 'Hz';

            % Create ReversepolarityCheckBox
            app.ReversepolarityCheckBox = uicheckbox(app.GridLayout7);
            app.ReversepolarityCheckBox.ValueChangedFcn = createCallbackFcn(app, @ReversepolarityCheckBoxValueChanged, true);
            app.ReversepolarityCheckBox.Text = 'Reverse polarity';
            app.ReversepolarityCheckBox.Layout.Row = 4;
            app.ReversepolarityCheckBox.Layout.Column = [2 3];
            app.ReversepolarityCheckBox.Value = true;

            % Create MaxvoltageEditFieldLabel
            app.MaxvoltageEditFieldLabel = uilabel(app.GridLayout7);
            app.MaxvoltageEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxvoltageEditFieldLabel.Layout.Row = 3;
            app.MaxvoltageEditFieldLabel.Layout.Column = 1;
            app.MaxvoltageEditFieldLabel.Text = 'Max voltage';

            % Create MaxvoltageEditField
            app.MaxvoltageEditField = uieditfield(app.GridLayout7, 'numeric');
            app.MaxvoltageEditField.Limits = [0 20];
            app.MaxvoltageEditField.ValueChangedFcn = createCallbackFcn(app, @MaxvoltageEditFieldValueChanged, true);
            app.MaxvoltageEditField.Layout.Row = 3;
            app.MaxvoltageEditField.Layout.Column = 2;
            app.MaxvoltageEditField.Value = 3;

            % Create TotaltimeEditFieldLabel
            app.TotaltimeEditFieldLabel = uilabel(app.GridLayout7);
            app.TotaltimeEditFieldLabel.HorizontalAlignment = 'right';
            app.TotaltimeEditFieldLabel.Layout.Row = 1;
            app.TotaltimeEditFieldLabel.Layout.Column = 1;
            app.TotaltimeEditFieldLabel.Text = 'Total time';

            % Create TotaltimeEditField
            app.TotaltimeEditField = uieditfield(app.GridLayout7, 'numeric');
            app.TotaltimeEditField.Limits = [0 Inf];
            app.TotaltimeEditField.ValueChangedFcn = createCallbackFcn(app, @TotaltimeEditFieldValueChanged, true);
            app.TotaltimeEditField.Layout.Row = 1;
            app.TotaltimeEditField.Layout.Column = 2;
            app.TotaltimeEditField.Value = 10;

            % Create frequencyEditFieldLabel
            app.frequencyEditFieldLabel = uilabel(app.GridLayout7);
            app.frequencyEditFieldLabel.HorizontalAlignment = 'right';
            app.frequencyEditFieldLabel.Layout.Row = 2;
            app.frequencyEditFieldLabel.Layout.Column = 1;
            app.frequencyEditFieldLabel.Text = 'frequency';

            % Create frequencyEditField
            app.frequencyEditField = uieditfield(app.GridLayout7, 'numeric');
            app.frequencyEditField.Limits = [0 Inf];
            app.frequencyEditField.ValueChangedFcn = createCallbackFcn(app, @frequencyEditFieldValueChanged, true);
            app.frequencyEditField.Layout.Row = 2;
            app.frequencyEditField.Layout.Column = 2;
            app.frequencyEditField.Value = 1;

            % Create CalibrationPanel
            app.CalibrationPanel = uipanel(app.UIFigure);
            app.CalibrationPanel.TitlePosition = 'centertop';
            app.CalibrationPanel.Title = 'Calibration';
            app.CalibrationPanel.FontWeight = 'bold';
            app.CalibrationPanel.FontSize = 14;
            app.CalibrationPanel.Position = [101 296 266 162];

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.CalibrationPanel);
            app.GridLayout2.ColumnWidth = {'fit', '1x', 'fit'};
            app.GridLayout2.RowHeight = {'1x', '1x', '1x', '1x'};
            app.GridLayout2.ColumnSpacing = 6;
            app.GridLayout2.RowSpacing = 11.8666687011719;
            app.GridLayout2.Padding = [6 11.8666687011719 6 11.8666687011719];

            % Create HzLabel
            app.HzLabel = uilabel(app.GridLayout2);
            app.HzLabel.Layout.Row = 1;
            app.HzLabel.Layout.Column = 3;
            app.HzLabel.Text = 'Hz';

            % Create VkVLabel
            app.VkVLabel = uilabel(app.GridLayout2);
            app.VkVLabel.Layout.Row = 2;
            app.VkVLabel.Layout.Column = 3;
            app.VkVLabel.Text = 'V/kV';

            % Create NVLabel
            app.NVLabel = uilabel(app.GridLayout2);
            app.NVLabel.Layout.Row = 3;
            app.NVLabel.Layout.Column = 3;
            app.NVLabel.Text = 'N/V';

            % Create mmVLabel
            app.mmVLabel = uilabel(app.GridLayout2);
            app.mmVLabel.Layout.Row = 4;
            app.mmVLabel.Layout.Column = 3;
            app.mmVLabel.Text = 'mm/V';

            % Create SamplerateEditFieldLabel
            app.SamplerateEditFieldLabel = uilabel(app.GridLayout2);
            app.SamplerateEditFieldLabel.HorizontalAlignment = 'right';
            app.SamplerateEditFieldLabel.Layout.Row = 1;
            app.SamplerateEditFieldLabel.Layout.Column = 1;
            app.SamplerateEditFieldLabel.Text = 'Sample rate';

            % Create SamplerateEditField
            app.SamplerateEditField = uieditfield(app.GridLayout2, 'numeric');
            app.SamplerateEditField.Limits = [0 Inf];
            app.SamplerateEditField.ValueChangedFcn = createCallbackFcn(app, @SamplerateEditFieldValueChanged, true);
            app.SamplerateEditField.Layout.Row = 1;
            app.SamplerateEditField.Layout.Column = 2;
            app.SamplerateEditField.Value = 1000;

            % Create TREKvoltageconstantkVLabel
            app.TREKvoltageconstantkVLabel = uilabel(app.GridLayout2);
            app.TREKvoltageconstantkVLabel.HorizontalAlignment = 'center';
            app.TREKvoltageconstantkVLabel.Enable = 'off';
            app.TREKvoltageconstantkVLabel.Layout.Row = 2;
            app.TREKvoltageconstantkVLabel.Layout.Column = 1;
            app.TREKvoltageconstantkVLabel.Text = 'TREK voltage constant (kV)';

            % Create TREKvoltageconstantkVEditField
            app.TREKvoltageconstantkVEditField = uieditfield(app.GridLayout2, 'numeric');
            app.TREKvoltageconstantkVEditField.Limits = [0 Inf];
            app.TREKvoltageconstantkVEditField.ValueChangedFcn = createCallbackFcn(app, @TREKvoltageconstantkVEditFieldValueChanged, true);
            app.TREKvoltageconstantkVEditField.Editable = 'off';
            app.TREKvoltageconstantkVEditField.Enable = 'off';
            app.TREKvoltageconstantkVEditField.Layout.Row = 2;
            app.TREKvoltageconstantkVEditField.Layout.Column = 2;
            app.TREKvoltageconstantkVEditField.Value = 1;

            % Create MTforceconstantkFLabel
            app.MTforceconstantkFLabel = uilabel(app.GridLayout2);
            app.MTforceconstantkFLabel.HorizontalAlignment = 'center';
            app.MTforceconstantkFLabel.Enable = 'off';
            app.MTforceconstantkFLabel.Layout.Row = 3;
            app.MTforceconstantkFLabel.Layout.Column = 1;
            app.MTforceconstantkFLabel.Text = 'MT force constant (kF)';

            % Create MTforceconstantkFEditField
            app.MTforceconstantkFEditField = uieditfield(app.GridLayout2, 'numeric');
            app.MTforceconstantkFEditField.Limits = [0 Inf];
            app.MTforceconstantkFEditField.ValueChangedFcn = createCallbackFcn(app, @MTforceconstantkFEditFieldValueChanged, true);
            app.MTforceconstantkFEditField.Editable = 'off';
            app.MTforceconstantkFEditField.Enable = 'off';
            app.MTforceconstantkFEditField.Layout.Row = 3;
            app.MTforceconstantkFEditField.Layout.Column = 2;
            app.MTforceconstantkFEditField.Value = 9.96;

            % Create MTlengthconstantkLLabel
            app.MTlengthconstantkLLabel = uilabel(app.GridLayout2);
            app.MTlengthconstantkLLabel.HorizontalAlignment = 'center';
            app.MTlengthconstantkLLabel.Enable = 'off';
            app.MTlengthconstantkLLabel.Layout.Row = 4;
            app.MTlengthconstantkLLabel.Layout.Column = 1;
            app.MTlengthconstantkLLabel.Text = 'MT length constant (kL)';

            % Create MTlengthconstantkLEditField
            app.MTlengthconstantkLEditField = uieditfield(app.GridLayout2, 'numeric');
            app.MTlengthconstantkLEditField.Limits = [0 Inf];
            app.MTlengthconstantkLEditField.ValueChangedFcn = createCallbackFcn(app, @MTlengthconstantkLEditFieldValueChanged, true);
            app.MTlengthconstantkLEditField.Editable = 'off';
            app.MTlengthconstantkLEditField.Enable = 'off';
            app.MTlengthconstantkLEditField.Layout.Row = 4;
            app.MTlengthconstantkLEditField.Layout.Column = 2;
            app.MTlengthconstantkLEditField.Value = 1.989;

            % Create PressStopwhentestiscompletedtosavedataLabel
            app.PressStopwhentestiscompletedtosavedataLabel = uilabel(app.UIFigure);
            app.PressStopwhentestiscompletedtosavedataLabel.HorizontalAlignment = 'right';
            app.PressStopwhentestiscompletedtosavedataLabel.FontSize = 14;
            app.PressStopwhentestiscompletedtosavedataLabel.FontWeight = 'bold';
            app.PressStopwhentestiscompletedtosavedataLabel.Position = [809 41 137 50];
            app.PressStopwhentestiscompletedtosavedataLabel.Text = {'Press ''Stop'' when'; 'test is completed to'; 'save data'};

            % Create MonitorlimittripstatusCheckBox
            app.MonitorlimittripstatusCheckBox = uicheckbox(app.UIFigure);
            app.MonitorlimittripstatusCheckBox.ValueChangedFcn = createCallbackFcn(app, @MonitorlimittripstatusCheckBoxValueChanged, true);
            app.MonitorlimittripstatusCheckBox.Enable = 'off';
            app.MonitorlimittripstatusCheckBox.Text = 'Monitor limit/trip status';
            app.MonitorlimittripstatusCheckBox.Position = [982 69 142 22];

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Position = [960 70 20 20];

            % Create WavesettingsPanel
            app.WavesettingsPanel = uipanel(app.UIFigure);
            app.WavesettingsPanel.TitlePosition = 'centertop';
            app.WavesettingsPanel.Title = 'Wave settings';
            app.WavesettingsPanel.FontWeight = 'bold';
            app.WavesettingsPanel.FontSize = 14;
            app.WavesettingsPanel.Position = [101 107 1023 184];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.WavesettingsPanel);
            app.GridLayout.ColumnWidth = {'fit', 'fit', 'fit', '1x', 'fit', '1x', 'fit', '1x', 'fit', '1x', 'fit', '1x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x'};

            % Create kVVLabel
            app.kVVLabel = uilabel(app.GridLayout);
            app.kVVLabel.HorizontalAlignment = 'center';
            app.kVVLabel.Layout.Row = 1;
            app.kVVLabel.Layout.Column = 4;
            app.kVVLabel.Text = 'kV / V';

            % Create degLabel
            app.degLabel = uilabel(app.GridLayout);
            app.degLabel.HorizontalAlignment = 'center';
            app.degLabel.Layout.Row = 1;
            app.degLabel.Layout.Column = 6;
            app.degLabel.Text = 'deg';

            % Create gain1EditFieldLabel
            app.gain1EditFieldLabel = uilabel(app.GridLayout);
            app.gain1EditFieldLabel.HorizontalAlignment = 'right';
            app.gain1EditFieldLabel.Layout.Row = 2;
            app.gain1EditFieldLabel.Layout.Column = 3;
            app.gain1EditFieldLabel.Text = 'gain 1';

            % Create gain1EditField
            app.gain1EditField = uieditfield(app.GridLayout, 'numeric');
            app.gain1EditField.ValueChangedFcn = createCallbackFcn(app, @gain1EditFieldValueChanged, true);
            app.gain1EditField.Layout.Row = 2;
            app.gain1EditField.Layout.Column = 4;
            app.gain1EditField.Value = 1;

            % Create gain2EditFieldLabel
            app.gain2EditFieldLabel = uilabel(app.GridLayout);
            app.gain2EditFieldLabel.HorizontalAlignment = 'right';
            app.gain2EditFieldLabel.Layout.Row = 3;
            app.gain2EditFieldLabel.Layout.Column = 3;
            app.gain2EditFieldLabel.Text = 'gain 2';

            % Create gain2EditField
            app.gain2EditField = uieditfield(app.GridLayout, 'numeric');
            app.gain2EditField.ValueChangedFcn = createCallbackFcn(app, @gain2EditFieldValueChanged, true);
            app.gain2EditField.Layout.Row = 3;
            app.gain2EditField.Layout.Column = 4;
            app.gain2EditField.Value = 1;

            % Create gain3EditFieldLabel
            app.gain3EditFieldLabel = uilabel(app.GridLayout);
            app.gain3EditFieldLabel.HorizontalAlignment = 'right';
            app.gain3EditFieldLabel.Layout.Row = 4;
            app.gain3EditFieldLabel.Layout.Column = 3;
            app.gain3EditFieldLabel.Text = 'gain 3';

            % Create gain3EditField
            app.gain3EditField = uieditfield(app.GridLayout, 'numeric');
            app.gain3EditField.ValueChangedFcn = createCallbackFcn(app, @gain3EditFieldValueChanged, true);
            app.gain3EditField.Layout.Row = 4;
            app.gain3EditField.Layout.Column = 4;
            app.gain3EditField.Value = 1;

            % Create gain4EditFieldLabel
            app.gain4EditFieldLabel = uilabel(app.GridLayout);
            app.gain4EditFieldLabel.HorizontalAlignment = 'right';
            app.gain4EditFieldLabel.Layout.Row = 5;
            app.gain4EditFieldLabel.Layout.Column = 3;
            app.gain4EditFieldLabel.Text = 'gain 4';

            % Create gain4EditField
            app.gain4EditField = uieditfield(app.GridLayout, 'numeric');
            app.gain4EditField.ValueChangedFcn = createCallbackFcn(app, @gain4EditFieldValueChanged, true);
            app.gain4EditField.Layout.Row = 5;
            app.gain4EditField.Layout.Column = 4;
            app.gain4EditField.Value = 1;

            % Create delay1EditFieldLabel
            app.delay1EditFieldLabel = uilabel(app.GridLayout);
            app.delay1EditFieldLabel.HorizontalAlignment = 'right';
            app.delay1EditFieldLabel.Layout.Row = 2;
            app.delay1EditFieldLabel.Layout.Column = 5;
            app.delay1EditFieldLabel.Text = 'delay 1';

            % Create delay1EditField
            app.delay1EditField = uieditfield(app.GridLayout, 'numeric');
            app.delay1EditField.ValueChangedFcn = createCallbackFcn(app, @delay1EditFieldValueChanged, true);
            app.delay1EditField.Layout.Row = 2;
            app.delay1EditField.Layout.Column = 6;

            % Create delay2EditFieldLabel
            app.delay2EditFieldLabel = uilabel(app.GridLayout);
            app.delay2EditFieldLabel.HorizontalAlignment = 'right';
            app.delay2EditFieldLabel.Layout.Row = 3;
            app.delay2EditFieldLabel.Layout.Column = 5;
            app.delay2EditFieldLabel.Text = 'delay 2';

            % Create delay2EditField
            app.delay2EditField = uieditfield(app.GridLayout, 'numeric');
            app.delay2EditField.ValueChangedFcn = createCallbackFcn(app, @delay2EditFieldValueChanged, true);
            app.delay2EditField.Layout.Row = 3;
            app.delay2EditField.Layout.Column = 6;

            % Create delay3EditFieldLabel
            app.delay3EditFieldLabel = uilabel(app.GridLayout);
            app.delay3EditFieldLabel.HorizontalAlignment = 'right';
            app.delay3EditFieldLabel.Layout.Row = 4;
            app.delay3EditFieldLabel.Layout.Column = 5;
            app.delay3EditFieldLabel.Text = 'delay 3';

            % Create delay3EditField
            app.delay3EditField = uieditfield(app.GridLayout, 'numeric');
            app.delay3EditField.ValueChangedFcn = createCallbackFcn(app, @delay3EditFieldValueChanged, true);
            app.delay3EditField.Layout.Row = 4;
            app.delay3EditField.Layout.Column = 6;

            % Create delay4EditFieldLabel
            app.delay4EditFieldLabel = uilabel(app.GridLayout);
            app.delay4EditFieldLabel.HorizontalAlignment = 'right';
            app.delay4EditFieldLabel.Layout.Row = 5;
            app.delay4EditFieldLabel.Layout.Column = 5;
            app.delay4EditFieldLabel.Text = 'delay 4';

            % Create delay4EditField
            app.delay4EditField = uieditfield(app.GridLayout, 'numeric');
            app.delay4EditField.ValueChangedFcn = createCallbackFcn(app, @delay4EditFieldValueChanged, true);
            app.delay4EditField.Layout.Row = 5;
            app.delay4EditField.Layout.Column = 6;

            % Create HPLabel_2
            app.HPLabel_2 = uilabel(app.GridLayout);
            app.HPLabel_2.HorizontalAlignment = 'right';
            app.HPLabel_2.Layout.Row = 2;
            app.HPLabel_2.Layout.Column = 1;
            app.HPLabel_2.Text = 'HP';

            % Create KNLabel_2
            app.KNLabel_2 = uilabel(app.GridLayout);
            app.KNLabel_2.HorizontalAlignment = 'right';
            app.KNLabel_2.Layout.Row = 3;
            app.KNLabel_2.Layout.Column = 1;
            app.KNLabel_2.Text = 'KN';

            % Create KPLabel
            app.KPLabel = uilabel(app.GridLayout);
            app.KPLabel.HorizontalAlignment = 'right';
            app.KPLabel.Layout.Row = 4;
            app.KPLabel.Layout.Column = 1;
            app.KPLabel.Text = 'KP';

            % Create HNLabel
            app.HNLabel = uilabel(app.GridLayout);
            app.HNLabel.HorizontalAlignment = 'right';
            app.HNLabel.Layout.Row = 5;
            app.HNLabel.Layout.Column = 1;
            app.HNLabel.Text = 'HN';

            % Create Trek0Label
            app.Trek0Label = uilabel(app.GridLayout);
            app.Trek0Label.Layout.Row = 2;
            app.Trek0Label.Layout.Column = 2;
            app.Trek0Label.Text = 'Trek 0';

            % Create PolyKLabel_2
            app.PolyKLabel_2 = uilabel(app.GridLayout);
            app.PolyKLabel_2.Layout.Row = 3;
            app.PolyKLabel_2.Layout.Column = 2;
            app.PolyKLabel_2.Text = 'PolyK';

            % Create Trek4Label_4
            app.Trek4Label_4 = uilabel(app.GridLayout);
            app.Trek4Label_4.Layout.Row = 4;
            app.Trek4Label_4.Layout.Column = 2;
            app.Trek4Label_4.Text = 'Trek 4';

            % Create Trek3Label_4
            app.Trek3Label_4 = uilabel(app.GridLayout);
            app.Trek3Label_4.Layout.Row = 5;
            app.Trek3Label_4.Layout.Column = 2;
            app.Trek3Label_4.Text = 'Trek 3';

            % Create method1DropDownLabel
            app.method1DropDownLabel = uilabel(app.GridLayout);
            app.method1DropDownLabel.HorizontalAlignment = 'right';
            app.method1DropDownLabel.Layout.Row = 2;
            app.method1DropDownLabel.Layout.Column = 7;
            app.method1DropDownLabel.Text = 'method 1';

            % Create method1DropDown
            app.method1DropDown = uidropdown(app.GridLayout);
            app.method1DropDown.Items = {'step', 'sine', 'ramped square'};
            app.method1DropDown.ValueChangedFcn = createCallbackFcn(app, @method1DropDownValueChanged, true);
            app.method1DropDown.Layout.Row = 2;
            app.method1DropDown.Layout.Column = 8;
            app.method1DropDown.Value = 'sine';

            % Create method2DropDownLabel
            app.method2DropDownLabel = uilabel(app.GridLayout);
            app.method2DropDownLabel.HorizontalAlignment = 'right';
            app.method2DropDownLabel.Layout.Row = 3;
            app.method2DropDownLabel.Layout.Column = 7;
            app.method2DropDownLabel.Text = 'method 2';

            % Create method2DropDown
            app.method2DropDown = uidropdown(app.GridLayout);
            app.method2DropDown.Items = {'step', 'sine', 'ramped square'};
            app.method2DropDown.ValueChangedFcn = createCallbackFcn(app, @method2DropDownValueChanged, true);
            app.method2DropDown.Layout.Row = 3;
            app.method2DropDown.Layout.Column = 8;
            app.method2DropDown.Value = 'sine';

            % Create method3DropDownLabel
            app.method3DropDownLabel = uilabel(app.GridLayout);
            app.method3DropDownLabel.HorizontalAlignment = 'right';
            app.method3DropDownLabel.Layout.Row = 4;
            app.method3DropDownLabel.Layout.Column = 7;
            app.method3DropDownLabel.Text = 'method 3';

            % Create method3DropDown
            app.method3DropDown = uidropdown(app.GridLayout);
            app.method3DropDown.Items = {'step', 'sine', 'ramped square'};
            app.method3DropDown.ValueChangedFcn = createCallbackFcn(app, @method3DropDownValueChanged, true);
            app.method3DropDown.Layout.Row = 4;
            app.method3DropDown.Layout.Column = 8;
            app.method3DropDown.Value = 'sine';

            % Create method4DropDownLabel
            app.method4DropDownLabel = uilabel(app.GridLayout);
            app.method4DropDownLabel.HorizontalAlignment = 'right';
            app.method4DropDownLabel.Layout.Row = 5;
            app.method4DropDownLabel.Layout.Column = 7;
            app.method4DropDownLabel.Text = 'method 4';

            % Create method4DropDown
            app.method4DropDown = uidropdown(app.GridLayout);
            app.method4DropDown.Items = {'step', 'sine', 'ramped square'};
            app.method4DropDown.ValueChangedFcn = createCallbackFcn(app, @method4DropDownValueChanged, true);
            app.method4DropDown.Layout.Row = 5;
            app.method4DropDown.Layout.Column = 8;
            app.method4DropDown.Value = 'sine';

            % Create methodLabel
            app.methodLabel = uilabel(app.GridLayout);
            app.methodLabel.HorizontalAlignment = 'center';
            app.methodLabel.Layout.Row = 1;
            app.methodLabel.Layout.Column = 8;
            app.methodLabel.Text = 'method';

            % Create muscleLabel
            app.muscleLabel = uilabel(app.GridLayout);
            app.muscleLabel.HorizontalAlignment = 'right';
            app.muscleLabel.Layout.Row = 1;
            app.muscleLabel.Layout.Column = 1;
            app.muscleLabel.Text = 'muscle';

            % Create HVamplifierLabel
            app.HVamplifierLabel = uilabel(app.GridLayout);
            app.HVamplifierLabel.Layout.Row = 1;
            app.HVamplifierLabel.Layout.Column = 2;
            app.HVamplifierLabel.Text = 'HV amplifier';

            % Create dutyratio1EditFieldLabel
            app.dutyratio1EditFieldLabel = uilabel(app.GridLayout);
            app.dutyratio1EditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratio1EditFieldLabel.Layout.Row = 2;
            app.dutyratio1EditFieldLabel.Layout.Column = 9;
            app.dutyratio1EditFieldLabel.Text = 'duty ratio 1';

            % Create dutyratio1EditField
            app.dutyratio1EditField = uieditfield(app.GridLayout, 'numeric');
            app.dutyratio1EditField.Limits = [0 Inf];
            app.dutyratio1EditField.ValueChangedFcn = createCallbackFcn(app, @dutyratio1EditFieldValueChanged, true);
            app.dutyratio1EditField.Layout.Row = 2;
            app.dutyratio1EditField.Layout.Column = 10;
            app.dutyratio1EditField.Value = 50;

            % Create dutyratio2EditFieldLabel
            app.dutyratio2EditFieldLabel = uilabel(app.GridLayout);
            app.dutyratio2EditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratio2EditFieldLabel.Layout.Row = 3;
            app.dutyratio2EditFieldLabel.Layout.Column = 9;
            app.dutyratio2EditFieldLabel.Text = 'duty ratio 2';

            % Create dutyratio2EditField
            app.dutyratio2EditField = uieditfield(app.GridLayout, 'numeric');
            app.dutyratio2EditField.Limits = [0 Inf];
            app.dutyratio2EditField.ValueChangedFcn = createCallbackFcn(app, @dutyratio2EditFieldValueChanged, true);
            app.dutyratio2EditField.Layout.Row = 3;
            app.dutyratio2EditField.Layout.Column = 10;
            app.dutyratio2EditField.Value = 50;

            % Create dutyratio3EditFieldLabel
            app.dutyratio3EditFieldLabel = uilabel(app.GridLayout);
            app.dutyratio3EditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratio3EditFieldLabel.Layout.Row = 4;
            app.dutyratio3EditFieldLabel.Layout.Column = 9;
            app.dutyratio3EditFieldLabel.Text = 'duty ratio 3';

            % Create dutyratio3EditField
            app.dutyratio3EditField = uieditfield(app.GridLayout, 'numeric');
            app.dutyratio3EditField.Limits = [0 Inf];
            app.dutyratio3EditField.ValueChangedFcn = createCallbackFcn(app, @dutyratio3EditFieldValueChanged, true);
            app.dutyratio3EditField.Layout.Row = 4;
            app.dutyratio3EditField.Layout.Column = 10;
            app.dutyratio3EditField.Value = 50;

            % Create dutyratio4EditFieldLabel
            app.dutyratio4EditFieldLabel = uilabel(app.GridLayout);
            app.dutyratio4EditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratio4EditFieldLabel.Layout.Row = 5;
            app.dutyratio4EditFieldLabel.Layout.Column = 9;
            app.dutyratio4EditFieldLabel.Text = 'duty ratio 4';

            % Create dutyratio4EditField
            app.dutyratio4EditField = uieditfield(app.GridLayout, 'numeric');
            app.dutyratio4EditField.Limits = [0 Inf];
            app.dutyratio4EditField.ValueChangedFcn = createCallbackFcn(app, @dutyratio4EditFieldValueChanged, true);
            app.dutyratio4EditField.Layout.Row = 5;
            app.dutyratio4EditField.Layout.Column = 10;
            app.dutyratio4EditField.Value = 50;

            % Create Label
            app.Label = uilabel(app.GridLayout);
            app.Label.HorizontalAlignment = 'center';
            app.Label.Layout.Row = 1;
            app.Label.Layout.Column = 10;
            app.Label.Text = '%';

            % Create rampspeed1EditFieldLabel
            app.rampspeed1EditFieldLabel = uilabel(app.GridLayout);
            app.rampspeed1EditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeed1EditFieldLabel.Layout.Row = 2;
            app.rampspeed1EditFieldLabel.Layout.Column = 11;
            app.rampspeed1EditFieldLabel.Text = 'ramp speed 1';

            % Create rampspeed1EditField
            app.rampspeed1EditField = uieditfield(app.GridLayout, 'numeric');
            app.rampspeed1EditField.Limits = [0 Inf];
            app.rampspeed1EditField.ValueChangedFcn = createCallbackFcn(app, @rampspeed1EditFieldValueChanged, true);
            app.rampspeed1EditField.Layout.Row = 2;
            app.rampspeed1EditField.Layout.Column = 12;
            app.rampspeed1EditField.Value = 5;

            % Create kVsLabel
            app.kVsLabel = uilabel(app.GridLayout);
            app.kVsLabel.HorizontalAlignment = 'center';
            app.kVsLabel.Layout.Row = 1;
            app.kVsLabel.Layout.Column = 12;
            app.kVsLabel.Text = 'kV/s';

            % Create forstepLabel
            app.forstepLabel = uilabel(app.GridLayout);
            app.forstepLabel.HorizontalAlignment = 'center';
            app.forstepLabel.FontWeight = 'bold';
            app.forstepLabel.Layout.Row = 1;
            app.forstepLabel.Layout.Column = 9;
            app.forstepLabel.Text = 'for step';

            % Create forrampLabel
            app.forrampLabel = uilabel(app.GridLayout);
            app.forrampLabel.HorizontalAlignment = 'center';
            app.forrampLabel.FontWeight = 'bold';
            app.forrampLabel.Layout.Row = 1;
            app.forrampLabel.Layout.Column = 11;
            app.forrampLabel.Text = 'for ramp';

            % Create rampspeed2EditFieldLabel
            app.rampspeed2EditFieldLabel = uilabel(app.GridLayout);
            app.rampspeed2EditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeed2EditFieldLabel.Layout.Row = 3;
            app.rampspeed2EditFieldLabel.Layout.Column = 11;
            app.rampspeed2EditFieldLabel.Text = 'ramp speed 2';

            % Create rampspeed2EditField
            app.rampspeed2EditField = uieditfield(app.GridLayout, 'numeric');
            app.rampspeed2EditField.Limits = [0 Inf];
            app.rampspeed2EditField.ValueChangedFcn = createCallbackFcn(app, @rampspeed2EditFieldValueChanged, true);
            app.rampspeed2EditField.Layout.Row = 3;
            app.rampspeed2EditField.Layout.Column = 12;
            app.rampspeed2EditField.Value = 5;

            % Create rampspeed3EditFieldLabel
            app.rampspeed3EditFieldLabel = uilabel(app.GridLayout);
            app.rampspeed3EditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeed3EditFieldLabel.Layout.Row = 4;
            app.rampspeed3EditFieldLabel.Layout.Column = 11;
            app.rampspeed3EditFieldLabel.Text = 'ramp speed 3';

            % Create rampspeed3EditField
            app.rampspeed3EditField = uieditfield(app.GridLayout, 'numeric');
            app.rampspeed3EditField.Limits = [0 Inf];
            app.rampspeed3EditField.ValueChangedFcn = createCallbackFcn(app, @rampspeed3EditFieldValueChanged, true);
            app.rampspeed3EditField.Layout.Row = 4;
            app.rampspeed3EditField.Layout.Column = 12;
            app.rampspeed3EditField.Value = 5;

            % Create rampspeed4EditFieldLabel
            app.rampspeed4EditFieldLabel = uilabel(app.GridLayout);
            app.rampspeed4EditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeed4EditFieldLabel.Layout.Row = 5;
            app.rampspeed4EditFieldLabel.Layout.Column = 11;
            app.rampspeed4EditFieldLabel.Text = 'ramp speed 4';

            % Create rampspeed4EditField
            app.rampspeed4EditField = uieditfield(app.GridLayout, 'numeric');
            app.rampspeed4EditField.Limits = [0 Inf];
            app.rampspeed4EditField.ValueChangedFcn = createCallbackFcn(app, @rampspeed4EditFieldValueChanged, true);
            app.rampspeed4EditField.Layout.Row = 5;
            app.rampspeed4EditField.Layout.Column = 12;
            app.rampspeed4EditField.Value = 5;

            % Create delayCheckBox
            app.delayCheckBox = uicheckbox(app.GridLayout);
            app.delayCheckBox.ValueChangedFcn = createCallbackFcn(app, @delayCheckBoxValueChanged, true);
            app.delayCheckBox.Text = 'delay';
            app.delayCheckBox.Layout.Row = 1;
            app.delayCheckBox.Layout.Column = 5;
            app.delayCheckBox.Value = true;

            % Create FilenamesPanel
            app.FilenamesPanel = uipanel(app.UIFigure);
            app.FilenamesPanel.TitlePosition = 'centertop';
            app.FilenamesPanel.Title = 'File names';
            app.FilenamesPanel.FontWeight = 'bold';
            app.FilenamesPanel.FontSize = 14;
            app.FilenamesPanel.Position = [629 296 495 161];

            % Create GridLayout8
            app.GridLayout8 = uigridlayout(app.FilenamesPanel);
            app.GridLayout8.ColumnWidth = {'fit', 'fit', 'fit', '1x'};
            app.GridLayout8.RowHeight = {'1x', '1x', '1x', '1x'};

            % Create RawfileprefixEditFieldLabel
            app.RawfileprefixEditFieldLabel = uilabel(app.GridLayout8);
            app.RawfileprefixEditFieldLabel.HorizontalAlignment = 'right';
            app.RawfileprefixEditFieldLabel.Enable = 'off';
            app.RawfileprefixEditFieldLabel.Layout.Row = 4;
            app.RawfileprefixEditFieldLabel.Layout.Column = 1;
            app.RawfileprefixEditFieldLabel.Text = 'Raw file prefix';

            % Create RawfileprefixEditField
            app.RawfileprefixEditField = uieditfield(app.GridLayout8, 'text');
            app.RawfileprefixEditField.Enable = 'off';
            app.RawfileprefixEditField.Layout.Row = 4;
            app.RawfileprefixEditField.Layout.Column = 2;
            app.RawfileprefixEditField.Value = 'raw_';

            % Create ProcessedfilenameLabel
            app.ProcessedfilenameLabel = uilabel(app.GridLayout8);
            app.ProcessedfilenameLabel.HorizontalAlignment = 'right';
            app.ProcessedfilenameLabel.Layout.Row = 3;
            app.ProcessedfilenameLabel.Layout.Column = 1;
            app.ProcessedfilenameLabel.Text = 'Processed filename:';

            % Create ProcessedfilenameEditField
            app.ProcessedfilenameEditField = uieditfield(app.GridLayout8, 'text');
            app.ProcessedfilenameEditField.Layout.Row = 3;
            app.ProcessedfilenameEditField.Layout.Column = 2;
            app.ProcessedfilenameEditField.Value = 'NST';

            % Create BrowseButton
            app.BrowseButton = uibutton(app.GridLayout8, 'push');
            app.BrowseButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseButtonPushed, true);
            app.BrowseButton.Layout.Row = 2;
            app.BrowseButton.Layout.Column = 3;
            app.BrowseButton.Text = 'Browse';

            % Create SelectfilepathEditFieldLabel
            app.SelectfilepathEditFieldLabel = uilabel(app.GridLayout8);
            app.SelectfilepathEditFieldLabel.HorizontalAlignment = 'right';
            app.SelectfilepathEditFieldLabel.Layout.Row = 2;
            app.SelectfilepathEditFieldLabel.Layout.Column = 1;
            app.SelectfilepathEditFieldLabel.Text = 'Select file path:';

            % Create SelectfilepathEditField
            app.SelectfilepathEditField = uieditfield(app.GridLayout8, 'text');
            app.SelectfilepathEditField.Layout.Row = 2;
            app.SelectfilepathEditField.Layout.Column = 2;
            app.SelectfilepathEditField.Value = 'C:\Users\fukushima\Documents\GitHub\HASEL_signalGenerator';

            % Create GoButton
            app.GoButton = uibutton(app.GridLayout8, 'state');
            app.GoButton.ValueChangedFcn = createCallbackFcn(app, @GoButtonValueChanged, true);
            app.GoButton.Text = 'Go';
            app.GoButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.GoButton.FontSize = 24;
            app.GoButton.FontWeight = 'bold';
            app.GoButton.Layout.Row = [1 4];
            app.GoButton.Layout.Column = 4;

            % Create DAQButtonGroup
            app.DAQButtonGroup = uibuttongroup(app.UIFigure);
            app.DAQButtonGroup.Title = 'DAQ';
            app.DAQButtonGroup.Position = [101 19 148 72];

            % Create outputs2Button
            app.outputs2Button = uiradiobutton(app.DAQButtonGroup);
            app.outputs2Button.Enable = 'off';
            app.outputs2Button.Text = '2 outputs';
            app.outputs2Button.Position = [11 26 71 22];
            app.outputs2Button.Value = true;

            % Create outputs4Button
            app.outputs4Button = uiradiobutton(app.DAQButtonGroup);
            app.outputs4Button.Enable = 'off';
            app.outputs4Button.Text = '4 outputs';
            app.outputs4Button.Position = [11 4 71 22];

            % Create expoEditField_2Label
            app.expoEditField_2Label = uilabel(app.UIFigure);
            app.expoEditField_2Label.HorizontalAlignment = 'right';
            app.expoEditField_2Label.Position = [584 69 32 22];
            app.expoEditField_2Label.Text = 'expo';

            % Create expoEditField
            app.expoEditField = uieditfield(app.UIFigure, 'numeric');
            app.expoEditField.ValueChangedFcn = createCallbackFcn(app, @expoEditFieldValueChanged, true);
            app.expoEditField.Position = [631 69 100 22];
            app.expoEditField.Value = 2;

            % Create txPwEditFieldLabel
            app.txPwEditFieldLabel = uilabel(app.UIFigure);
            app.txPwEditFieldLabel.HorizontalAlignment = 'right';
            app.txPwEditFieldLabel.Position = [585 41 31 22];
            app.txPwEditFieldLabel.Text = 'txPw';

            % Create txPwEditField
            app.txPwEditField = uieditfield(app.UIFigure, 'numeric');
            app.txPwEditField.ValueChangedFcn = createCallbackFcn(app, @txPwEditFieldValueChanged, true);
            app.txPwEditField.Position = [631 41 101 22];
            app.txPwEditField.Value = 80;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = signalGenerator_exported

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