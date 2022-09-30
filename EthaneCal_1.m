% Katie Steinmann
% University of Wyoming
% Ethane Calibration
% Created on September 26, 2022 by Katie Steinmann
% Edits
% September 28, 2022 - Identified calibration data
% Spetember 29, 2022 - Set the true values; Calculated the mean for each
% set of calibrated data
% September 30, 2022 - Turned the true values and measured averages into
% arrays; Plotted the true values versus measured values; Calculated and plotted the
% best fit line; Calculated the R-square value; Plotted the correlation and
% best fit lines; Performed the same calculations but omitted the 50 ppm
% calibrations since the instrument did not level out for this calibration

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

Zero1_start = 7590; % 11:36:00
Zero1_end = 7992; % 11:43:00

% ********** The weird readings, may need to remove
start_50 = 8576; % 11:53:00
end_50 = 9389; % 12:07:00

start_100 = 9684; % 12:12:00
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

%% Figure 2 - Ethane versus time with calibration ranges highlighted
figure
scatter(Time, Ethane, 'filled');
set(gca, 'FontSize', 20) % Setting the font size of the numbers
hold on
scatter(Time(Zero1_start:Zero1_end), Ethane(Zero1_start:Zero1_end), 'r', 'filled') % Identidying the first set of zero data
scatter(Time(start_50:end_50), Ethane(start_50:end_50), 'g', 'filled') % Identifying the 50 ppm data
scatter(Time(start_100:end_100), Ethane(start_100:end_100), 'k', 'filled') % Identifying the 100 ppm data
scatter(Time(start_130:end_130), Ethane(start_130:end_130), 'm', 'filled') % Identifying the 130 ppm data
scatter(Time(start_200:end_200), Ethane(start_200:end_200), 'c', 'filled') % Identifying the 200 ppm data
scatter(Time(start_300:end_300), Ethane(start_300:end_300), 'MarkerEdgeColor', [0.6350 0.0780 0.1840], 'MarkerFaceColor', [0.6350 0.0780 0.1840]) % Identifying the 300 ppm data as maroon
scatter(Time(start_400:end_400), Ethane(start_400:end_400), 'MarkerEdgeColor', [0.8500 0.3250 0.1250], 'MarkerFaceColor', [0.8500 0.3250 0.1250]) % Identifying the 400 ppm data as orange
scatter(Time(Zero2_start:Zero2_end), Ethane(Zero2_start:Zero2_end), 'MarkerEdgeColor', [0.4940 0.1840 0.5560], 'MarkerFaceColor', [0.4940 0.1840 0.5560]) % Identifying the second set of zeros as purple
scatter(Time(Standard1_start:Standard1_end), Ethane(Standard1_start:Standard1_end), 'MarkerEdgeColor', [0.4660 0.6740 0.1880], 'MarkerFaceColor', [0.4660 0.6740 0.1880]) % Identifying the first set of standard values in forest green
scatter(Time(Standard2_start:Standard2_end), Ethane(Standard2_start:Standard2_end), 'y', 'filled') % Identifying the second set of standard values
hold off
xlabel('Time', 'FontSize', 20) % Naming the x-axis
ylabel('Ethane Concentration (ppb)', 'FontSize', 20) % Naming the y-axis
title('09 20 2022 Ethane Calibration Raw Data', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% True Values
True_zero = 0; % Actual value for zeros [ppm]
True_50 = 49.19397563; % Actual value for 50 [ppm]
True_100 = 98.29124452; % Actual value for 100 [ppm]
True_130 = 130.9691719; % Actual vaule for 130 [ppm]
True_200 = 198.1707317; % Actaul value for 200 [ppm]
True_300 = 296.668188; % Actual value for 300 [ppm]
True_400 = 394.776993; % Actual value for 400 [ppm]
True_standard = 2.09; % Actual value for the standard calibrations based on the NOAA standard ppm]
True = [True_zero, True_50, True_100, True_130, True_200, True_300, True_400, True_zero, True_standard, True_standard]; % Turing the true values into an array

%% Average Measured data

