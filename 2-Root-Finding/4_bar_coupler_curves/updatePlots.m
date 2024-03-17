% METU ME310 Spring 2024
% Author: Cuneyt Sert
%
% This function draws a four-bar linkage for given link lengths, and input
% and output link angles. First input parameter plotName is the name of the
% axis object that will be used for this purpose.


function [] = updatePlots(plot1,plot2, plot3, plot4, a, c, d, theta2, theta4)

% Combinations of parameters for coupler point
% theta_cp = [0 0 0 0];
% L_cp = [100 200 300 400];

theta_cp = [15 30 45 60];
L_cp = [250 250 250 250];

%====================================================================================
% Update plot1 by drawing the new shape of the linkage
%====================================================================================
% cla(plot1);       % Clear plot2

% Calculate the coordinates of the moving end of the input link, called point p1
p1x = a*cosd(theta2);    % Fixed end of the input link is at (0,0)
p1y = a*sind(theta2);

% Calculate the coordinates of the moving end of the output link, called point p2
p2x = d + c*cosd(theta4);
p2y = c*sind(theta4);


x = [0 p1x p2x d];    % x coordinates of all 4 joints of the linkage
y = [0 p1y p2y 0];    % y coordinates of all 4 joints of the linkage


% % Draw the links
% plot(plot1, x, y, 'k', 'LineWidth', 2)
% hold on;
% 
% % Put small circle marks at the joints for a better look
% % 'ok' means use circular markers in black color.
% plot(plot1, x, y, 'ok', 'LineWidth', 2, 'MarkerFaceColor', 'w')

% Calculate the coordinates for coupler point
theta3 = rad2deg(atan2((p2y - p1y),(p2x - p1x)));
p3x = p1x + L_cp .* cosd(theta3 + theta_cp);
p3y = p1y + L_cp .* sind(theta3 + theta_cp);

plot(plot1, p3x(1), p3y(1), 'ok', 'LineWidth', 0.8, 'MarkerFaceColor', 'w')
plot(plot2, p3x(2), p3y(2), 'ok', 'LineWidth', 0.8, 'MarkerFaceColor', 'w')
plot(plot3, p3x(3), p3y(3), 'ok', 'LineWidth', 0.8, 'MarkerFaceColor', 'w')
plot(plot4, p3x(4), p3y(4), 'ok', 'LineWidth', 0.8, 'MarkerFaceColor', 'w')


% Display the current theta4 value on the plot as a text
% theta4text = "\theta_4 = " + num2str(theta4, '%.1f');    % num2str converts a number to a 
                                                         % string in a given format.
                                                         % '%.1f' means print 1 digit
                                                         % after the decimal point.

% text(plot1, 200, -75, theta4text);    % Put a text on a plot at a specified coordinate

drawnow;    % This is necessary so that the plots can be updated
            % immediately in this busy for loop.
