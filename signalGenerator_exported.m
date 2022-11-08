classdef signalGenerator_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        Lamp                            matlab.ui.control.Lamp
        MonitorlimittripstatusCheckBox  matlab.ui.control.CheckBox
        PressStopwhentestiscompletedtosavedataLabel  matlab.ui.control.Label
        CalibrationPanel                matlab.ui.container.Panel
        mmVLabel                        matlab.ui.control.Label
        NVLabel                         matlab.ui.control.Label
        MTlengthconstantkLEditField     matlab.ui.control.NumericEditField
        MTlengthconstantkLEditFieldLabel  matlab.ui.control.Label
        MTforceconstantkFEditField      matlab.ui.control.NumericEditField
        MTforceconstantkFEditFieldLabel  matlab.ui.control.Label
        VkVLabel                        matlab.ui.control.Label
        TREKvoltageconstantkVEditField  matlab.ui.control.NumericEditField
        TREKvoltageconstantkVEditFieldLabel  matlab.ui.control.Label
        HzLabel                         matlab.ui.control.Label
        SamplerateEditField             matlab.ui.control.NumericEditField
        SamplerateEditFieldLabel        matlab.ui.control.Label
        VoltageParametersPanel          matlab.ui.container.Panel
        forrampedsquareinputLabel       matlab.ui.control.Label
        forstepinputLabel               matlab.ui.control.Label
        kVsLabel                        matlab.ui.control.Label
        Label                           matlab.ui.control.Label
        rampspeedEditField              matlab.ui.control.NumericEditField
        rampspeedEditFieldLabel         matlab.ui.control.Label
        dutyratioEditField              matlab.ui.control.NumericEditField
        dutyratioEditFieldLabel         matlab.ui.control.Label
        ReversepolarityCheckBox         matlab.ui.control.CheckBox
        HzLabel_5                       matlab.ui.control.Label
        frequencyEditField              matlab.ui.control.NumericEditField
        frequencyEditFieldLabel         matlab.ui.control.Label
        TotaltimeEditField              matlab.ui.control.NumericEditField
        TotaltimeEditFieldLabel         matlab.ui.control.Label
        sLabel                          matlab.ui.control.Label
        methodDropDown                  matlab.ui.control.DropDown
        methodDropDownLabel             matlab.ui.control.Label
        kVLabel                         matlab.ui.control.Label
        MaxvoltageEditField             matlab.ui.control.NumericEditField
        MaxvoltageEditFieldLabel        matlab.ui.control.Label
        SetupPanel                      matlab.ui.container.Panel
        ao0ao1ai0ai1ai2Label            matlab.ui.control.Label
        SaverawfileCheckBox             matlab.ui.control.CheckBox
        ProcessedfilenameEditField      matlab.ui.control.EditField
        ProcessedfilenameLabel          matlab.ui.control.Label
        RawfileprefixEditField          matlab.ui.control.EditField
        RawfileprefixEditFieldLabel     matlab.ui.control.Label
        SelectfilepathEditField         matlab.ui.control.EditField
        SelectfilepathEditFieldLabel    matlab.ui.control.Label
        GoButton                        matlab.ui.control.StateButton
        BrowseButton                    matlab.ui.control.Button
        UIAxes                          matlab.ui.control.UIAxes
    end

    
    methods (Access = private)
        
        function fullSignal = buildSignal(app)
            global kV
            timeInit = 1;
            
            timeTotal = app.TotaltimeEditField.Value;
            sampRate = app.SamplerateEditField.Value;
            frequency = app.frequencyEditField.Value/2;
            maxVoltage = app.MaxvoltageEditField.Value/kV;
            %             forceConst = app.ConstantforceEditField.Value;
            totalSamples = (timeInit + timeTotal)*sampRate;
            dutyRatio = app.dutyratioEditField.Value;
            
            
            
            % Build voltage signal
            time = [-timeInit: 1/sampRate: timeTotal - 1/sampRate]';
            
            method = app.methodDropDown.Value;
            
            signalBase = sin(time*2*pi*frequency);
            signalBase(time <= 0) = 0;
            mask = sign(signalBase);
