classdef signalGenerator_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        DAQButtonGroup                  matlab.ui.container.ButtonGroup
        outputsButton_2                 matlab.ui.control.RadioButton
        outputsButton                   matlab.ui.control.RadioButton
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
        Label_3                         matlab.ui.control.Label
        Label_2                         matlab.ui.control.Label
        MatsusadaLabel                  matlab.ui.control.Label
        kVLabel_2                       matlab.ui.control.Label
        HPosLabel                       matlab.ui.control.Label
        KNegLabel                       matlab.ui.control.Label
        HNegLabel                       matlab.ui.control.Label
        KPosLabel                       matlab.ui.control.Label
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


    methods (Access = private)

        function fullSignal = buildSignal(app)
            global kV
            timeInit = 1;

            timeTotal = app.TotaltimeEditField.Value;
            sampRate = app.SamplerateEditField.Value;

            % Build voltage signals
            time = [-timeInit: 1/sampRate: timeTotal - 1/sampRate]';


            voltageSignal_1 = createBaseSignal(app, app.method1DropDown.Value, app.dutyratio1EditField.Value, app.rampspeed1EditField.Value, time, timeInit);
            voltageSignal_2 = createBaseSignal(app, app.method2DropDown.Value, app.dutyratio2EditField.Value, app.rampspeed2EditField.Value, time, timeInit);
            voltageSignal_3 = createBaseSignal(app, app.method3DropDown.Value, app.dutyratio3EditField.Value, app.rampspeed3EditField.Value, time, timeInit);
            voltageSignal_4 = createBaseSignal(app, app.method4DropDown.Value, app.dutyratio4EditField.Value, app.rampspeed4EditField.Value, time, timeInit);

            voltageSignal_1 = voltageSignal_1/app.gain1EditField.Value;
            voltageSignal_2 = voltageSignal_2/app.gain2EditField.Value;
            voltageSignal_3 = voltageSignal_3/app.gain3EditField.Value;
            voltageSignal_4 = voltageSignal_4/app.gain4EditField.Value;

            if app.delayCheckBox.Value

                voltageSignal_1 = shiftPhase(app, voltageSignal_1, app.delay1EditField.Value, timeInit);
                voltageSignal_2 = shiftPhase(app, voltageSignal_2, app.delay2EditField.Value, timeInit);
                voltageSignal_3 = shiftPhase(app, voltageSignal_3, app.delay3EditField.Value, timeInit);
                voltageSignal_4 = shiftPhase(app, voltageSignal_4, app.delay4EditField.Value, timeInit);

            end

            refSignal = zeros(size(time)); % dump signal, originally used for reference signal for TF estimation

            fullSignal = [time, refSignal, voltageSignal_1, voltageSignal_2, voltageSignal_3, voltageSignal_4];
        end

        function Out = createBaseSignal(app, method, dutyRatio, rampSpd, time, timeInit)
            global kV
            sampRate = app.SamplerateEditField.Value;
            frequency = app.frequencyEditField.Value/2;
            maxVoltage = app.MaxvoltageEditField.Value/kV;
            timeTotal = app.TotaltimeEditField.Value;
            totalSamples = (timeInit + timeTotal)*sampRate;

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
                    voltageSignal = signalBase.^2*maxVoltage; % abs(signalBase.^3) is also fine if you want more smooth zero crossing
                    voltageSignal = voltageSignal.*mask;

                case 'step'
                    while 1
                        indStart = fix(timeInit*sampRate) + i*indDurationCycle + 1;
                        indEnd = fix(timeInit*sampRate) + (i+1)*indDurationCycle +1;

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
                        indStart = fix(timeInit*sampRate) + i*indDurationCycle + 1;
                        indEnd = fix(timeInit*sampRate) + (i+1)*indDurationCycle + 1;

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
        function Out = shiftPhase(app, Data, phase, timeInit)
            sampRate = app.SamplerateEditField.Value;
            freq = app.frequencyEditField.Value;

            ind_signalStart = fix(timeInit*sampRate) + 1;

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
            global kV
            sampRate = app.SamplerateEditField.Value;
            maxVoltage = app.MaxvoltageEditField.Value;

            fullSignal = buildSignal(app);
            time = linspace(0, length(fullSignal)/sampRate, length(fullSignal));

            cla(app.UIAxes, "reset")

            %             yyaxis(app.UIAxes, 'left');
            hold(app.UIAxes, "on")
            plot(app.UIAxes, fullSignal(:, 1), fullSignal(:, 3)*kV);
            plot(app.UIAxes, fullSignal(:, 1), fullSignal(:, 4)*kV);
            plot(app.UIAxes, fullSignal(:, 1), fullSignal(:, 5)*kV);
            plot(app.UIAxes, fullSignal(:, 1), fullSignal(:, 6)*kV);
            ylim(app.UIAxes, [(-1.5)*maxVoltage, 1.5*maxVoltage])
            ylabel(app.UIAxes, 'Voltage (kV)');

            %             yyaxis(app.UIAxes, 'right');
            %             plot(app.UIAxes, fullSignal(:, 1), fullSignal(:, 4)*kV);
            %             ylim(app.UIAxes, [(-1.5)*maxVoltage, 1.5*maxVoltage])
            %             ylabel(app.UIAxes, 'Sync');

            grid(app.UIAxes, 'on')



        end

        function storeData(app, ~, ~)
            % This function is called every n = scansAvailableFcnCount data
            % points read by the DAQ
            global d voltageArr1 currentArr1 voltageArr2 currentArr2 voltageArr3 currentArr3 voltageArr4 currentArr4 angleArr1 angleArr2 scanCount lastDataIndex

            numScansAvailable = d.NumScansAvailable;
            if numScansAvailable == 0
                disp('finish')
                return;
            end
            scanCount = scanCount + 1;

            startIndex = (scanCount - 1)*d.ScansAvailableFcnCount + 1;
            % location to put next data
            endIndex = (startIndex - 1) + numScansAvailable;
            % location of end of new data
            lastDataIndex = endIndex;
            % this global index tells the program where the last data
            % point is, in case of test interruption

            % Read available data from DAQ
            scanData = read(d, numScansAvailable, "OutputFormat", "Matrix");
            voltage1 = scanData(:, 1);
            voltageArr1(startIndex: endIndex) = voltage1;
            % channel 1 is voltage input from Trek 1(in volts)

            current1 = scanData(:, 2);
            currentArr1(startIndex: endIndex) = current1;
            % channel 2 is current input from Trek 1 (in volts)

            voltage2 = scanData(:, 3);
            voltageArr2(startIndex: endIndex) = voltage2;
            % channel 3 is voltage input from Trek 2 (in volts)

            current2 = scanData(:, 4);
            currentArr2(startIndex: endIndex) = current2;
            % channel 4 is current input from Trek 2 (in volts)

            voltage3 = scanData(:, 5);
            voltageArr3(startIndex: endIndex) = voltage3;
            % channel 5 is voltage input from Trek 3 (in volts)

            current3 = scanData(:, 6);
            currentArr3(startIndex: endIndex) = current3;
            % channel 6 is current input from Trek 3 (in volts)

            voltage4 = scanData(:, 7);
            voltageArr4(startIndex: endIndex) = voltage4;
            % channel 7 is voltage input from Trek 4 (in volts)

            current4 = scanData(:, 8);
            currentArr4(startIndex: endIndex) = current4;
            % channel 8 is current input from Trek 4 (in volts)

            angle1 = scanData(:, 9);
            angleArr1(startIndex: endIndex) = angle1;
            % channel 16 is encoder angle 1 (in volts)

            angle2 = scanData(:, 10);
            angleArr2(startIndex: endIndex) = angle2;
            % channel 17 is encoder angle 2 (in volts)

            % Plot data every cycle
            x = linspace(cast(startIndex, 'double'), cast(endIndex, 'double'), length(force));
            yyaxis(app.UIAxes, 'left');
            plot(app.UIAxes, x, voltage1, '-');
            ylabel(app.UIAxes, 'Hip angle')
            yyaxis(app.UIAxes, 'right');
            plot(app.UIAxes, x, current1, '-');
            ylabel(app.UIAxes, 'Knee angle')
            ylim(app.UIAxes(1), 'auto')
            ylim(app.UIAxes(2), 'auto')

            %             trip = scanData(end, 4);
            %             % channel 4 is limit/trip status
            %             if trip < 4 && app.MonitorlimittripstatusCheckBox.Value
            %                 app.Lamp.Color = 'red';
            %                 app.GoButton.Value = 0;
            %                 GoButtonValueChanged(app);
            %             end
        end
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            DQL = daqlist; % get connected device list
            %             DevName = DQL.DeviceID(1); % select the first one (["Dev1", "SimDev1"] or ["SimDev1"])
            DevName = "Dev3";
            % DAQ Dev1 ao0 = Voltage output to Trek
            % DAQ Dev1 ao1 = sync signal

            % DAQ Dev1 ai0 = Voltage monitor from Trek
            % DAQ Dev1 ai1 = Force monitor from muscle tester
            % DAQ Dev1 ai2 = Displacement monitor from muscle tester
            % DAQ Dev1 ai7 = Trek limit monitor (not used so far)
            % DAQ Dev1 ai6 = Triger signal from HS camera (4.2V?)

            global d kF kL kV

            kV = app.TREKvoltageconstantkVEditField.Value;
            kF = app.MTforceconstantkFEditField.Value;
            kL = app.MTlengthconstantkLEditField.Value;

            app.RawfileprefixEditField.Enable = 0;
            app.GoButton.Text = 'Go (inactive)';
            if app.MonitorlimittripstatusCheckBox.Value
                app.Lamp.Enable = 1;
                app.Lamp.Color = 'green';
            else
                app.Lamp.Enable = 0;
                app.Lamp.Color = [0.96, 0.96, 0.96];
            end

            buildPreview(app);

            d = daq("ni");
            d.Rate = app.SamplerateEditField.Value;

            d.ScansAvailableFcn = @(src, event) storeData(app, src, event);
            % call storeData fcn when scans are available

            %             d.ScansAvailableFcnCount = 'auto';
            d.ScansAvailableFcnCount = app.SamplerateEditField.Value*1;
            % every 1 second
            % by default, call storeData every cycle



            addoutput(d, DevName, "ao0", "Voltage");
            % voltage output to TREk1

            addoutput(d, DevName, "ao1", "Voltage");
            % voltage output to TREk2

            if app.DAQButtonGroup.SelectedObject.Text == '4 outputs'
                addoutput(d, DevName, "ao2", "Voltage");
                % voltage output to TREk3

                addoutput(d, DevName, "ao3", "Voltage");
                % voltage output to TREk4
            end

            addinput(d, DevName, "ai0", "Voltage");
            % TREK 1 voltage monitor

            addinput(d, DevName, "ai1", "Voltage");
            % TREK 1 current monitor

            addinput(d, DevName, "ai2", "Voltage");
            % TREK 2 voltage monitor

            addinput(d, DevName, "ai3", "Voltage");
            % TREK 2 current monitor

            addinput(d, DevName, "ai4", "Voltage");
            % TREK 3 voltage monitor

            addinput(d, DevName, "ai5", "Voltage");
            % TREK 3 current monitor

            addinput(d, DevName, "ai6", "Voltage");
            % TREK 4 voltage monitor

            addinput(d, DevName, "ai7", "Voltage");
            % TREK 4 current monitor

            if app.DAQButtonGroup.SelectedObject == '4 outputs'
                addinput(d, DevName, "ai16", "Voltage");
                % hip angle

                addinput(d, DevName, "ai17", "Voltage");
                % knee angle
            end

            d.Channels
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
            global d voltageArr1 voltageArr2 voltageArr3 voltageArr4 currentArr1 currentArr2 currentArr3 currentArr4 angleArr1 angleArr2 scanCount lastDataIndex kV kF kL


            fullSignal = buildSignal(app);

            if app.GoButton.Value

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

                %                 app.UIAxes.YAxis(2).Visible = 'on';
                %                 xlabel(app.UIAxes, 'Sample Number');
                %                 yyaxis(app.UIAxes, 'right');
                %                 %                 xlim(app.UIAxes, 'auto')
                %                 %                 ylim(app.UIAxes, 'auto');
                %                 ylabel(app.UIAxes, 'Force (N)');
                %                 yyaxis(app.UIAxes, 'left');
                %                 %                 ylim(app.UIAxes, 'auto')
                %                 ylabel(app.UIAxes, 'Displacement (mm)');

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

                app.GoButton.Text = "Stop (active)";
                app.GoButton.BackgroundColor = 'red';
                if app.MonitorlimittripstatusCheckBox.Value
                    app.Lamp.Color = 'green';
                end

                % connect to Arduino
                %                 devArduino = serialport(app.USBportDropDown, int(str2num(app.baudrateDropDown)));



                % Build output signal and preload
                voltageArr1 = zeros(length(fullSignal), 1);
                currentArr1 = zeros(length(fullSignal), 1);
                voltageArr2 = zeros(length(fullSignal), 1);
                currentArr2 = zeros(length(fullSignal), 1);
                voltageArr3 = zeros(length(fullSignal), 1);
                currentArr3 = zeros(length(fullSignal), 1);
                voltageArr4 = zeros(length(fullSignal), 1);
                currentArr4 = zeros(length(fullSignal), 1);
                angleArr1 = zeros(length(fullSignal), 1);
                angleArr2 = zeros(length(fullSignal), 1);

                scanCount = 0;
                if app.DAQButtonGroup.SelectedObject.Text == '4 outputs'
                    preload(d, fullSignal(:, 3:6));
                else
                    preload(d, fullSignal(:, 3:4));
                end
                %                 while 1 % wait for trigger
                %                     tmp = read(d, "OutputFormat","Matrix");
                %                     if tmp(:, 5) > 4 % 5V trigger
                %                         break
                %                     end
                %                 end

                start(d);

            else
                % End test

                % Stop the DAQ
                if d.Running
                    stop(d);
                end

                % Read residual data from DAQ
                if d.NumScansAvailable > 0
                    storeData(app, d, 0);
                end



                cla(app.UIAxes, "reset")
                yyaxis(app.UIAxes, 'left');
                plot(app.UIAxes, fullSignal(:, 1), angleArr1);
                ylabel(app.UIAxes, 'voltage [kV]');
                yyaxis(app.UIAxes, 'right');
                plot(app.UIAxes, fullSignal(:, 1), angleArr2);
                ylabel(app.UIAxes, 'current [?]');
                ylabel(app.UIAxes, 'time [s]')

                % Bode plot processing
                %                 processedCurve = generateBode(app, fullSignal(:, 4));
                %                 plotBode(app, processedCurve);

                % file saves
                if app.SaverawfileCheckBox.Value
                    textPara = [...
                        app.method1DropDown.Value(1), '_',...
                        num2str(app.MaxvoltageEditField.Value*10,   '%02.0f'), 'kV_',...
                        num2str(app.frequencyEditField.Value*10, '%03.0f'), 'Hz_',...
                        num2str(app.SamplerateEditField.Value,   '%04.0f'), 'Hz_',...
                        num2str(app.dutyratio1EditField.Value,    '%03.0f'), 'duty_',...
                        num2str(app.rampspeed1EditField.Value,    '%03.0f'), 'kVs'];
                    rawFilename = fullfile(app.SelectfilepathEditField.Value,...
                        [app.RawfileprefixEditField.Value, app.ProcessedfilenameEditField.Value, '_', textPara, datestr(now,'_yyyy_mm_dd_HHMM'), '.dat']);

                    writetable(table(...
                        fullSignal(:, 1),...
                        fullSignal(:, 3),...
                        fullSignal(:, 4),...
                        fullSignal(:, 5),...
                        fullSignal(:, 6),...
                        voltageArr1(1:lastDataIndex)*kV,...
                        currentArr1(1:lastDataIndex)*kV,...
                        voltageArr2(1:lastDataIndex)*kV,...
                        currentArr2(1:lastDataIndex)*kV,...
                        voltageArr3(1:lastDataIndex)*kV,...
                        currentArr3(1:lastDataIndex)*kV,...
                        voltageArr4(1:lastDataIndex)*kV,...
                        currentArr4(1:lastDataIndex)*kV,...
                        angleArr1(1: lastDataIndex),...
                        angleArr2(1: lastDataIndex),...
                        'VariableNames', {...
                        'Time [s]',...
                        'Voltage ref 1[kV]',...
                        'Voltage ref 2[kV]',...
                        'Voltage ref 3[kV]',...
                        'Voltage ref 4[kV]',...
                        'Voltage 1 [kV]',...
                        'Current 1 [A]',...
                        'Voltage 2 [kV]',...
                        'Current 2 [A]',...
                        'Voltage 3 [kV]',...
                        'Current 3 [A]',...
                        'Voltage 4 [kV]',...
                        'Current 4 [A]',...
                        'Angle 1 [V]'...
                        'Angle 2 [V]'...
                        }), rawFilename);
                end
                %                 processedFilename = fullfile(app.SelectfilepathEditField.Value, [app.ProcessedfilenameEditField.Value ,'_sineSweep_', textPara]);
                %                 writetable(table(processedCurve(:, 1), processedCurve(:, 2), processedCurve(:, 3), 'VariableNames',...
                %                     {'Frequency [Hz]', 'Amplitude [dB]', 'Phase [deg]'}), processedFilename);
                % Fush the DAQ and ensure zero voltage
                flush(d);
                if app.DAQButtonGroup.SelectedObject.Text == '4 outputs'
                    write(d, [0, 0, 0, 0]);
                else
                    write(d, [0, 0]);
                end

                app.GoButton.BackgroundColor = [0.96, 0.96, 0.96];
                app.GoButton.Text = {'Go', '(inactive)'};


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
            global d
            d.Rate = app.SamplerateEditField.Value;
            % change scansAvailableFcnCount here
        end

        % Value changed function: TREKvoltageconstantkVEditField
        function TREKvoltageconstantkVEditFieldValueChanged(app, event)
            global kV
            kV = app.TREKvoltageconstantkVEditField.Value;
        end

        % Value changed function: MTforceconstantkFEditField
        function MTforceconstantkFEditFieldValueChanged(app, event)
            global kF
            kF = app.MTforceconstantkFEditField.Value;
        end

        % Value changed function: MTlengthconstantkLEditField
        function MTlengthconstantkLEditFieldValueChanged(app, event)
            global kL
            kL = app.MTlengthconstantkLEditField.Value;
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
            app.MaxvoltageEditField.Value = 6;

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
            app.TotaltimeEditField.Value = 8;

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
            app.frequencyEditField.Value = 2;

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
            app.gain1EditField.Value = 5;

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
            app.gain4EditField.Value = 2;

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
            app.delay2EditField.Value = 90;

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
            app.delay3EditField.Value = 180;

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
            app.delay4EditField.Value = 270;

            % Create KPosLabel
            app.KPosLabel = uilabel(app.GridLayout);
            app.KPosLabel.HorizontalAlignment = 'right';
            app.KPosLabel.Layout.Row = 2;
            app.KPosLabel.Layout.Column = 1;
            app.KPosLabel.Text = 'K-Pos';

            % Create HNegLabel
            app.HNegLabel = uilabel(app.GridLayout);
            app.HNegLabel.HorizontalAlignment = 'right';
            app.HNegLabel.Layout.Row = 3;
            app.HNegLabel.Layout.Column = 1;
            app.HNegLabel.Text = 'H-Neg';

            % Create KNegLabel
            app.KNegLabel = uilabel(app.GridLayout);
            app.KNegLabel.HorizontalAlignment = 'right';
            app.KNegLabel.Layout.Row = 4;
            app.KNegLabel.Layout.Column = 1;
            app.KNegLabel.Text = 'K-Neg';

            % Create HPosLabel
            app.HPosLabel = uilabel(app.GridLayout);
            app.HPosLabel.HorizontalAlignment = 'right';
            app.HPosLabel.Layout.Row = 5;
            app.HPosLabel.Layout.Column = 1;
            app.HPosLabel.Text = 'H-Pos';

            % Create kVLabel_2
            app.kVLabel_2 = uilabel(app.GridLayout);
            app.kVLabel_2.Layout.Row = 2;
            app.kVLabel_2.Layout.Column = 2;
            app.kVLabel_2.Text = '50kV';

            % Create MatsusadaLabel
            app.MatsusadaLabel = uilabel(app.GridLayout);
            app.MatsusadaLabel.Layout.Row = 3;
            app.MatsusadaLabel.Layout.Column = 2;
            app.MatsusadaLabel.Text = 'Matsusada';

            % Create Label_2
            app.Label_2 = uilabel(app.GridLayout);
            app.Label_2.Layout.Row = 4;
            app.Label_2.Layout.Column = 2;

            % Create Label_3
            app.Label_3 = uilabel(app.GridLayout);
            app.Label_3.Layout.Row = 5;
            app.Label_3.Layout.Column = 2;
            app.Label_3.Text = '20/20';

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
            app.ProcessedfilenameEditField.Value = 'selfSensing';

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
            app.SelectfilepathEditField.Value = 'C:\Users\fukushima\Desktop\HASEL_signalGenerator';

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

            % Create outputsButton
            app.outputsButton = uiradiobutton(app.DAQButtonGroup);
            app.outputsButton.Enable = 'off';
            app.outputsButton.Text = '2 outputs';
            app.outputsButton.Position = [11 26 71 22];
            app.outputsButton.Value = true;

            % Create outputsButton_2
            app.outputsButton_2 = uiradiobutton(app.DAQButtonGroup);
            app.outputsButton_2.Enable = 'off';
            app.outputsButton_2.Text = '4 outputs';
            app.outputsButton_2.Position = [11 4 71 22];

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