Avg_Zero1 = mean(Ethane(Zero1_start:Zero1_end)); % Average first set of zero data [ppm]
Avg_50 = mean(Ethane(start_50:end_50)); % Average concentration at 50 [ppm]
Avg_100 = mean(Ethane(start_100:end_100 )); % Average concentration at 100 [ppm]
Avg_130 = mean(Ethane(start_130:end_130)); % Average concentration at 130 [ppm]
Avg_200 = mean(Ethane(start_200:end_200)); % Average concentration at 200 [ppm]
Avg_300 = mean(Ethane(start_300:end_300)); % Average of concentration at 300 [ppm]
Avg_400 = mean(Ethane(start_400:end_400)); % Average concentration at 400 [ppm]
Avg_Zero2 = mean(Ethane(Zero2_start:Zero2_end)); % Average concentration at 0 [ppm]
Avg_standard1 = mean(Ethane(Standard1_start:Standard1_end)); % Average concentration for standards [ppm]
Avg_standard2 = mean(Ethane(Standard2_start:Standard2_end)); % Average concentration for standards [ppm]
Average = [Avg_Zero1, Avg_50, Avg_100, Avg_130, Avg_200, Avg_300, Avg_400, Avg_Zero2, Avg_standard1, Avg_standard2]; % Turing the average values into an array

%% Figure 3 of true values versus measured values