%             size(signalBase)
%             size(mask)
            
            switch method
                case 'sine'
                    voltageSignal = signalBase.^2*maxVoltage; % abs(signalBase.^3) is also fine if you want more smooth zero crossing
                    voltageSignal = voltageSignal.*mask;
                    
                case 'step'
                    voltageSignal = zeros(size(signalBase));
                    voltageSignal(signalBase >= 0) = maxVoltage;
                    voltageSignal(signalBase < 0) = -maxVoltage;
                    voltageSignal(time <= 0) = 0;
                    
                    
                    i = 0;
                    indDurationCycle = fix(sampRate/2/frequency);
                    while 1
                        indStart = fix(timeInit*sampRate) + i*indDurationCycle;
                        indEnd = fix(timeInit*sampRate) + (i+1)*indDurationCycle - 1;
                        
                        if indEnd <= totalSamples
                            voltageSignal(indStart: indStart + indDurationCycle*(1-dutyRatio/100) - 1) = 0;
                            i = i + 1;
                        elseif indStart <= length(voltageSignal)
                            voltageSignal(indStart: end) = 0;
                            break
                        else
                            break
                        end
                    end
                    
                case 'ramped square'
                    rampSpd = app.rampspeedEditField.Value;
                    
                    voltageSignal = zeros(size(signalBase));
                    i = 0;
                    indDurationCycle = fix(sampRate/2/frequency);
                    while 1
                        indStart = fix(timeInit*sampRate) + i*indDurationCycle;
                        indEnd = fix(timeInit*sampRate) + (i+1)*indDurationCycle - 1;
                        
                        if indEnd <= totalSamples
                            indDurationRamp = fix(maxVoltage/rampSpd*sampRate);
                            indDurationKeepOn = fix(indDurationCycle*dutyRatio/100);
                            
                            indRampUpStart = indStart;
                            indKeepOnStart = indRampUpStart + indDurationRamp;
                            indRampDownStart = indKeepOnStart + indDurationKeepOn;
                            indRampDownEnd = indRampDownStart + indDurationRamp - 1;
                            
                            if indRampDownEnd > indEnd
                                error('Error: 1 cycle is longer than the cycle frequency. DecreaSE the cycle frequency or increase ramp speed.')
                            end
                            
                            voltageSignal(indRampUpStart: indKeepOnStart - 1) = linspace(0, maxVoltage, indDurationRamp);
                            voltageSignal(indKeepOnStart: indRampDownStart - 1) = maxVoltage;
                            voltageSignal(indRampDownStart: indRampDownEnd) = linspace(maxVoltage, 0, indDurationRamp);
                            
                            i = i + 1;
                        elseif indStart <= length(voltageSignal)
                            voltageSignal(indStart: end) = 0;
                            break
                        else
                            break
                        end
                    end
                    voltageSignal = voltageSignal.*mask;
                    
            end
            
            if app.ReversepolarityCheckBox.Value == 0
                voltageSignal = abs(voltageSignal);
            end
            
            % Build reference signal for TF estimation
            % actuator contract two times in a voltage sine wave
            refSignal = abs(voltageSignal);
            
            syncSignal = zeros(totalSamples, 1);
            syncSignal(fix((timeInit - 0.5)*sampRate): fix((timeInit -0.4)*sampRate)) = 5;
            
            
            %             dumpSignal = zeros(totalSamples, 1);
            fullSignal = [voltageSignal, syncSignal, time, refSignal];
        end
        
        function buildPreview(app)
            global kV
            sampRate = app.SamplerateEditField.Value;
            maxVoltage = app.MaxvoltageEditField.Value;
            
            fullSignal = buildSignal(app);
            time = linspace(0, length(fullSignal)/sampRate, length(fullSignal));
            
            cla(app.UIAxes, "reset")

            yyaxis(app.UIAxes, 'left');
            plot(app.UIAxes, fullSignal(:, 3), fullSignal(:, 1)*kV);
            ylim(app.UIAxes, [(-1.5)*maxVoltage, 1.5*maxVoltage])
            ylabel(app.UIAxes, 'Voltage (kV)');

            yyaxis(app.UIAxes, 'right');
            plot(app.UIAxes, fullSignal(:, 3), fullSignal(:, 2));
            ylabel(app.UIAxes, 'Sync');
            
            grid(app.UIAxes, 'on')
            
            
            
        end
        
        function storeData(app, ~, ~)
            % This function is called every n = scansAvailableFcnCount data
            % points read by the DAQ
            global d voltageArr1 currentArr1 voltageArr2 currentArr2 triggerArr scanCount lastDataIndex
            
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
            
            trigger = scanData(:, 5);
            triggerArr(startIndex: endIndex) = trigger;
            % channel 5 is trigger input from DAQ output 2 (in volts)
            
            
            % Plot data every cycle
            x = linspace(cast(startIndex, 'double'), cast(endIndex, 'double'), length(force));
            yyaxis(app.UIAxes, 'left');
            plot(app.UIAxes, x, voltage1, '-');
            ylabel(app.UIAxes, 'volgatage [V]')
            yyaxis(app.UIAxes, 'right');
            plot(app.UIAxes, x, current1, '-');
            ylabel(app.UIAxes, 'current [?]')
            
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
            DevName = "Dev1";
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
            % voltage output to TREks
            
            addoutput(d, DevName, "ao1", "Voltage");
            % sync output to Arduino
            
            addinput(d, DevName, "ai0", "Voltage");
            % TREK 1 voltage monitor
            
            addinput(d, DevName, "ai1", "Voltage");
            % TREK 1 current monitor
            
            addinput(d, DevName, "ai2", "Voltage");
            % TREK 2 voltage monitor
            
            addinput(d, DevName, "ai3", "Voltage");
            % TREK 2 current monitor
            
            addinput(d, DevName, "ai6", "Voltage");
            % Triger signal to Arduino
            
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
            global d voltageArr1 voltageArr2 currentArr1 currentArr2 triggerArr scanCount lastDataIndex kV kF kL
            
            
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
                
                app.UIAxes.YAxis(2).Visible = 'on';
                xlabel(app.UIAxes, 'Sample Number');
                yyaxis(app.UIAxes, 'right');
                %                 xlim(app.UIAxes, 'auto')
                %                 ylim(app.UIAxes, 'auto');
                ylabel(app.UIAxes, 'Force (N)');
                yyaxis(app.UIAxes, 'left');
                %                 ylim(app.UIAxes, 'auto')
                ylabel(app.UIAxes, 'Displacement (mm)');
                
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
                triggerArr = zeros(length(fullSignal), 1);
                
                scanCount = 0;
                preload(d, fullSignal(:, 1:2));
                
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
                plot(app.UIAxes, fullSignal(:, 3), fullSignal(:, 1));
                ylabel(app.UIAxes, 'voltage [kV]');
                yyaxis(app.UIAxes, 'right');
                plot(app.UIAxes, fullSignal(:, 3), fullSignal(:, 2));
                ylabel(app.UIAxes, 'current [?]');
                ylabel(app.UIAxes, 'time [s]')
                
                % Bode plot processing
                %                 processedCurve = generateBode(app, fullSignal(:, 4));
                %                 plotBode(app, processedCurve);
                
                % file saves
                if app.SaverawfileCheckBox.Value
                    textPara = [...
                        app.methodDropDown.Value(1), '_',...
                        num2str(app.MaxvoltageEditField.Value*10,   '%02.0f'), 'kV_',...
                        num2str(app.frequencyEditField.Value*10, '%03.0f'), 'Hz_',...
                        num2str(app.SamplerateEditField.Value,   '%04.0f'), 'Hz_',...
                        num2str(app.dutyratioEditField.Value,    '%03.0f'), 'duty_',...
                        num2str(app.rampspeedEditField.Value,    '%03.0f'), 'kVs'];
                    rawFilename = fullfile(app.SelectfilepathEditField.Value,...
                        [app.RawfileprefixEditField.Value, app.ProcessedfilenameEditField.Value, '_', textPara, datestr(now,'_yyyy_mm_dd_HHMM'), '.dat']);
                    
                    writetable(table(...
                        fullSignal(:, 3),...
                        fullSignal(:, 1),...
                        voltageArr1(1:lastDataIndex)*kV,...
                        currentArr1(1:lastDataIndex)*kV,...
                        voltageArr2(1:lastDataIndex)*kV,...
                        currentArr2(1:lastDataIndex)*kV,...
                        fullSignal(:, 2),...
                        triggerArr(1: lastDataIndex),...
                        'VariableNames', {...
                        'Time [s]',...
                        'Voltage ref [kV]',...
                        'Voltage act 1 [kV]',...
                        'Current 1 [A]',...
                        'Voltage act 2 [kV]',...
                        'Current 2 [A]',...
                        'Trigger out [V]',...
                        'Trigger in [V]'...
                        }), rawFilename);
                end
                %                 processedFilename = fullfile(app.SelectfilepathEditField.Value, [app.ProcessedfilenameEditField.Value ,'_sineSweep_', textPara]);
                %                 writetable(table(processedCurve(:, 1), processedCurve(:, 2), processedCurve(:, 3), 'VariableNames',...
                %                     {'Frequency [Hz]', 'Amplitude [dB]', 'Phase [deg]'}), processedFilename);
                % Fush the DAQ and ensure zero voltage
                flush(d);
                write(d, [0, 0]);
                

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

        % Value changed function: methodDropDown
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

        % Value changed function: dutyratioEditField
        function dutyratioEditFieldValueChanged(app, event)
            buildPreview(app);
        end

        % Callback function
        function rampSpeedValueChanged(app, event)
            buildPreview(app);
            
        end

        % Value changed function: rampspeedEditField
        function rampspeedEditFieldValueChanged(app, event)
            buildPreview(app);
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 813 498];
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
            app.UIAxes.Position = [82 217 404 278];

            % Create BrowseButton
            app.BrowseButton = uibutton(app.UIFigure, 'push');
            app.BrowseButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseButtonPushed, true);
            app.BrowseButton.Position = [699 458 100 22];
            app.BrowseButton.Text = 'Browse';

            % Create GoButton
            app.GoButton = uibutton(app.UIFigure, 'state');
            app.GoButton.ValueChangedFcn = createCallbackFcn(app, @GoButtonValueChanged, true);
            app.GoButton.Text = 'Go';
            app.GoButton.BackgroundColor = [0.9608 0.9608 0.9608];
            app.GoButton.FontSize = 24;
            app.GoButton.FontWeight = 'bold';
            app.GoButton.Position = [641 262 146 53];

            % Create SelectfilepathEditFieldLabel
            app.SelectfilepathEditFieldLabel = uilabel(app.UIFigure);
            app.SelectfilepathEditFieldLabel.HorizontalAlignment = 'right';
            app.SelectfilepathEditFieldLabel.Position = [584 458 101 22];
            app.SelectfilepathEditFieldLabel.Text = 'Select file path:';

            % Create SelectfilepathEditField
            app.SelectfilepathEditField = uieditfield(app.UIFigure, 'text');
            app.SelectfilepathEditField.Position = [533 428 268 22];
            app.SelectfilepathEditField.Value = '\\space\fukushima\RM\prj_legETH\experiments\20220718_legExperiment';

            % Create RawfileprefixEditFieldLabel
            app.RawfileprefixEditFieldLabel = uilabel(app.UIFigure);
            app.RawfileprefixEditFieldLabel.HorizontalAlignment = 'right';
            app.RawfileprefixEditFieldLabel.Enable = 'off';
            app.RawfileprefixEditFieldLabel.Position = [533 359 81 22];
            app.RawfileprefixEditFieldLabel.Text = 'Raw file prefix';

            % Create RawfileprefixEditField
            app.RawfileprefixEditField = uieditfield(app.UIFigure, 'text');
            app.RawfileprefixEditField.Enable = 'off';
            app.RawfileprefixEditField.Position = [626 359 173 22];
            app.RawfileprefixEditField.Value = 'raw_';

            % Create ProcessedfilenameLabel
            app.ProcessedfilenameLabel = uilabel(app.UIFigure);
            app.ProcessedfilenameLabel.HorizontalAlignment = 'right';
            app.ProcessedfilenameLabel.Position = [502 394 114 22];
            app.ProcessedfilenameLabel.Text = 'Processed filename:';

            % Create ProcessedfilenameEditField
            app.ProcessedfilenameEditField = uieditfield(app.UIFigure, 'text');
            app.ProcessedfilenameEditField.Position = [628 394 173 22];
            app.ProcessedfilenameEditField.Value = 'test';

            % Create SaverawfileCheckBox
            app.SaverawfileCheckBox = uicheckbox(app.UIFigure);
            app.SaverawfileCheckBox.ValueChangedFcn = createCallbackFcn(app, @SaverawfileCheckBoxValueChanged, true);
            app.SaverawfileCheckBox.Text = 'Save raw file';
            app.SaverawfileCheckBox.Position = [707 328 90 22];
            app.SaverawfileCheckBox.Value = true;

            % Create SetupPanel
            app.SetupPanel = uipanel(app.UIFigure);
            app.SetupPanel.TitlePosition = 'centertop';
            app.SetupPanel.Title = 'Setup';
            app.SetupPanel.FontWeight = 'bold';
            app.SetupPanel.FontSize = 14;
            app.SetupPanel.Position = [24 25 187 186];

            % Create ao0ao1ai0ai1ai2Label
            app.ao0ao1ai0ai1ai2Label = uilabel(app.SetupPanel);
            app.ao0ao1ai0ai1ai2Label.Position = [4 -2 180 168];
            app.ao0ao1ai0ai1ai2Label.Text = {'AO0: TREK "voltage in"'; 'AO1: Arduino, sync signal 5V'; 'AI0: TREK 1 "voltage monitor"'; 'AI1: TREK 1 "current monitor"'; 'AI2: TREK 2 "voltage monitor"'; 'AI3: TREK 2 "current monitor"'; 'AI6: sync signal from AO1'};

            % Create VoltageParametersPanel
            app.VoltageParametersPanel = uipanel(app.UIFigure);
            app.VoltageParametersPanel.TitlePosition = 'centertop';
            app.VoltageParametersPanel.Title = 'Voltage Parameters';
            app.VoltageParametersPanel.FontWeight = 'bold';
            app.VoltageParametersPanel.FontSize = 14;
            app.VoltageParametersPanel.Position = [414 25 382 186];

            % Create MaxvoltageEditFieldLabel
            app.MaxvoltageEditFieldLabel = uilabel(app.VoltageParametersPanel);
            app.MaxvoltageEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxvoltageEditFieldLabel.Position = [193 134 70 22];
            app.MaxvoltageEditFieldLabel.Text = 'Max voltage';

            % Create MaxvoltageEditField
            app.MaxvoltageEditField = uieditfield(app.VoltageParametersPanel, 'numeric');
            app.MaxvoltageEditField.Limits = [0 20];
            app.MaxvoltageEditField.ValueChangedFcn = createCallbackFcn(app, @MaxvoltageEditFieldValueChanged, true);
            app.MaxvoltageEditField.Position = [273 134 31 22];
            app.MaxvoltageEditField.Value = 5;

            % Create kVLabel
            app.kVLabel = uilabel(app.VoltageParametersPanel);
            app.kVLabel.Position = [307 134 25 22];
            app.kVLabel.Text = 'kV';

            % Create methodDropDownLabel
            app.methodDropDownLabel = uilabel(app.VoltageParametersPanel);
            app.methodDropDownLabel.HorizontalAlignment = 'right';
            app.methodDropDownLabel.Position = [193 98 45 28];
            app.methodDropDownLabel.Text = 'method';

            % Create methodDropDown
            app.methodDropDown = uidropdown(app.VoltageParametersPanel);
            app.methodDropDown.Items = {'step', 'sine', 'ramped square'};
            app.methodDropDown.ValueChangedFcn = createCallbackFcn(app, @methodDropDownValueChanged, true);
            app.methodDropDown.Position = [245 101 124 22];
            app.methodDropDown.Value = 'ramped square';

            % Create sLabel
            app.sLabel = uilabel(app.VoltageParametersPanel);
            app.sLabel.Position = [138 134 25 22];
            app.sLabel.Text = 's';

            % Create TotaltimeEditFieldLabel
            app.TotaltimeEditFieldLabel = uilabel(app.VoltageParametersPanel);
            app.TotaltimeEditFieldLabel.HorizontalAlignment = 'right';
            app.TotaltimeEditFieldLabel.Position = [20 132 75 22];
            app.TotaltimeEditFieldLabel.Text = 'Total time';

            % Create TotaltimeEditField
            app.TotaltimeEditField = uieditfield(app.VoltageParametersPanel, 'numeric');
            app.TotaltimeEditField.Limits = [0 Inf];
            app.TotaltimeEditField.ValueChangedFcn = createCallbackFcn(app, @TotaltimeEditFieldValueChanged, true);
            app.TotaltimeEditField.Position = [103 132 33 22];
            app.TotaltimeEditField.Value = 24;

            % Create frequencyEditFieldLabel
            app.frequencyEditFieldLabel = uilabel(app.VoltageParametersPanel);
            app.frequencyEditFieldLabel.HorizontalAlignment = 'right';
            app.frequencyEditFieldLabel.Position = [-19 101 114 22];
            app.frequencyEditFieldLabel.Text = 'frequency';

            % Create frequencyEditField
            app.frequencyEditField = uieditfield(app.VoltageParametersPanel, 'numeric');
            app.frequencyEditField.Limits = [0 Inf];
            app.frequencyEditField.ValueChangedFcn = createCallbackFcn(app, @frequencyEditFieldValueChanged, true);
            app.frequencyEditField.Position = [103 101 33 22];
            app.frequencyEditField.Value = 0.25;

            % Create HzLabel_5
            app.HzLabel_5 = uilabel(app.VoltageParametersPanel);
            app.HzLabel_5.Position = [138 101 25 22];
            app.HzLabel_5.Text = 'Hz';

            % Create ReversepolarityCheckBox
            app.ReversepolarityCheckBox = uicheckbox(app.VoltageParametersPanel);
            app.ReversepolarityCheckBox.ValueChangedFcn = createCallbackFcn(app, @ReversepolarityCheckBoxValueChanged, true);
            app.ReversepolarityCheckBox.Text = 'Reverse polarity';
            app.ReversepolarityCheckBox.Position = [244 71 109 22];
            app.ReversepolarityCheckBox.Value = true;

            % Create dutyratioEditFieldLabel
            app.dutyratioEditFieldLabel = uilabel(app.VoltageParametersPanel);
            app.dutyratioEditFieldLabel.HorizontalAlignment = 'right';
            app.dutyratioEditFieldLabel.Position = [20 13 75 22];
            app.dutyratioEditFieldLabel.Text = 'duty ratio';

            % Create dutyratioEditField
            app.dutyratioEditField = uieditfield(app.VoltageParametersPanel, 'numeric');
            app.dutyratioEditField.Limits = [0 Inf];
            app.dutyratioEditField.ValueChangedFcn = createCallbackFcn(app, @dutyratioEditFieldValueChanged, true);
            app.dutyratioEditField.Position = [103 13 33 22];
            app.dutyratioEditField.Value = 50;

            % Create rampspeedEditFieldLabel
            app.rampspeedEditFieldLabel = uilabel(app.VoltageParametersPanel);
            app.rampspeedEditFieldLabel.HorizontalAlignment = 'right';
            app.rampspeedEditFieldLabel.Position = [194 13 75 22];
            app.rampspeedEditFieldLabel.Text = 'ramp speed';

            % Create rampspeedEditField
            app.rampspeedEditField = uieditfield(app.VoltageParametersPanel, 'numeric');
            app.rampspeedEditField.Limits = [0 Inf];
            app.rampspeedEditField.ValueChangedFcn = createCallbackFcn(app, @rampspeedEditFieldValueChanged, true);
            app.rampspeedEditField.Position = [276 13 33 22];
            app.rampspeedEditField.Value = 5;

            % Create Label
            app.Label = uilabel(app.VoltageParametersPanel);
            app.Label.Position = [138 13 25 22];
            app.Label.Text = '%';

            % Create kVsLabel
            app.kVsLabel = uilabel(app.VoltageParametersPanel);
            app.kVsLabel.Position = [310 13 29 22];
            app.kVsLabel.Text = 'kV/s';

            % Create forstepinputLabel
            app.forstepinputLabel = uilabel(app.VoltageParametersPanel);
            app.forstepinputLabel.FontWeight = 'bold';
            app.forstepinputLabel.Position = [50 34 82 22];
            app.forstepinputLabel.Text = 'for step input';

            % Create forrampedsquareinputLabel
            app.forrampedsquareinputLabel = uilabel(app.VoltageParametersPanel);
            app.forrampedsquareinputLabel.FontWeight = 'bold';
            app.forrampedsquareinputLabel.Position = [204 34 144 22];
            app.forrampedsquareinputLabel.Text = 'for ramped square input';

            % Create CalibrationPanel
            app.CalibrationPanel = uipanel(app.UIFigure);
            app.CalibrationPanel.TitlePosition = 'centertop';
            app.CalibrationPanel.Title = 'Calibration';
            app.CalibrationPanel.FontWeight = 'bold';
            app.CalibrationPanel.FontSize = 14;
            app.CalibrationPanel.Position = [218 25 187 186];

            % Create SamplerateEditFieldLabel
            app.SamplerateEditFieldLabel = uilabel(app.CalibrationPanel);
            app.SamplerateEditFieldLabel.HorizontalAlignment = 'right';
            app.SamplerateEditFieldLabel.Position = [9 134 75 22];
            app.SamplerateEditFieldLabel.Text = 'Sample rate';

            % Create SamplerateEditField
            app.SamplerateEditField = uieditfield(app.CalibrationPanel, 'numeric');
            app.SamplerateEditField.Limits = [0 Inf];
            app.SamplerateEditField.ValueChangedFcn = createCallbackFcn(app, @SamplerateEditFieldValueChanged, true);
            app.SamplerateEditField.Position = [98 134 45 22];
            app.SamplerateEditField.Value = 1000;

            % Create HzLabel
            app.HzLabel = uilabel(app.CalibrationPanel);
            app.HzLabel.Position = [147 134 25 22];
            app.HzLabel.Text = 'Hz';

            % Create TREKvoltageconstantkVEditFieldLabel
            app.TREKvoltageconstantkVEditFieldLabel = uilabel(app.CalibrationPanel);
            app.TREKvoltageconstantkVEditFieldLabel.HorizontalAlignment = 'center';
            app.TREKvoltageconstantkVEditFieldLabel.Enable = 'off';
            app.TREKvoltageconstantkVEditFieldLabel.Position = [9 94 79 27];
            app.TREKvoltageconstantkVEditFieldLabel.Text = {'TREK voltage'; 'constant (kV)'};

            % Create TREKvoltageconstantkVEditField
            app.TREKvoltageconstantkVEditField = uieditfield(app.CalibrationPanel, 'numeric');
            app.TREKvoltageconstantkVEditField.Limits = [0 Inf];
            app.TREKvoltageconstantkVEditField.ValueChangedFcn = createCallbackFcn(app, @TREKvoltageconstantkVEditFieldValueChanged, true);
            app.TREKvoltageconstantkVEditField.Editable = 'off';
            app.TREKvoltageconstantkVEditField.Enable = 'off';
            app.TREKvoltageconstantkVEditField.Position = [99 96 44 22];
            app.TREKvoltageconstantkVEditField.Value = 1;

            % Create VkVLabel
            app.VkVLabel = uilabel(app.CalibrationPanel);
            app.VkVLabel.Position = [147 96 31 22];
            app.VkVLabel.Text = 'V/kV';

            % Create MTforceconstantkFEditFieldLabel
            app.MTforceconstantkFEditFieldLabel = uilabel(app.CalibrationPanel);
            app.MTforceconstantkFEditFieldLabel.HorizontalAlignment = 'center';
            app.MTforceconstantkFEditFieldLabel.Enable = 'off';
            app.MTforceconstantkFEditFieldLabel.Position = [11 50 75 27];
            app.MTforceconstantkFEditFieldLabel.Text = {'MT force'; 'constant (kF)'};

            % Create MTforceconstantkFEditField
            app.MTforceconstantkFEditField = uieditfield(app.CalibrationPanel, 'numeric');
            app.MTforceconstantkFEditField.Limits = [0 Inf];
            app.MTforceconstantkFEditField.ValueChangedFcn = createCallbackFcn(app, @MTforceconstantkFEditFieldValueChanged, true);
            app.MTforceconstantkFEditField.Editable = 'off';
            app.MTforceconstantkFEditField.Enable = 'off';
            app.MTforceconstantkFEditField.Position = [99 55 44 22];
            app.MTforceconstantkFEditField.Value = 9.96;

            % Create MTlengthconstantkLEditFieldLabel
            app.MTlengthconstantkLEditFieldLabel = uilabel(app.CalibrationPanel);
            app.MTlengthconstantkLEditFieldLabel.HorizontalAlignment = 'center';
            app.MTlengthconstantkLEditFieldLabel.Enable = 'off';
            app.MTlengthconstantkLEditFieldLabel.Position = [9 11 75 27];
            app.MTlengthconstantkLEditFieldLabel.Text = {'MT length'; 'constant (kL)'};

            % Create MTlengthconstantkLEditField
            app.MTlengthconstantkLEditField = uieditfield(app.CalibrationPanel, 'numeric');
            app.MTlengthconstantkLEditField.Limits = [0 Inf];
            app.MTlengthconstantkLEditField.ValueChangedFcn = createCallbackFcn(app, @MTlengthconstantkLEditFieldValueChanged, true);
            app.MTlengthconstantkLEditField.Editable = 'off';
            app.MTlengthconstantkLEditField.Enable = 'off';
            app.MTlengthconstantkLEditField.Position = [99 13 45 22];
            app.MTlengthconstantkLEditField.Value = 1.989;

            % Create NVLabel
            app.NVLabel = uilabel(app.CalibrationPanel);
            app.NVLabel.Position = [147 55 26 22];
            app.NVLabel.Text = 'N/V';

            % Create mmVLabel
            app.mmVLabel = uilabel(app.CalibrationPanel);
            app.mmVLabel.Position = [147 12 37 22];
            app.mmVLabel.Text = 'mm/V';

            % Create PressStopwhentestiscompletedtosavedataLabel
            app.PressStopwhentestiscompletedtosavedataLabel = uilabel(app.UIFigure);
            app.PressStopwhentestiscompletedtosavedataLabel.HorizontalAlignment = 'right';
            app.PressStopwhentestiscompletedtosavedataLabel.FontSize = 14;
            app.PressStopwhentestiscompletedtosavedataLabel.FontWeight = 'bold';
            app.PressStopwhentestiscompletedtosavedataLabel.Position = [464 265 137 50];
            app.PressStopwhentestiscompletedtosavedataLabel.Text = {'Press ''Stop'' when'; 'test is completed to'; 'save data'};

            % Create MonitorlimittripstatusCheckBox
            app.MonitorlimittripstatusCheckBox = uicheckbox(app.UIFigure);
            app.MonitorlimittripstatusCheckBox.ValueChangedFcn = createCallbackFcn(app, @MonitorlimittripstatusCheckBoxValueChanged, true);
            app.MonitorlimittripstatusCheckBox.Enable = 'off';
            app.MonitorlimittripstatusCheckBox.Text = 'Monitor limit/trip status';
            app.MonitorlimittripstatusCheckBox.Position = [645 229 142 22];

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Position = [618 229 20 20];

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