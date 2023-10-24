close all

FS = 8000;

Raw_GN = CS_2023_10_24_18_15_29_data.A0764E41E670;
Raw_GN(Raw_GN == 0) = nan;
Raw_HV = CS_2023_10_24_18_15_29_data.A0764E421D14;
Raw_HV(Raw_HV == 0) = nan;

Time_HV = [0: 1/FS: (length(Raw_HV)-1)*1/FS];
Time_GN = [0: 1/FS: (length(Raw_GN)-1)*1/FS];


Current_GN = toAmps(Raw_GN);
Current_HV = toAmps(Raw_HV);
Current_GN(isnan(Current_GN)) = 0;
Current_HV(isnan(Current_HV)) = 0;


Charge_GN = cumtrapz(Time_GN, Current_GN);
Charge_HV = cumtrapz(Time_HV, Current_HV);






figure(1)
subplot(2, 1, 1)

hold on
plot(Time_GN, Current_GN*1e6, DisplayName='GN')
plot(Time_HV, Current_HV*1e6, DisplayName='HV')
legend()
xlim([0 80])
ylim([-20 20])
grid on
box on

subplot(2, 1, 2)
hold on
plot(Time_GN, Charge_GN*1e6, DisplayName='GN')
plot(Time_HV, Charge_HV*1e6, DisplayName='HV')
legend()
xlim([0 80])
ylim([-20 20])
grid on
box on



function current = toAmps(raw)
Bias = 3/2;
conversionFactorADC = (3/(2^16-1));
conversionFactorIn = 1/(11*2e3);
current = ((raw*conversionFactorADC)-Bias)*conversionFactorIn;
end