classdef signalGenerator_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        WavesettingsPanel             matlab.ui.container.Panel
        GridLayout                    matlab.ui.container.GridLayout
        expo4EditField                matlab.ui.control.NumericEditField
        expo4EditFieldLabel           matlab.ui.control.Label
        rampspeed4EditField           matlab.ui.control.NumericEditField
        rampspeed4EditFieldLabel      matlab.ui.control.Label
        dutyratio4EditField           matlab.ui.control.NumericEditField
        dutyratio4EditFieldLabel      matlab.ui.control.Label
        method4DropDown               matlab.ui.control.DropDown
        method4DropDownLabel          matlab.ui.control.Label
        delay4EditField               matlab.ui.control.NumericEditField
        delay4EditFieldLabel          matlab.ui.control.Label
        offset4EditField              matlab.ui.control.NumericEditField
        offset4EditFieldLabel         matlab.ui.control.Label
        Amplitude4EditField           matlab.ui.control.NumericEditField
        Amplitude4EditFieldLabel      matlab.ui.control.Label
        Reversepolarity4Button        matlab.ui.control.StateButton
        expo3EditField                matlab.ui.control.NumericEditField
        expo3EditFieldLabel           matlab.ui.control.Label
        rampspeed3EditField           matlab.ui.control.NumericEditField
        rampspeed3EditFieldLabel      matlab.ui.control.Label
        dutyratio3EditField           matlab.ui.control.NumericEditField
        dutyratio3EditFieldLabel      matlab.ui.control.Label
        method3DropDown               matlab.ui.control.DropDown
        method3DropDownLabel          matlab.ui.control.Label
        delay3EditField               matlab.ui.control.NumericEditField
        delay3EditFieldLabel          matlab.ui.control.Label
        offset3EditField              matlab.ui.control.NumericEditField
        offset3EditFieldLabel         matlab.ui.control.Label
        Amplitude3EditField           matlab.ui.control.NumericEditField
        Amplitude3EditFieldLabel      matlab.ui.control.Label
        Reversepolarity3Button        matlab.ui.control.StateButton
        expo2EditField                matlab.ui.control.NumericEditField
        expo2EditFieldLabel           matlab.ui.control.Label
        rampspeed2EditField           matlab.ui.control.NumericEditField
        rampspeed2EditFieldLabel      matlab.ui.control.Label
        dutyratio2EditField           matlab.ui.control.NumericEditField
        dutyratio2EditFieldLabel      matlab.ui.control.Label
        method2DropDown               matlab.ui.control.DropDown
        method2DropDownLabel          matlab.ui.control.Label
        delay2EditField               matlab.ui.control.NumericEditField
        delay2EditFieldLabel          matlab.ui.control.Label
        offset2EditField              matlab.ui.control.NumericEditField
        offset2EditFieldLabel         matlab.ui.control.Label
        Amplitude2EditField           matlab.ui.control.NumericEditField
        Amplitude2EditFieldLabel      matlab.ui.control.Label
        Reversepolarity2Button        matlab.ui.control.StateButton
        expo1EditField                matlab.ui.control.NumericEditField
        expo1EditFieldLabel           matlab.ui.control.Label
        rampspeed1EditField           matlab.ui.control.NumericEditField
        rampspeed1EditFieldLabel      matlab.ui.control.Label
        dutyratio1EditField           matlab.ui.control.NumericEditField
        dutyratio1EditFieldLabel      matlab.ui.control.Label
        method1DropDown               matlab.ui.control.DropDown
        method1DropDownLabel          matlab.ui.control.Label
        delay1EditField               matlab.ui.control.NumericEditField
        delay1EditFieldLabel          matlab.ui.control.Label
        offset1EditField              matlab.ui.control.NumericEditField
        offset1EditFieldLabel         matlab.ui.control.Label
        Amplitude1EditField           matlab.ui.control.NumericEditField
        Amplitude1Label               matlab.ui.control.Label
        Reversepolarity1Button        matlab.ui.control.StateButton
        sinxexpoLabel                 matlab.ui.control.Label
        forsinemodLabel               matlab.ui.control.Label
        kVsLabel                      matlab.ui.control.Label
        forrampLabel                  matlab.ui.control.Label
        Label                         matlab.ui.control.Label
        forstepLabel                  matlab.ui.control.Label
        methodLabel                   matlab.ui.control.Label
        degLabel                      matlab.ui.control.Label
        delayCheckBox                 matlab.ui.control.CheckBox
        kVLabel_2                     matlab.ui.control.Label
        offsetCheckBox                matlab.ui.control.CheckBox
        kVVLabel                      matlab.ui.control.Label
        AmplitudeLabel                matlab.ui.control.Label
        FilenamesPanel                matlab.ui.container.Panel
        GridLayout8                   matlab.ui.container.GridLayout
        RawfileprefixEditField        matlab.ui.control.EditField
        RawfileprefixEditFieldLabel   matlab.ui.control.Label
        ProcessedfilenameEditField    matlab.ui.control.EditField
        ProcessedfilenameLabel        matlab.ui.control.Label
        GoButton                      matlab.ui.control.StateButton
        BrowseButton                  matlab.ui.control.Button
        SelectfilepathEditField       matlab.ui.control.EditField
        SelectfilepathEditFieldLabel  matlab.ui.control.Label
        SignalparameterPanel          matlab.ui.container.Panel
        GridLayout7                   matlab.ui.container.GridLayout
        sLabel                        matlab.ui.control.Label
        TotaltimeEditField            matlab.ui.control.NumericEditField
        TotaltimeEditFieldLabel       matlab.ui.control.Label
        HzLabel_6                     matlab.ui.control.Label
        CyclefrequencyEditField       matlab.ui.control.NumericEditField
        CyclefrequencyEditFieldLabel  matlab.ui.control.Label
        HzLabel_5                     matlab.ui.control.Label
        SamplerateEditField           matlab.ui.control.NumericEditField
        SamplerateEditFieldLabel      matlab.ui.control.Label
        DAQtypeButtonGroup            matlab.ui.container.ButtonGroup
        outputs4Button                matlab.ui.control.RadioButton
        outputs2Button                matlab.ui.control.RadioButton
        SetupPanel_2                  matlab.ui.container.Panel
        GridLayout4                   matlab.ui.container.GridLayout
        GridLayout6                   matlab.ui.container.GridLayout
        kneeLabel                     matlab.ui.control.Label
        encoderLabel_2                matlab.ui.control.Label
        AI17Label                     matlab.ui.control.Label
        hipLabel                      matlab.ui.control.Label
        encoderLabel                  matlab.ui.control.Label
        AI16Label                     matlab.ui.control.Label
        currentmonitorLabel_4         matlab.ui.control.Label
        Trek4Label_3                  matlab.ui.control.Label
        AI7Label                      matlab.ui.control.Label
        voltagemonitorLabel_11        matlab.ui.control.Label
        Trek4Label_2                  matlab.ui.control.Label
        AI6Label                      matlab.ui.control.Label
        currentmonitorLabel_3         matlab.ui.control.Label
        Trek3Label_3                  matlab.ui.control.Label
        AI5Label                      matlab.ui.control.Label
        voltagemonitorLabel_10        matlab.ui.control.Label
        Trek3Label_2                  matlab.ui.control.Label
        AI4Label                      matlab.ui.control.Label
        currentmonitorLabel_2         matlab.ui.control.Label
        Trek2Label_3                  matlab.ui.control.Label
        AI3Label                      matlab.ui.control.Label
        voltagemonitorLabel_9         matlab.ui.control.Label
        Trek2Label_2                  matlab.ui.control.Label
        AI2Label                      matlab.ui.control.Label
        currentmonitorLabel           matlab.ui.control.Label
        Trek1Label_15                 matlab.ui.control.Label
        AI1Label                      matlab.ui.control.Label
        voltagemonitorLabel_8         matlab.ui.control.Label
        Trek1Label_14                 matlab.ui.control.Label
        AI0Label_8                    matlab.ui.control.Label
        GridLayout5                   matlab.ui.container.GridLayout
        voltageinLabel_4              matlab.ui.control.Label
        Trek4Label                    matlab.ui.control.Label
        AO0Label_2                    matlab.ui.control.Label
        voltageinLabel_3              matlab.ui.control.Label
        Trek3Label                    matlab.ui.control.Label
        AO3Label_2                    matlab.ui.control.Label
        voltageinLabel_2              matlab.ui.control.Label
        Trek2Label                    matlab.ui.control.Label
        AO2Label_2                    matlab.ui.control.Label
        voltageinLabel                matlab.ui.control.Label
        Trek1Label_22                 matlab.ui.control.Label
        AO1Label_2                    matlab.ui.control.Label
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
        kV;
        kI; %todo: input from the panel
        kF;
        kL;
        type_DAQ = 2;
        rawFilename;
    end

    %% DAQ
    methods (Access = private)

        function buildSignal(app)
            timeTotal = app.TotaltimeEditField.Value;
            sampRate = app.SamplerateEditField.Value;

            % Build voltage signals
            time = (-app.timeInit: 1/sampRate: timeTotal - 1/sampRate)';


            voltageSignal_1 = createBaseSignal(app, time, app.Reversepolarity1Button.Value, app.Amplitude1EditField.Value, app.method1DropDown.Value, app.dutyratio1EditField.Value*0.01, app.rampspeed1EditField.Value, app.offset1EditField.Value * app.offsetCheckBox.Value, app.delay1EditField.Value * app.delayCheckBox.Value, app.expo1EditField.Value);
            voltageSignal_2 = createBaseSignal(app, time, app.Reversepolarity2Button.Value, app.Amplitude2EditField.Value,  app.method2DropDown.Value, app.dutyratio2EditField.Value*0.01, app.rampspeed2EditField.Value, app.offset2EditField.Value * app.offsetCheckBox.Value, app.delay2EditField.Value * app.delayCheckBox.Value, app.expo2EditField.Value);
            voltageSignal_3 = createBaseSignal(app, time, app.Reversepolarity3Button.Value, app.Amplitude3EditField.Value,  app.method3DropDown.Value, app.dutyratio3EditField.Value*0.01, app.rampspeed3EditField.Value, app.offset3EditField.Value * app.offsetCheckBox.Value, app.delay3EditField.Value * app.delayCheckBox.Value, app.expo3EditField.Value);
            voltageSignal_4 = createBaseSignal(app, time, app.Reversepolarity4Button.Value, app.Amplitude4EditField.Value,  app.method4DropDown.Value, app.dutyratio4EditField.Value*0.01, app.rampspeed4EditField.Value, app.offset4EditField.Value * app.offsetCheckBox.Value, app.delay4EditField.Value * app.delayCheckBox.Value, app.expo4EditField.Value);

            refSignal = zeros(size(time)); % dump signal, originally used for reference signal for TF estimation

            app.fullSignal = [time, refSignal, voltageSignal_1, voltageSignal_2, voltageSignal_3, voltageSignal_4];
        end

        function voltageSignal = createBaseSignal(app, time, flag_rp, amp, method, dutyRatio, rampSpd, offset, phase, expo)
            sampRate = app.SamplerateEditField.Value;
            frequency = app.CyclefrequencyEditField.Value;
            time_total = app.TotaltimeEditField.Value;
            time_init = app.timeInit;


            phase_delay = deg2rad(mod(phase, 360));
            time_delay = phase_delay/(2*pi*frequency);
            ind_delay = floor(time_delay*sampRate);

            signalBase = sin(2*pi*frequency*time);
            voltageSignal = zeros(size(time));




            switch method
                case 'sine'
                    voltageSignal = abs(signalBase);

                case 'sine mod'
                    voltageSignal = abs(signalBase.^expo);

                case 'triangle'
                    voltageSignal = asin(sin(2*pi*frequency*time));
                    voltageSignal = abs(voltageSignal/pi*2); % adujust for correct amplitude

                case 'sawtooth'
                    voltageSignal = 2*frequency*time - floor(2*frequency*time);

                case 'step'
                    voltageSignal = floor(dutyRatio - 2*frequency*time) - floor(-2*frequency*time);

                case 'ramped square'
                    voltageSignal = floor(dutyRatio - 2*frequency*time) - floor(-2*frequency*time); % generate a step signal

                    time_cycle = 1/frequency/2;
                    time_rmp = amp/rampSpd;
                    time_hold = 1/frequency/2*dutyRatio;

                    if time_cycle < 2*time_rmp + time_hold
                        uiwait(msgbox("'one cycle is longer than the set frequency: increase ramp speed or reduce duty ratio'", "Error", 'modal'));
                    end

                    ind_rmpTime = ceil(time_rmp*sampRate);
                    ind_holdTime = ceil(time_hold*sampRate);


                    voltageSignal = [zeros(ind_rmpTime, 1); voltageSignal(1: end - ind_rmpTime, 1)]; % shift the step signal


                    for i = 1: ceil(time_total/time_cycle)
                        ind_cycleStart = floor((time_init + (i-1)*time_cycle)*sampRate) + 1;
                        ind_holdEnd = ind_cycleStart + ind_rmpTime + ind_holdTime;
                        voltageSignal(ind_cycleStart: ind_cycleStart + ind_rmpTime) = linspace(0, 1, ind_rmpTime + 1);
                        voltageSignal(ind_holdEnd: ind_holdEnd + ind_rmpTime) = linspace(1, 0, ind_rmpTime + 1);
                    end

                    voltageSignal = voltageSignal(1:length(time));
            end

            if flag_rp
                mask = sign(signalBase); % create a mask for reverse polarity
                voltageSignal = voltageSignal.*mask; % set direction for reversed polarity
            end
            voltageSignal = [zeros(ind_delay, 1); voltageSignal(1: end - ind_delay, 1)]; % shift phase
            voltageSignal(time < time_delay) = 0;  % zero padding to avoid sudden ramp up from the phase shift

            voltageSignal = amp*voltageSignal; % set amplitude
            voltageSignal = voltageSignal + offset; % add offset

            voltageSignal(time < 0) = 0; % zero padding for initializing time

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


            if endIndex >= length(app.Arr.time)
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
            goButtonRecording(app);
        end

        function stop_measurement(app)
            setFname(app);
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
                num2str(app.Amplitude1EditField.Value*10,   '%02.0f'), 'kV_',...
                num2str(app.CyclefrequencyEditField.Value*10, '%03.0f'), 'Hz_',...
                num2str(app.SamplerateEditField.Value,   '%04.0f'), 'Hz_',...
                num2str(app.dutyratio2EditField.Value,   '%04.0f'), 'duty_',...
                num2str(app.expo1EditField.Value,         '%02.0f'), 'exp_',...
                num2str(app.delay1EditField.Value,       '%03.0f'), 'deg_',...
                num2str(app.delay2EditField.Value,       '%03.0f'), 'deg_',...
                num2str(app.delay3EditField.Value,       '%03.0f'), 'deg_',...
                num2str(app.delay4EditField.Value,       '%03.0f'), 'deg_',...
                ];
            app.rawFilename = fullfile(app.SelectfilepathEditField.Value,...
                [app.RawfileprefixEditField.Value, app.ProcessedfilenameEditField.Value, '_', textPara, char(datetime("now","Format", "yyyy_MM_dd_HHmm_ss"))]);

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

            app.RawfileprefixEditField.Enable = 0;




            buildPreview(app);

            goButtonReady(app);

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

        % Callback function
        function TREKvoltageconstantkVEditFieldValueChanged(app, event)
            app.kV = app.TREKvoltageconstantkVEditField.Value;
        end

        % Callback function
        function TREKcurrentconstantmAEditFieldValueChanged(app, event)
            app.kI = app.TREKcurrentconstantmAEditField.Value;
        end

        % Callback function
        function MinfrequencyEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function: not associated with a component
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
            if app.NumberofforcestepsEditField.Value == 1
                app.LogdistributionCheckBox.Value = 0;
                app.LogdistributionCheckBox.Enable = 0;
            elseif ~app.LogdistributionCheckBox.Enable
                app.LogdistributionCheckBox.Enable = 1;
            end

            buildPreview(app);
        end

        % Callback function
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

        % Value changed function: CyclefrequencyEditField
        function CyclefrequencyEditFieldValueChanged(app, event)
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

        % Value changed function: expo1EditField
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

        % Value changed function: offsetCheckBox
        function offsetCheckBoxValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: expo2EditField
        function expo2EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: expo3EditField
        function expo3EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: expo4EditField
        function expo4EditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Reversepolarity1Button
        function Reversepolarity1ButtonValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Reversepolarity2Button
        function Reversepolarity2ButtonValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Reversepolarity3Button
        function Reversepolarity3ButtonValueChanged(app, event)
            buildPreview(app);
        end

        % Value changed function: Reversepolarity4Button
        function Reversepolarity4ButtonValueChanged(app, event)
            buildPreview(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1555 688];
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
            app.UIAxes.Position = [21 402 1251 270];

            % Create SetupPanel_2
            app.SetupPanel_2 = uipanel(app.UIFigure);
            app.SetupPanel_2.TitlePosition = 'centertop';
            app.SetupPanel_2.Title = 'Setup';
            app.SetupPanel_2.FontWeight = 'bold';
            app.SetupPanel_2.FontSize = 14;
            app.SetupPanel_2.Position = [1305 26 231 646];

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.SetupPanel_2);
            app.GridLayout4.ColumnWidth = {'1x'};
            app.GridLayout4.RowHeight = {'fit', 'fit', '1x'};

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

            % Create AO2Label_2
            app.AO2Label_2 = uilabel(app.GridLayout5);
            app.AO2Label_2.Layout.Row = 2;
            app.AO2Label_2.Layout.Column = 1;
            app.AO2Label_2.Text = 'AO2';

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

            % Create AO3Label_2
            app.AO3Label_2 = uilabel(app.GridLayout5);
            app.AO3Label_2.Layout.Row = 3;
            app.AO3Label_2.Layout.Column = 1;
            app.AO3Label_2.Text = 'AO3';

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

            % Create AO0Label_2
            app.AO0Label_2 = uilabel(app.GridLayout5);
            app.AO0Label_2.Layout.Row = 4;
            app.AO0Label_2.Layout.Column = 1;
            app.AO0Label_2.Text = 'AO0';

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

            % Create DAQtypeButtonGroup
            app.DAQtypeButtonGroup = uibuttongroup(app.UIFigure);
            app.DAQtypeButtonGroup.TitlePosition = 'centertop';
            app.DAQtypeButtonGroup.Title = 'DAQ type';
            app.DAQtypeButtonGroup.FontWeight = 'bold';
            app.DAQtypeButtonGroup.Position = [24 221 145 131];

            % Create outputs2Button
            app.outputs2Button = uiradiobutton(app.DAQtypeButtonGroup);
            app.outputs2Button.Enable = 'off';
            app.outputs2Button.Text = '2 outputs';
            app.outputs2Button.Position = [10 73 71 22];
            app.outputs2Button.Value = true;

            % Create outputs4Button
            app.outputs4Button = uiradiobutton(app.DAQtypeButtonGroup);
            app.outputs4Button.Enable = 'off';
            app.outputs4Button.Text = '4 outputs';
            app.outputs4Button.Position = [10 44 71 22];

            % Create SignalparameterPanel
            app.SignalparameterPanel = uipanel(app.UIFigure);
            app.SignalparameterPanel.TitlePosition = 'centertop';
            app.SignalparameterPanel.Title = 'Signal parameter';
            app.SignalparameterPanel.FontWeight = 'bold';
            app.SignalparameterPanel.FontSize = 14;
            app.SignalparameterPanel.Position = [202 220 439 132];

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.SignalparameterPanel);
            app.GridLayout7.ColumnWidth = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
            app.GridLayout7.RowHeight = {'1x', '1x', '1x'};
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
            app.SamplerateEditField.Value = 1000;

            % Create HzLabel_5
            app.HzLabel_5 = uilabel(app.GridLayout7);
            app.HzLabel_5.Layout.Row = 1;
            app.HzLabel_5.Layout.Column = 3;
            app.HzLabel_5.Text = 'Hz';

            % Create CyclefrequencyEditFieldLabel
            app.CyclefrequencyEditFieldLabel = uilabel(app.GridLayout7);
            app.CyclefrequencyEditFieldLabel.HorizontalAlignment = 'right';
            app.CyclefrequencyEditFieldLabel.Layout.Row = 1;
            app.CyclefrequencyEditFieldLabel.Layout.Column = 4;
            app.CyclefrequencyEditFieldLabel.Text = 'Cycle frequency';

            % Create CyclefrequencyEditField
            app.CyclefrequencyEditField = uieditfield(app.GridLayout7, 'numeric');
            app.CyclefrequencyEditField.Limits = [0 Inf];
            app.CyclefrequencyEditField.ValueChangedFcn = createCallbackFcn(app, @CyclefrequencyEditFieldValueChanged, true);
            app.CyclefrequencyEditField.Layout.Row = 1;
            app.CyclefrequencyEditField.Layout.Column = 5;
            app.CyclefrequencyEditField.Value = 1;

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
            app.TotaltimeEditField.Value = 4;

            % Create sLabel
            app.sLabel = uilabel(app.GridLayout7);
            app.sLabel.Layout.Row = 2;
            app.sLabel.Layout.Column = 3;
            app.sLabel.Text = 's';

            % Create FilenamesPanel
            app.FilenamesPanel = uipanel(app.UIFigure);
            app.FilenamesPanel.TitlePosition = 'centertop';
            app.FilenamesPanel.Title = 'File names';
            app.FilenamesPanel.FontWeight = 'bold';
            app.FilenamesPanel.FontSize = 14;
            app.FilenamesPanel.Position = [678 220 612 132];

            % Create GridLayout8
            app.GridLayout8 = uigridlayout(app.FilenamesPanel);
            app.GridLayout8.ColumnWidth = {'fit', '3x', 'fit', '1x'};
            app.GridLayout8.RowHeight = {'1x', '1x', '1x'};

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
            app.SelectfilepathEditField.Value = 'C:\Users\fukushima\Desktop\HASEL_signalGenerator\';

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
            app.GoButton.Layout.Row = [1 3];
            app.GoButton.Layout.Column = 4;

            % Create ProcessedfilenameLabel
            app.ProcessedfilenameLabel = uilabel(app.GridLayout8);
            app.ProcessedfilenameLabel.HorizontalAlignment = 'right';
            app.ProcessedfilenameLabel.Layout.Row = 2;
            app.ProcessedfilenameLabel.Layout.Column = 1;
            app.ProcessedfilenameLabel.Text = 'Processed filename:';

            % Create ProcessedfilenameEditField
            app.ProcessedfilenameEditField = uieditfield(app.GridLayout8, 'text');
            app.ProcessedfilenameEditField.Layout.Row = 2;
            app.ProcessedfilenameEditField.Layout.Column = 2;
            app.ProcessedfilenameEditField.Value = 'XXX';

            % Create RawfileprefixEditFieldLabel
            app.RawfileprefixEditFieldLabel = uilabel(app.GridLayout8);
            app.RawfileprefixEditFieldLabel.HorizontalAlignment = 'right';
            app.RawfileprefixEditFieldLabel.Enable = 'off';
            app.RawfileprefixEditFieldLabel.Layout.Row = 3;
            app.RawfileprefixEditFieldLabel.Layout.Column = 1;
            app.RawfileprefixEditFieldLabel.Text = 'Raw file prefix';

            % Create RawfileprefixEditField
            app.RawfileprefixEditField = uieditfield(app.GridLayout8, 'text');
            app.RawfileprefixEditField.Enable = 'off';
            app.RawfileprefixEditField.Layout.Row = 3;
            app.RawfileprefixEditField.Layout.Column = 2;
            app.RawfileprefixEditField.Value = 'raw_';

            % Create WavesettingsPanel
            app.WavesettingsPanel = uipanel(app.UIFigure);
            app.WavesettingsPanel.TitlePosition = 'centertop';
            app.WavesettingsPanel.Title = 'Wave settings';
            app.WavesettingsPanel.FontWeight = 'bold';
            app.WavesettingsPanel.FontSize = 14;
            app.WavesettingsPanel.Position = [23 26 1269 184];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.WavesettingsPanel);
            app.GridLayout.ColumnWidth = {'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit', 'fit'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x'};

            % Create AmplitudeLabel
            app.AmplitudeLabel = uilabel(app.GridLayout);
            app.AmplitudeLabel.Layout.Row = 1;
            app.AmplitudeLabel.Layout.Column = 2;
            app.AmplitudeLabel.Text = 'Amplitude';

            % Create kVVLabel
            app.kVVLabel = uilabel(app.GridLayout);
            app.kVVLabel.HorizontalAlignment = 'center';
            app.kVVLabel.Layout.Row = 1;
            app.kVVLabel.Layout.Column = 3;
            app.kVVLabel.Text = 'kV / V';

            % Create offsetCheckBox
            app.offsetCheckBox = uicheckbox(app.GridLayout);
            app.offsetCheckBox.ValueChangedFcn = createCallbackFcn(app, @offsetCheckBoxValueChanged, true);
            app.offsetCheckBox.Text = 'offset';
            app.offsetCheckBox.Layout.Row = 1;
            app.offsetCheckBox.Layout.Column = 4;
            app.offsetCheckBox.Value = true;

            % Create kVLabel_2
            app.kVLabel_2 = uilabel(app.GridLayout);
            app.kVLabel_2.HorizontalAlignment = 'center';
            app.kVLabel_2.Layout.Row = 1;
            app.kVLabel_2.Layout.Column = 5;
            app.kVLabel_2.Text = 'kV';

            % Create delayCheckBox
            app.delayCheckBox = uicheckbox(app.GridLayout);
            app.delayCheckBox.ValueChangedFcn = createCallbackFcn(app, @delayCheckBoxValueChanged, true);
            app.delayCheckBox.Text = 'delay';
            app.delayCheckBox.Layout.Row = 1;
            app.delayCheckBox.Layout.Column = 6;
            app.delayCheckBox.Value = true;

            % Create degLabel
            app.degLabel = uilabel(app.GridLayout);
            app.degLabel.HorizontalAlignment = 'center';
            app.degLabel.Layout.Row = 1;
            app.degLabel.Layout.Column = 7;
            app.degLabel.Text = 'deg';

            % Create methodLabel
            app.methodLabel = uilabel(app.GridLayout);
            app.methodLabel.HorizontalAlignment = 'center';
            app.methodLabel.Layout.Row = 1;
            app.methodLabel.Layout.Column = 9;
            app.methodLabel.Text = 'method';

            % Create forstepLabel
            app.forstepLabel = uilabel(app.GridLayout);
            app.forstepLabel.HorizontalAlignment = 'center';
            app.forstepLabel.FontWeight = 'bold';
            app.forstepLabel.Layout.Row = 1;
            app.forstepLabel.Layout.Column = 10;
            app.forstepLabel.Text = 'for step';

            % Create Label
            app.Label = uilabel(app.GridLayout);
            app.Label.HorizontalAlignment = 'center';
            app.Label.Layout.Row = 1;
            app.Label.Layout.Column = 11;
            app.Label.Text = '%';

            % Create forrampLabel
            app.forrampLabel = uilabel(app.GridLayout);
            app.forrampLabel.HorizontalAlignment = 'center';
            app.forrampLabel.FontWeight = 'bold';
            app.forrampLabel.Layout.Row = 1;
            app.forrampLabel.Layout.Column = 12;
            app.forrampLabel.Text = 'for ramp';

            % Create kVsLabel
            app.kVsLabel = uilabel(app.GridLayout);
            app.kVsLabel.HorizontalAlignment = 'center';
            app.kVsLabel.Layout.Row = 1;
            app.kVsLabel.Layout.Column = 13;
            app.kVsLabel.Text = 'kV/s';

            % Create forsinemodLabel
            app.forsinemodLabel = uilabel(app.GridLayout);
            app.forsinemodLabel.FontWeight = 'bold';
            app.forsinemodLabel.Layout.Row = 1;
            app.forsinemodLabel.Layout.Column = 14;
            app.forsinemodLabel.Text = 'for sine mod';

            % Create sinxexpoLabel
            app.sinxexpoLabel = uilabel(app.GridLayout);
            app.sinxexpoLabel.Layout.Row = 1;
            app.sinxexpoLabel.Layout.Column = 15;
            app.sinxexpoLabel.Text = 'sin(x)^expo';

            % Create Reversepolarity1Button
            app.Reversepolarity1Button = uibutton(app.GridLayout, 'state');
            app.Reversepolarity1Button.ValueChangedFcn = createCallbackFcn(app, @Reversepolarity1ButtonValueChanged, true);
            app.Reversepolarity1Button.Text = 'Reverse polarity 1';
            app.Reversepolarity1Button.Layout.Row = 2;
            app.Reversepolarity1Button.Layout.Column = 1;

            % Create Amplitude1Label
            app.Amplitude1Label = uilabel(app.GridLayout);
            app.Amplitude1Label.HorizontalAlignment = 'right';
            app.Amplitude1Label.Layout.Row = 2;
            app.Amplitude1Label.Layout.Column = 2;
            app.Amplitude1Label.Text = 'Amplitude 1';

            % Create Amplitude1EditField
            app.Amplitude1EditField = uieditfield(app.GridLayout, 'numeric');
            app.Amplitude1EditField.ValueChangedFcn = createCallbackFcn(app, @Amplitude1EditFieldValueChanged, true);
            app.Amplitude1EditField.Layout.Row = 2;
            app.Amplitude1EditField.Layout.Column = 3;
            app.Amplitude1EditField.Value = 3.3;

            % Create offset1EditFieldLabel
            app.offset1EditFieldLabel = uilabel(app.GridLayout);
            app.offset1EditFieldLabel.HorizontalAlignment = 'right';
            app.offset1EditFieldLabel.Layout.Row = 2;
            app.offset1EditFieldLabel.Layout.Column = 4;
            app.offset1EditFieldLabel.Text = 'offset 1';

            % Create offset1EditField
            app.offset1EditField = uieditfield(app.GridLayout, 'numeric');
            app.offset1EditField.ValueChangedFcn = createCallbackFcn(app, @offset1EditFieldValueChanged, true);
            app.offset1EditField.Layout.Row = 2;
            app.offset1EditField.Layout.Column = 5;

            % Create delay1EditFieldLabel
            app.delay1EditFieldLabel = uilabel(app.GridLayout);
            app.delay1EditFieldLabel.HorizontalAlignment = 'right';
            app.delay1EditFieldLabel.Layout.Row = 2;
            app.delay1EditFieldLabel.Layout.Column = 6;
            app.delay1EditFieldLabel.Text = 'delay 1';

            % Create delay1EditField
            app.delay1EditField = uieditfield(app.GridLayout, 'numeric');
            app.delay1EditField.ValueChangedFcn = createCallbackFcn(app, @delay1EditFieldValueChanged, true);
            app.delay1EditField.Layout.Row = 2;
            app.delay1EditField.Layout.Column = 7;

            % Create method1DropDownLabel
            app.method1DropDownLabel = uilabel(app.GridLayout);
            app.method1DropDownLabel.HorizontalAlignment = 'right';
            app.method1DropDownLabel.Layout.Row = 2;
            app.method1DropDownLabel.Layout.Column = 8;
            app.method1DropDownLabel.Text = 'method 1';

            % Create method1DropDown
            app.method1DropDown = uidropdown(app.GridLayout);
            app.method1DropDown.Items = {'sine', 'sine mod', 'step', 'ramped square', 'triangle', 'sawtooth'};
            app.method1DropDown.ValueChangedFcn = createCallbackFcn(app, @method1DropDownValueChanged, true);
            app.method1DropDown.Layout.Row = 2;
            app.method1DropDown.Layout.Column = 9;
            app.method1DropDown.Value = 'step';

            % Create dutyratio1EditFieldLabel
            app.dutyratio1EditFieldLabel = uilabel(app.GridLayout);
            app.dutyratio1EditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratio1EditFieldLabel.Layout.Row = 2;
            app.dutyratio1EditFieldLabel.Layout.Column = 10;
            app.dutyratio1EditFieldLabel.Text = 'duty ratio 1';

            % Create dutyratio1EditField
            app.dutyratio1EditField = uieditfield(app.GridLayout, 'numeric');
            app.dutyratio1EditField.Limits = [0 Inf];
            app.dutyratio1EditField.ValueChangedFcn = createCallbackFcn(app, @dutyratio1EditFieldValueChanged, true);
            app.dutyratio1EditField.Layout.Row = 2;
            app.dutyratio1EditField.Layout.Column = 11;
            app.dutyratio1EditField.Value = 50;

            % Create rampspeed1EditFieldLabel
            app.rampspeed1EditFieldLabel = uilabel(app.GridLayout);
            app.rampspeed1EditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeed1EditFieldLabel.Layout.Row = 2;
            app.rampspeed1EditFieldLabel.Layout.Column = 12;
            app.rampspeed1EditFieldLabel.Text = 'ramp speed 1';

            % Create rampspeed1EditField
            app.rampspeed1EditField = uieditfield(app.GridLayout, 'numeric');
            app.rampspeed1EditField.Limits = [0 Inf];
            app.rampspeed1EditField.ValueChangedFcn = createCallbackFcn(app, @rampspeed1EditFieldValueChanged, true);
            app.rampspeed1EditField.Layout.Row = 2;
            app.rampspeed1EditField.Layout.Column = 13;
            app.rampspeed1EditField.Value = 50;

            % Create expo1EditFieldLabel
            app.expo1EditFieldLabel = uilabel(app.GridLayout);
            app.expo1EditFieldLabel.HorizontalAlignment = 'right';
            app.expo1EditFieldLabel.Layout.Row = 2;
            app.expo1EditFieldLabel.Layout.Column = 14;
            app.expo1EditFieldLabel.Text = 'expo 1';

            % Create expo1EditField
            app.expo1EditField = uieditfield(app.GridLayout, 'numeric');
            app.expo1EditField.ValueChangedFcn = createCallbackFcn(app, @expo1EditFieldValueChanged, true);
            app.expo1EditField.Layout.Row = 2;
            app.expo1EditField.Layout.Column = 15;
            app.expo1EditField.Value = 2;

            % Create Reversepolarity2Button
            app.Reversepolarity2Button = uibutton(app.GridLayout, 'state');
            app.Reversepolarity2Button.ValueChangedFcn = createCallbackFcn(app, @Reversepolarity2ButtonValueChanged, true);
            app.Reversepolarity2Button.Text = 'Reverse polarity 2';
            app.Reversepolarity2Button.Layout.Row = 3;
            app.Reversepolarity2Button.Layout.Column = 1;
            app.Reversepolarity2Button.Value = true;

            % Create Amplitude2EditFieldLabel
            app.Amplitude2EditFieldLabel = uilabel(app.GridLayout);
            app.Amplitude2EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude2EditFieldLabel.Layout.Row = 3;
            app.Amplitude2EditFieldLabel.Layout.Column = 2;
            app.Amplitude2EditFieldLabel.Text = 'Amplitude 2';

            % Create Amplitude2EditField
            app.Amplitude2EditField = uieditfield(app.GridLayout, 'numeric');
            app.Amplitude2EditField.ValueChangedFcn = createCallbackFcn(app, @Amplitude2EditFieldValueChanged, true);
            app.Amplitude2EditField.Layout.Row = 3;
            app.Amplitude2EditField.Layout.Column = 3;
            app.Amplitude2EditField.Value = 8;

            % Create offset2EditFieldLabel
            app.offset2EditFieldLabel = uilabel(app.GridLayout);
            app.offset2EditFieldLabel.HorizontalAlignment = 'right';
            app.offset2EditFieldLabel.Layout.Row = 3;
            app.offset2EditFieldLabel.Layout.Column = 4;
            app.offset2EditFieldLabel.Text = 'offset 2';

            % Create offset2EditField
            app.offset2EditField = uieditfield(app.GridLayout, 'numeric');
            app.offset2EditField.ValueChangedFcn = createCallbackFcn(app, @offset2EditFieldValueChanged, true);
            app.offset2EditField.Layout.Row = 3;
            app.offset2EditField.Layout.Column = 5;

            % Create delay2EditFieldLabel
            app.delay2EditFieldLabel = uilabel(app.GridLayout);
            app.delay2EditFieldLabel.HorizontalAlignment = 'right';
            app.delay2EditFieldLabel.Layout.Row = 3;
            app.delay2EditFieldLabel.Layout.Column = 6;
            app.delay2EditFieldLabel.Text = 'delay 2';

            % Create delay2EditField
            app.delay2EditField = uieditfield(app.GridLayout, 'numeric');
            app.delay2EditField.ValueChangedFcn = createCallbackFcn(app, @delay2EditFieldValueChanged, true);
            app.delay2EditField.Layout.Row = 3;
            app.delay2EditField.Layout.Column = 7;

            % Create method2DropDownLabel
            app.method2DropDownLabel = uilabel(app.GridLayout);
            app.method2DropDownLabel.HorizontalAlignment = 'right';
            app.method2DropDownLabel.Layout.Row = 3;
            app.method2DropDownLabel.Layout.Column = 8;
            app.method2DropDownLabel.Text = 'method 2';

            % Create method2DropDown
            app.method2DropDown = uidropdown(app.GridLayout);
            app.method2DropDown.Items = {'sine', 'sine mod', 'step', 'ramped square', 'triangle', 'sawtooth'};
            app.method2DropDown.ValueChangedFcn = createCallbackFcn(app, @method2DropDownValueChanged, true);
            app.method2DropDown.Layout.Row = 3;
            app.method2DropDown.Layout.Column = 9;
            app.method2DropDown.Value = 'sine';

            % Create dutyratio2EditFieldLabel
            app.dutyratio2EditFieldLabel = uilabel(app.GridLayout);
            app.dutyratio2EditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratio2EditFieldLabel.Layout.Row = 3;
            app.dutyratio2EditFieldLabel.Layout.Column = 10;
            app.dutyratio2EditFieldLabel.Text = 'duty ratio 2';

            % Create dutyratio2EditField
            app.dutyratio2EditField = uieditfield(app.GridLayout, 'numeric');
            app.dutyratio2EditField.Limits = [0 Inf];
            app.dutyratio2EditField.ValueChangedFcn = createCallbackFcn(app, @dutyratio2EditFieldValueChanged, true);
            app.dutyratio2EditField.Layout.Row = 3;
            app.dutyratio2EditField.Layout.Column = 11;
            app.dutyratio2EditField.Value = 10;

            % Create rampspeed2EditFieldLabel
            app.rampspeed2EditFieldLabel = uilabel(app.GridLayout);
            app.rampspeed2EditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeed2EditFieldLabel.Layout.Row = 3;
            app.rampspeed2EditFieldLabel.Layout.Column = 12;
            app.rampspeed2EditFieldLabel.Text = 'ramp speed 2';

            % Create rampspeed2EditField
            app.rampspeed2EditField = uieditfield(app.GridLayout, 'numeric');
            app.rampspeed2EditField.Limits = [0 Inf];
            app.rampspeed2EditField.ValueChangedFcn = createCallbackFcn(app, @rampspeed2EditFieldValueChanged, true);
            app.rampspeed2EditField.Layout.Row = 3;
            app.rampspeed2EditField.Layout.Column = 13;
            app.rampspeed2EditField.Value = 50;

            % Create expo2EditFieldLabel
            app.expo2EditFieldLabel = uilabel(app.GridLayout);
            app.expo2EditFieldLabel.HorizontalAlignment = 'right';
            app.expo2EditFieldLabel.Layout.Row = 3;
            app.expo2EditFieldLabel.Layout.Column = 14;
            app.expo2EditFieldLabel.Text = 'expo 2';

            % Create expo2EditField
            app.expo2EditField = uieditfield(app.GridLayout, 'numeric');
            app.expo2EditField.ValueChangedFcn = createCallbackFcn(app, @expo2EditFieldValueChanged, true);
            app.expo2EditField.Layout.Row = 3;
            app.expo2EditField.Layout.Column = 15;
            app.expo2EditField.Value = 2;

            % Create Reversepolarity3Button
            app.Reversepolarity3Button = uibutton(app.GridLayout, 'state');
            app.Reversepolarity3Button.ValueChangedFcn = createCallbackFcn(app, @Reversepolarity3ButtonValueChanged, true);
            app.Reversepolarity3Button.Text = 'Reverse polarity 3';
            app.Reversepolarity3Button.Layout.Row = 4;
            app.Reversepolarity3Button.Layout.Column = 1;

            % Create Amplitude3EditFieldLabel
            app.Amplitude3EditFieldLabel = uilabel(app.GridLayout);
            app.Amplitude3EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude3EditFieldLabel.Layout.Row = 4;
            app.Amplitude3EditFieldLabel.Layout.Column = 2;
            app.Amplitude3EditFieldLabel.Text = 'Amplitude 3';

            % Create Amplitude3EditField
            app.Amplitude3EditField = uieditfield(app.GridLayout, 'numeric');
            app.Amplitude3EditField.ValueChangedFcn = createCallbackFcn(app, @Amplitude3EditFieldValueChanged, true);
            app.Amplitude3EditField.Layout.Row = 4;
            app.Amplitude3EditField.Layout.Column = 3;

            % Create offset3EditFieldLabel
            app.offset3EditFieldLabel = uilabel(app.GridLayout);
            app.offset3EditFieldLabel.HorizontalAlignment = 'right';
            app.offset3EditFieldLabel.Layout.Row = 4;
            app.offset3EditFieldLabel.Layout.Column = 4;
            app.offset3EditFieldLabel.Text = 'offset 3';

            % Create offset3EditField
            app.offset3EditField = uieditfield(app.GridLayout, 'numeric');
            app.offset3EditField.ValueChangedFcn = createCallbackFcn(app, @offset3EditFieldValueChanged, true);
            app.offset3EditField.Layout.Row = 4;
            app.offset3EditField.Layout.Column = 5;

            % Create delay3EditFieldLabel
            app.delay3EditFieldLabel = uilabel(app.GridLayout);
            app.delay3EditFieldLabel.HorizontalAlignment = 'right';
            app.delay3EditFieldLabel.Layout.Row = 4;
            app.delay3EditFieldLabel.Layout.Column = 6;
            app.delay3EditFieldLabel.Text = 'delay 3';

            % Create delay3EditField
            app.delay3EditField = uieditfield(app.GridLayout, 'numeric');
            app.delay3EditField.ValueChangedFcn = createCallbackFcn(app, @delay3EditFieldValueChanged, true);
            app.delay3EditField.Layout.Row = 4;
            app.delay3EditField.Layout.Column = 7;

            % Create method3DropDownLabel
            app.method3DropDownLabel = uilabel(app.GridLayout);
            app.method3DropDownLabel.HorizontalAlignment = 'right';
            app.method3DropDownLabel.Layout.Row = 4;
            app.method3DropDownLabel.Layout.Column = 8;
            app.method3DropDownLabel.Text = 'method 3';

            % Create method3DropDown
            app.method3DropDown = uidropdown(app.GridLayout);
            app.method3DropDown.Items = {'sine', 'sine mod', 'step', 'ramped square', 'triangle', 'sawtooth'};
            app.method3DropDown.ValueChangedFcn = createCallbackFcn(app, @method3DropDownValueChanged, true);
            app.method3DropDown.Layout.Row = 4;
            app.method3DropDown.Layout.Column = 9;
            app.method3DropDown.Value = 'sine';

            % Create dutyratio3EditFieldLabel
            app.dutyratio3EditFieldLabel = uilabel(app.GridLayout);
            app.dutyratio3EditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratio3EditFieldLabel.Layout.Row = 4;
            app.dutyratio3EditFieldLabel.Layout.Column = 10;
            app.dutyratio3EditFieldLabel.Text = 'duty ratio 3';

            % Create dutyratio3EditField
            app.dutyratio3EditField = uieditfield(app.GridLayout, 'numeric');
            app.dutyratio3EditField.Limits = [0 Inf];
            app.dutyratio3EditField.ValueChangedFcn = createCallbackFcn(app, @dutyratio3EditFieldValueChanged, true);
            app.dutyratio3EditField.Layout.Row = 4;
            app.dutyratio3EditField.Layout.Column = 11;
            app.dutyratio3EditField.Value = 10;

            % Create rampspeed3EditFieldLabel
            app.rampspeed3EditFieldLabel = uilabel(app.GridLayout);
            app.rampspeed3EditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeed3EditFieldLabel.Layout.Row = 4;
            app.rampspeed3EditFieldLabel.Layout.Column = 12;
            app.rampspeed3EditFieldLabel.Text = 'ramp speed 3';

            % Create rampspeed3EditField
            app.rampspeed3EditField = uieditfield(app.GridLayout, 'numeric');
            app.rampspeed3EditField.Limits = [0 Inf];
            app.rampspeed3EditField.ValueChangedFcn = createCallbackFcn(app, @rampspeed3EditFieldValueChanged, true);
            app.rampspeed3EditField.Layout.Row = 4;
            app.rampspeed3EditField.Layout.Column = 13;
            app.rampspeed3EditField.Value = 50;

            % Create expo3EditFieldLabel
            app.expo3EditFieldLabel = uilabel(app.GridLayout);
            app.expo3EditFieldLabel.HorizontalAlignment = 'right';
            app.expo3EditFieldLabel.Layout.Row = 4;
            app.expo3EditFieldLabel.Layout.Column = 14;
            app.expo3EditFieldLabel.Text = 'expo 3';

            % Create expo3EditField
            app.expo3EditField = uieditfield(app.GridLayout, 'numeric');
            app.expo3EditField.ValueChangedFcn = createCallbackFcn(app, @expo3EditFieldValueChanged, true);
            app.expo3EditField.Layout.Row = 4;
            app.expo3EditField.Layout.Column = 15;
            app.expo3EditField.Value = 2;

            % Create Reversepolarity4Button
            app.Reversepolarity4Button = uibutton(app.GridLayout, 'state');
            app.Reversepolarity4Button.ValueChangedFcn = createCallbackFcn(app, @Reversepolarity4ButtonValueChanged, true);
            app.Reversepolarity4Button.Text = 'Reverse polarity 4';
            app.Reversepolarity4Button.Layout.Row = 5;
            app.Reversepolarity4Button.Layout.Column = 1;

            % Create Amplitude4EditFieldLabel
            app.Amplitude4EditFieldLabel = uilabel(app.GridLayout);
            app.Amplitude4EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude4EditFieldLabel.Layout.Row = 5;
            app.Amplitude4EditFieldLabel.Layout.Column = 2;
            app.Amplitude4EditFieldLabel.Text = 'Amplitude 4';

            % Create Amplitude4EditField
            app.Amplitude4EditField = uieditfield(app.GridLayout, 'numeric');
            app.Amplitude4EditField.ValueChangedFcn = createCallbackFcn(app, @Amplitude4EditFieldValueChanged, true);
            app.Amplitude4EditField.Layout.Row = 5;
            app.Amplitude4EditField.Layout.Column = 3;

            % Create offset4EditFieldLabel
            app.offset4EditFieldLabel = uilabel(app.GridLayout);
            app.offset4EditFieldLabel.HorizontalAlignment = 'right';
            app.offset4EditFieldLabel.Layout.Row = 5;
            app.offset4EditFieldLabel.Layout.Column = 4;
            app.offset4EditFieldLabel.Text = 'offset 4';

            % Create offset4EditField
            app.offset4EditField = uieditfield(app.GridLayout, 'numeric');
            app.offset4EditField.ValueChangedFcn = createCallbackFcn(app, @offset4EditFieldValueChanged, true);
            app.offset4EditField.Layout.Row = 5;
            app.offset4EditField.Layout.Column = 5;

            % Create delay4EditFieldLabel
            app.delay4EditFieldLabel = uilabel(app.GridLayout);
            app.delay4EditFieldLabel.HorizontalAlignment = 'right';
            app.delay4EditFieldLabel.Layout.Row = 5;
            app.delay4EditFieldLabel.Layout.Column = 6;
            app.delay4EditFieldLabel.Text = 'delay 4';

            % Create delay4EditField
            app.delay4EditField = uieditfield(app.GridLayout, 'numeric');
            app.delay4EditField.ValueChangedFcn = createCallbackFcn(app, @delay4EditFieldValueChanged, true);
            app.delay4EditField.Layout.Row = 5;
            app.delay4EditField.Layout.Column = 7;

            % Create method4DropDownLabel
            app.method4DropDownLabel = uilabel(app.GridLayout);
            app.method4DropDownLabel.HorizontalAlignment = 'right';
            app.method4DropDownLabel.Layout.Row = 5;
            app.method4DropDownLabel.Layout.Column = 8;
            app.method4DropDownLabel.Text = 'method 4';

            % Create method4DropDown
            app.method4DropDown = uidropdown(app.GridLayout);
            app.method4DropDown.Items = {'sine', 'sine mod', 'step', 'ramped square', 'triangle', 'sawtooth'};
            app.method4DropDown.ValueChangedFcn = createCallbackFcn(app, @method4DropDownValueChanged, true);
            app.method4DropDown.Layout.Row = 5;
            app.method4DropDown.Layout.Column = 9;
            app.method4DropDown.Value = 'sine';

            % Create dutyratio4EditFieldLabel
            app.dutyratio4EditFieldLabel = uilabel(app.GridLayout);
            app.dutyratio4EditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratio4EditFieldLabel.Layout.Row = 5;
            app.dutyratio4EditFieldLabel.Layout.Column = 10;
            app.dutyratio4EditFieldLabel.Text = 'duty ratio 4';

            % Create dutyratio4EditField
            app.dutyratio4EditField = uieditfield(app.GridLayout, 'numeric');
            app.dutyratio4EditField.Limits = [0 Inf];
            app.dutyratio4EditField.ValueChangedFcn = createCallbackFcn(app, @dutyratio4EditFieldValueChanged, true);
            app.dutyratio4EditField.Layout.Row = 5;
            app.dutyratio4EditField.Layout.Column = 11;
            app.dutyratio4EditField.Value = 10;

            % Create rampspeed4EditFieldLabel
            app.rampspeed4EditFieldLabel = uilabel(app.GridLayout);
            app.rampspeed4EditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeed4EditFieldLabel.Layout.Row = 5;
            app.rampspeed4EditFieldLabel.Layout.Column = 12;
            app.rampspeed4EditFieldLabel.Text = 'ramp speed 4';

            % Create rampspeed4EditField
            app.rampspeed4EditField = uieditfield(app.GridLayout, 'numeric');
            app.rampspeed4EditField.Limits = [0 Inf];
            app.rampspeed4EditField.ValueChangedFcn = createCallbackFcn(app, @rampspeed4EditFieldValueChanged, true);
            app.rampspeed4EditField.Layout.Row = 5;
            app.rampspeed4EditField.Layout.Column = 13;
            app.rampspeed4EditField.Value = 50;

            % Create expo4EditFieldLabel
            app.expo4EditFieldLabel = uilabel(app.GridLayout);
            app.expo4EditFieldLabel.HorizontalAlignment = 'right';
            app.expo4EditFieldLabel.Layout.Row = 5;
            app.expo4EditFieldLabel.Layout.Column = 14;
            app.expo4EditFieldLabel.Text = 'expo 4';

            % Create expo4EditField
            app.expo4EditField = uieditfield(app.GridLayout, 'numeric');
            app.expo4EditField.ValueChangedFcn = createCallbackFcn(app, @expo4EditFieldValueChanged, true);
            app.expo4EditField.Layout.Row = 5;
            app.expo4EditField.Layout.Column = 15;
            app.expo4EditField.Value = 2;

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