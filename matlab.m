% Create a patchMicrostripCircular antenna
% Generated by MATLAB(R) 24.1 and Antenna Toolbox 24.1
%Generated on:24-Jul-2024 09:51:57

%% Antenna Properties

antennaObject = design(patchMicrostripCircular, 6000*1e6);
antennaObject.Load.Impedance = 10;
% Show
figure;
show(antennaObject)

%% Antenna Analysis
% Define plot frequency
plotFrequency = 6*1e9;
% Define frequency range
freqRange = (5400:60:6600)*1e6;
% Reference Impedance
refImpedance = 50;
% pattern
figure;
pattern(antennaObject, plotFrequency)% azimuth
figure;
patternAzimuth(antennaObject, plotFrequency, 0, 'Azimuth', 0:5:360)% elevation
figure;
patternElevation(antennaObject, plotFrequency,0,'Elevation',0:5:360)

% 计算方向图
[Ephi, Etheta] = pattern(antennaObject, plotFrequency);

% % 定义一个函数来计算特定角度的增益
% function gain = calculateGain(Ephi, Etheta, theta, phi)
%     % 将角度从度转换为弧度
%     theta_rad = deg2rad(theta);
%     phi_rad = deg2rad(phi);

%     % 找到最接近的角度索引
%     idx_theta = find(abs(Etheta - theta_rad) == min(abs(Etheta - theta_rad)), 1, 'first');
%     idx_phi = find(abs(Ephi - phi_rad) == min(abs(Ephi - phi_rad)), 1, 'first');

%     % 计算特定角度的增益
%     gain_value = Ephi(idx_phi, idx_theta);
%     gain = gain_value;
%     end

% % 假设我们想计算水平角度90度和垂直角度30度的增益
% horizontal_angle = 0; % 水平角度
% vertical_angle = 0; % 垂直角度

% % 调用函数计算增益
% gain_at_angle = calculateGain(Ephi, Etheta, vertical_angle, horizontal_angle);

% % 显示增益
% fprintf('增益在水平角度 %d 度和垂直角度 %d 度是 %f dBi\n', horizontal_angle, vertical_angle, gain_at_angle);