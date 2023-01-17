% Author: Nicolas Blanchard

% Setup
clear;
clc;

% Import telemetry data
dialect = mavlinkdialect('common.xml');
logimport = mavlinktlog('1_14_log.tlog',dialect); 

% Filter local position (NED) MAVLINK data
% msgs = readmsg(logimport, 'MessageName', 'LOCAL_POSITION_NED', 'Time',[0 100]);

msgs = readmsg(logimport, 'MessageName', 'LOCAL_POSITION_NED')
% NED = msgs.Messages{1};

% Filter out zero-valued messages
% NED = NED(NED.x ~= 0 & NED.y ~= 0 & NED.z ~= 0, :);

%% Plotting

% Plot flight path (3D w/ labels)
figure();
plot3(double(NED.x), double(NED.y), -1 * double(NED.z));
xlabel("x", 'FontSize', 20, 'FontName', 'times', 'FontAngle', 'italic', 'FontWeight', 'bold');
ylabel("y", 'FontSize', 20, 'FontName', 'times', 'FontAngle', 'italic', 'FontWeight', 'bold');
zlabel("z", 'FontSize', 20, 'FontName', 'times', 'FontAngle', 'italic', 'FontWeight', 'bold');
hold on;

plot3(0, 0, 0.03, '-o', 'Color', 'Red');
text(-0.7, 0, -0.04, '(0.00, 0.00, 0.03)', 'FontName', 'times', 'FontSize', 12);

plot3(-2.06, -2.02, 0.03, '-o', 'Color', 'Red');
text(-2.8, -2.02, -0.05, '(-2.06, -2.02, 0.03)', 'FontName', 'times', 'FontSize', 12);

plot3(-2.09, 2.02, 0.002, '-o', 'Color', 'Red');
text(-2.8, 1.8, -0.05, '(-2.09, 2.02, 0.002)', 'FontName', 'times', 'FontSize', 12);

plot3(2.04, 2.04, -0.06, '-o', 'Color', 'Red');
text(1.4, 2.03, -0.12, '(2.04, 2.04, -0.06)', 'FontName', 'times', 'FontSize', 12);

plot3(2.05, -2.01, 0.07, '-o', 'Color', 'Red');
text(1.1, -2.01, -0.02, '(2.05, -2.01, 0.07)', 'FontName', 'times', 'FontSize', 12);

view(-15, 15);

% Plot flight path (3D w/out labels)
figure();
plot3(double(NED.x), double(NED.y), -1 * double(NED.z));
xlabel("x-position [m]");
ylabel("y-position [m]");
zlabel("z-position [m]");
title("Calculated Flight Path");
view(-15, 15);

% Plot flight path (2D w/ labels)
figure();
plot(double(NED.x), double(NED.y));
xlabel("x-position [m]");
ylabel("y-position [m]");
title("Calculated Flight Path");
hold on;

plot(0, 0, '-o', 'Color', 'Red');
text(-0.25, -0.25, '(0.00, 0.00)');

plot(-2.06, -2.02, '-o', 'Color', 'Red');
text(-2.35, -2.25, '(-2.06, -2.02)');

plot(-2.09, 2.02, '-o', 'Color', 'Red');
text(-1.9, 1.7, '(-2.09, 2.02)');

plot(2.04, 2.04, '-o', 'Color', 'Red');
text(1, 1.9, '(2.04, 2.04)');

plot(2.05, -2.01, '-o', 'Color', 'Red');
text(1.5, -2.25, '(2.05, -2.01)');

% Plot flight path (2d w/out labels)
figure();
plot(double(NED.x), double(NED.y));
xlabel("x-position [m]");
ylabel("y-position [m]");
title("Calculated Flight Path");