figure
scatter(True, Average, 60, 'filled')
set(gca, 'FontSize', 20) % Setting the font size of the numbers
xlim([-1 412])
ylim([-1 412])
xlabel('Therotical Value (ppb)', 'FontSize', 20) % Naming the x-axis
ylabel('Measured Value (ppb)', 'FontSize', 20) % Naming the y-axis
title('09 20 2022 Ethane Calibration Correlations', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Calculating the polynomial fit

[p,S] = polyfit(True, Average, 1); % Returns polynomial coefficients
fitted_X = linspace(min(True), max(True), 200); % Creating an array between True min and True max that is 200 points
fitted_Y = polyval(p, fitted_X); % Evaluates the polynomial p at every point in fitted_X

%% Figure 4 Plotting the two fitted lines

figure
plot(fitted_X, fitted_Y, 'r', 'LineWidth', 3)
set(gca, 'FontSize', 20) % Setting the font size of the numbers
xlim([-1 412])
ylim([-1 412])
xlabel('Therotical Value (ppb)', 'FontSize', 20) % Naming the x-axis
ylabel('Measured Value (ppb)', 'FontSize', 20) % Naming the y-axis
title('09 20 2022 Ethane Calibration Best Fit Line', 'FontSize', 30); % Providing a title
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Calculating the slope of the data

[y_fit, delta] = polyval(p, True, S); % Evaluating the polynomial p at every point in True and calculates errors
xl = xlim; % Turning xlim into an array
yl = ylim; % Turning ylim into an array
xt = 0.05 .* (xl(2) - xl(1)) + xl(1); % Calculates the x-direction position of a caption
yt = 0.90 .* (yl(2) - yl(1)) + yl(1); % Calculates the y-direction position of a caption
caption = sprintf('y = %f * x + %f', p(1), p(2)); % Creating a caption variable for the slope of the best fit line

%% Calculating the R-square value

yresid = Average - y_fit; % Difference between the measured average and the best fit line
SSresid = sum(yresid .^ 2); % Finding the sum of the squared difference between the measured average and the best fit line
SStotal = (length(Average) - 1) .* var(Average); % The number of observations minus the variation in the measured average
rsq2 = 1 - SSresid ./ SStotal; % R^2 calculation - 1 - (unexplained variation / total variation)
yt2 = 0.8 .* (yl(2) - yl(1)) + yl(1); % Calculating the y-direction position for the calculation
caption2 = sprintf('R^2 = %f', rsq2); % Creating a caption variable for the R-square value

%% Figure 5 Adding fitted lines and calculations to plot
figure
scatter(True, Average, 60, 'filled')
hold on
plot(fitted_X, fitted_Y, 'r', 'LineWidth', 3)
text(xt, yt, caption, 'FontSize', 20, 'Color', 'r', 'FontWeight', 'bold')
text(xt, yt2, caption2, 'FontSize', 20, 'Color', 'r', 'FontWeight', 'bold')
hold off
set(gca, 'FontSize', 20) % Setting the font size of the numbers
xlim([-1 412])
ylim([-1 412])
xlabel('Therotical Value (ppb)', 'FontSize', 20) % Naming the x-axis
ylabel('Measured Value (ppb)', 'FontSize', 20) % Naming the y-axis
title('09 20 2022 Ethane Calibration Correlation and Fit', 'FontSize', 30); % Providing a title
legend('Data', 'Linear Fit', 'Location', 'southeast', 'FontSize', 20) % Creating a legend
grid on % Turning on major grid
grid minor  % Turning on minor grid

%% Re-Calculate without the 50 ppm readings

% Calculating averages
True_minus_50 = [True_zero, True_100, True_130, True_200, True_300, True_400, True_zero, True_standard, True_standard]; % Turing the true values into an array
Average_minus_50 = [Avg_Zero1, Avg_100, Avg_130, Avg_200, Avg_300, Avg_400, Avg_Zero2, Avg_standard1, Avg_standard2]; % Turing the average values into an array

%Calculating the polynomial fit
[p2,S2] = polyfit(True_minus_50, Average_minus_50, 1); % Returns polynomial coefficients
fitted_X2 = linspace(min(True_minus_50), max(True_minus_50), 200); % Creating an array between True min and True max that is 200 points
fitted_Y2 = polyval(p2, fitted_X2); % Evaluates the polynomial p at every point in fitted_X

% Calculating the slope of the data
[y_fit2, delta2] = polyval(p2, True_minus_50, S2); % Evaluating the polynomial p at every point in True and calculates errors
xl2 = xlim; % Turning xlim into an array
yl2 = ylim; % Turning ylim into an array
xt2 = 0.05 .* (xl2(2) - xl2(1)) + xl2(1); % Calculates the x-direction position of a caption
yt3 = 0.90 .* (yl2(2) - yl2(1)) + yl2(1); % Calculates the y-direction position of a caption
caption3 = sprintf('y = %f * x + %f', p2(1), p2(2)); % Creating a caption variable for the slope of the best fit line

% Calculating the R-square value
yresid2 = Average_minus_50 - y_fit2; % Difference between the measured average and the best fit line
SSresid2 = sum(yresid2 .^ 2); % Finding the sum of the squared difference between the measured average and the best fit line
SStotal2 = (length(Average_minus_50) - 1) .* var(Average_minus_50); % The number of observations minus the variation in the measured average
rsq2_2 = 1 - SSresid2 ./ SStotal2; % R^2 calculation - 1 - (unexplained variation / total variation)
yt4 = 0.8 .* (yl2(2) - yl2(1)) + yl2(1); % Calculating the y-direction position for the calculation
caption4 = sprintf('R^2 = %f', rsq2_2); % Creating a caption variable for the R-square value

%Adding fitted lines and calculations to plot
figure
scatter(True_minus_50, Average_minus_50, 60, 'filled')
hold on
plot(fitted_X2, fitted_Y2, 'r', 'LineWidth', 3)
text(xt2, yt3, caption3, 'FontSize', 20, 'Color', 'r', 'FontWeight', 'bold')
text(xt2, yt4, caption4, 'FontSize', 20, 'Color', 'r', 'FontWeight', 'bold')
hold off
set(gca, 'FontSize', 20) % Setting the font size of the numbers
xlim([-1 412])
ylim([-1 412])
xlabel('Therotical Value (ppb)', 'FontSize', 20) % Naming the x-axis
ylabel('Measured Value (ppb)', 'FontSize', 20) % Naming the y-axis
title('09 20 2022 Ethane Calibration Correlation and Fit', 'FontSize', 30); % Providing a title
legend('Data', 'Linear Fit', 'Location', 'southeast', 'FontSize', 20) % Creating a legend
grid on % Turning on major grid
grid minor  % Turning on minor grid
