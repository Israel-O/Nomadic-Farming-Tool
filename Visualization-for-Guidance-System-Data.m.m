%% Data Gathered
%Position 1
humidity_1 = Humidity_1(1:2324);
lightIntensity_1 = LightIntensity_1(1:2324);
temperature_1 = Temperature_1(1:2324);
%Position 2
humidity_2 = Humidity_2(1:2385);
lightIntensity_2 = LightIntensity_2(1:2385);
temperature_2 = Temperature_2(1:2385);
%Position 3
humidity_3 = Humidity_3(1:2385);
lightIntensity_3 = LightIntensity_3(1:2385);
temperature_3 = Temperature_3(1:2385);
%% First location (Backyard)
figure(1)
tiledlayout(2,2)
time = (0:2384)';

nexttile
hold on
xlabel('Time (min)')
ylabel('Value')
title('Environment Variables for Location 1')
plot(time(1:2324), humidity_1)
plot(time(1:2324), lightIntensity_1)
plot(time(1:2324), temperature_1)
legend('Relative Humidity (%)', 'Light Intensity', 'Temperature (°C)', 'location', 'bestoutside')
xticks(0:300:2385)
xticklabels(0:5:39.75)
xlim([0 2360])
ylim([0 100])
grid on
hold off
%% Second location (front door)
nexttile
hold on
title('Environment Variables for Location 2')
xlabel('Time (min)')
ylabel('Value')
plot(time, humidity_2)
plot(time, lightIntensity_2)
plot(time, temperature_2)
legend('Relative Humidity(%)', 'Light Intensity', 'Temperature (°C)', 'location', 'bestoutside')
xticks(0:300:2385)
xticklabels(0:5:39.75)
xlim([0 2360])
ylim([0 100])
grid on
hold off
%% Third location (front door)
nexttile
hold on
title('Environment Variables for Location 3')
xlabel('Time (min)')
ylabel('Value')
plot(time, humidity_3)
plot(time, lightIntensity_3)
plot(time, temperature_3)
legend('Relative Humidity (%)', 'Light Intensity', 'Temperature (°C)', 'location', 'bestoutside')
xticks(0:300:2385)
xticklabels(0:5:39.75)
xlim([0 2360])
ylim([0 100])
grid on
hold off
%% Comparison
figure(2)
tiledlayout(2,2)
nexttile
%Humidity plots
hold on
plot(time(1:2324), humidity_1)
plot(time, humidity_2)
plot(time, humidity_3)
yline(55,'b--')
xlabel('Time (min)')
ylabel('Value')
title('Humidity Comparison')
legend('Location 1', 'Location 2', 'Location 3','Ideal Humidity', 'location', 'bestoutside')
xticks(0:300:2385)
xticklabels(0:5:39.75)
xlim([0 2360])
ylim([0 100])
grid on
hold off
%Light Intensity Plots
nexttile
hold on
plot(time(1:2324), lightIntensity_1)
plot(time, lightIntensity_2)
plot(time, lightIntensity_3)
yline(80, 'y--')
xlabel('Time (min)')
ylabel('Value')
title('Light Intensity Comparison')
legend('Location 1', 'Location 2', 'Location 3', 'Ideal Light Intensity', 'location', 'bestoutside')
xticks(0:300:2385)
xticklabels(0:5:39.75)
xlim([0 2360])
ylim([0 100])
grid on
hold off
%Temperature Plots
nexttile
hold on
plot(time(1:2324), temperature_1)
plot(time, temperature_2)
plot(time, temperature_3)
yline(21.5,'r--')
xlabel('Time (min)')
ylabel('Value')
title('Temperature Comparison')
legend('Location 1', 'Location 2', 'Location 3', 'Ideal Temperature', 'location', 'bestoutside')
xticks(0:300:2385)
xticklabels(0:5:39.75)
xlim([0 2360])
ylim([0 100])
grid on
hold off

%%Best Place
perfectHum = 50;
perfectLight = 80;
perfectTemp = mean([16 27]);
%Position 1
avgHum_1 = mean(humidity_1, 'omitnan');
avgLight_1 = mean(lightIntensity_1, 'omitnan')
avgTemp_1 = mean(temperature_1, 'omitnan');
errHum_1 = abs(perfectHum - avgHum_1);
errLight_1 = abs(perfectLight - avgLight_1);
errTemp_1 = abs(perfectTemp - avgTemp_1);
errSum_1 = errHum_1 + errLight_1 + errTemp_1
%Position 2
avgHum_2 = mean(humidity_2, 'omitnan');
avgLight_2 = mean(lightIntensity_2, 'omitnan');
avgTemp_2 = mean(temperature_2, 'omitnan');
errHum_2 = abs(perfectHum - avgHum_2);
errLight_2 = abs(perfectLight - avgLight_2);
errTemp_2 = abs(perfectTemp - avgTemp_2);
errSum_2 = errHum_2 + errLight_2 + errTemp_2
%Position 3
avgHum_3 = mean(humidity_3, 'omitnan');
avgLight_3 = mean(lightIntensity_3, 'omitnan');
avgTemp_3 = mean(temperature_3, 'omitnan');
errHum_3 = abs(perfectHum - avgHum_3);
errLight_3 = abs(perfectLight - avgLight_3);
errTemp_3 = abs(perfectTemp - avgTemp_3);
errSum_3 = errHum_3 + errLight_3 + errTemp_3

lowest = min([errSum_1 errSum_2 errSum_3]);
loc1Color = 'r';
loc2Color = 'r';
loc3Color = 'r';
if lowest == errSum_1
    disp('Position 1 is the best place')
    loc1Color = 'g'
elseif lowest == errSum_2
    disp('Position 2 is the best place')
    loc1Color = 'g'
elseif lowest == errSum_3
     disp('Position 3 is the best place')
     loc1Color = 'g'
end

%% Plot Locations
xpos1 = randi([-10 10])
xpos2 = randi([-10 10])
xpos3 = randi([-10 10])
ypos1 = randi([-10 10])
ypos2 = randi([-10 10])
ypos3 = randi([-10 10])
dp = [xpos1 ypos1] - [0 0] 
figure(3)
hold on
quiver(0,0, xpos1, ypos1, 'Autoscale', 'off')
title('Locations')
plot(xpos1,ypos1, 'ro', 'markerfacecolor', loc1Color, 'markersize', 7)
plot(xpos2,ypos2, 'ro', 'markerfacecolor', loc2Color, 'markersize', 7)
plot(xpos3,ypos3, 'ro', 'markerfacecolor', loc3Color, 'markersize', 7)
plot(0,0,'bo', 'markerfacecolor', 'b', 'markersize', 10)
%text(0.1,0.1,'Home')
%text(xpos1 + 0.1, ypos1 + 0.1, 'Best Location')
xlim([-10 10])
ylim([-10 10])
grid off


angle = 90 - atand(abs(ypos1/xpos1))
if xpos1 > 0 & ypos1 > 0
    disp('Direction: ')
    disp(angle)
    disp('degrees North-East')
elseif xpos1 < 0 & ypos1> 0
    disp('Direction: ')
    disp(angle)
    disp('degrees North-West')
elseif xpos1 < 0 & ypos1 < 0
    disp('Direction: ')
    disp(angle)
    disp('degrees South-West')
elseif xpos1 > 0 & ypos1 < 0
    disp('Direction: ')
    disp(angle)
    disp('degrees South-East')
elseif angle == 0 & ypos1 > 0
    disp('Direction: North')
elseif angle == 0 & ypos1 < 0
    disp('Direction: South')
end
hold off
