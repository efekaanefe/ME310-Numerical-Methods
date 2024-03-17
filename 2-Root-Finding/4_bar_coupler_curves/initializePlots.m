% METU ME310 Spring 2024
% Author: Cuneyt Sert

% This function initializes the two plots before we start rotating the linakge. The
% first plot is for theta4 vs. thata2 and the second one is for the animation of the
% actual linkage.


function [plot1, plot2, plot3, plot4] = initializePlots()
xmin = -300; xmax = 300;
ymin = -100; ymax = 500;
limits = [xmin xmax ymin ymax];


plot1 = subplot(2,2,1);
title('1st combination of coupler parameters')
axis equal
axis(limits)          % Fix the axes ranges.
hold on
grid on


plot2 = subplot(2,2,2);
title('2nd combination of coupler parameters')
axis equal
axis(limits)          % Fix the axes ranges.
hold on
grid on

plot3 = subplot(2,2,3);
title('3rd combination of coupler parameters')
axis equal
axis(limits)          % Fix the axes ranges.
hold on
grid on

plot4 = subplot(2,2,4);
title('4th combination of coupler parameters')
axis equal
axis(limits)          % Fix the axes ranges.
hold on
grid on