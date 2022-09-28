% Katie Steinmann
% University of Wyoming
% Ethane Calibration
% Created on September 26, 2022 by Katie Steinmann
% Edits
% September 28, 2022 - Identified calibration data

%% Read in the text file
M = importdata('220920_092452.txt', ' ', 1); 

%% Reading in data
T = M.data(:, 1); % Time [mountain]
Ethane = M.data(:, 2); % Ethane [ppb]

Time = datetime(T/86400, 'convertfrom', 'excel1904'); % Converting time to date time

%% Figure 1 - Ethane versus time
figure
scatter(Time, Ethane, 'filled');
set(gca, 'FontSize', 20) % Setting the font size of the numbers
xlabel('Time', 'FontSize', 20) % Naming the x-axis
ylabel('Ethane Concentration (ppb)', 'FontSize', 20) % Naming the y-axis
title('09 20 2022 Ethane Calibration', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Finding the calibration data
% Start and end times based on excel spread sheet
% Subtract 1 minute from each end

Zero1_start = 7530; % 11:35:00
Zero1_end = 7992; % 11:43:00

% ********** The weird readings, may need to remove
start_50 = 8576; % 11:53:00
end_50 = 9389; % 12:07:00

start_98 = 9624; % 12:11:00
end_98 = 10088; % 12:19:00

start_104 = 10208; % 12:21:00
end_104 = 10672; % 12:29:00

start_198 = 10787; % 12:31:00
end_198 = 11256; % 12:39:00

start_297 = 11545; % 12:44:00
end_297 = 12009; % 12:52:00

start_395 = 12129; % 12:54:00 
end_395 = 12592; % 13:02:00

Zero2_start = 18930; % 14:51:00
Zero2_end = 19104; % 14:54:00

Standard1_start = 23228; % 16:05:00
Standard1_end = 23692; % 16:13:00

Standard2_start = 24040; % 16:19:00
Standard2_end = 24509; % 16:27:00
