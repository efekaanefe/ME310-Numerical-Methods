%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Salvador()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close
clc
clear all

global nL x y angle l links joints path pathPts isRobotMoving ...
       wantToQuit isMouseDown fsolveOptions

figure('Name', 'Salvador', ...
       'MenuBar','none', ...
       'ToolBar','none', ...
       'Position', [500 200 650 600], ...
       'NumberTitle','off');

ax = axes();
grid on;
axis equal;
axis([-10 10 -10 10])
title(gca, 'Salvador is at your service. Draw something with the mouse');
set(gcf, 'WindowButtonDownFcn', @mouseDown);
set(gcf, 'WindowButtonMotionFcn', @mouseMove);
set(gcf, 'WindowButtonUpFcn', @mouseUp);
set(gcf, 'CloseRequestFcn', @closeWindow);

isRobotMoving = 0;
wantToQuit = 0;
isMouseDown = 0;

nL = 2;    % Number of links

x = zeros(nL+1);    % x coordinates of the joints and the tip
y = zeros(nL+1);    % y coordinates of the joints and the tip

l = [7 5];    % Link lengths

angle = pi/180*[180 90];    % Initial link angles

% Calculate joint coordinates
for i = 1:nL
    x(i+1) = x(i) + l(i) * cos(angle(i));
    y(i+1) = y(i) + l(i) * sin(angle(i));
end

% Create the path to be followed
pathPts = [0 0];   % Set the first point of the path to the end
                   % of the arm

hold(ax, 'on');

links  = [];    % Link objects drawn on the figure
joints = [];    % Joint objects drawn on the figure
path   = [];    % Path object drawn on the figure

% Draw the empty initial path
path = plot(gca, pathPts(:,1), pathPts(:,2), 'r', 'LineWidth', 2);

% Draw the links as lines
links(1) = plot(ax, x(1:2), y(1:2), 'k', 'LineWidth', 5);
links(2) = plot(ax, x(2:3), y(2:3), 'k', 'LineWidth', 5);

% Draw the joints as empty circles
joints(1) = plot(ax, x(1), y(1), 'ok', 'LineWidth', 5, 'MarkerSize', 14, 'MarkerFaceColor', 'white', 'MarkerEdgeColor', 'black');
joints(2) = plot(ax, x(2), y(2), 'ok', 'LineWidth', 4, 'MarkerSize', 10, 'MarkerFaceColor', 'white', 'MarkerEdgeColor', 'black');

drawnow;


% Enter the infinite loop. This loop will terminate when the user closes the 
% figure window
while (~wantToQuit)
    pause(0.1);
end

end  % of the main function




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = kinematics(design_variables, l1, x, y)
f = [x - l1*cos(design_variables(1)) - design_variables(3)*cos(design_variables(2));
     y - l1*sin(design_variables(1)) - design_variables(3)*sin(design_variables(2))];
out = f(1)^2 + f(2)^2;
end

function [c, ceq] = nonlcon(x)
    % x(3) - Second link length
    c = [2 - x(3); % Lower bound constraint
         x(3) - 8]; % Upper bound constraint
    ceq = []; % No equality constraints
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function moveRobot()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global nL x y angle l pathPts isRobotMoving links joints fsolveOptions

isRobotMoving = 1;

for k = 1:size(pathPts,1)    % Loop for all the points of the path

    % Solve for new angles for the position of the tip of the arm
    xNew = pathPts(k,1);
    yNew = pathPts(k,2);
    
    % Initial guess
    initialGuess = [angle, l(2)]; % input
    
    % Solve the nonlinear system constrained system
    [optimum_variables] = fmincon(@(design_variables)kinematics(design_variables, ...
        l(1), xNew, yNew), initialGuess, ...
        [], [], [], [], [], [], ...
        @nonlcon);

    angle(1) = optimum_variables(1); 
    angle(2) = optimum_variables(2);
    l(2) = optimum_variables(3);

    % Move the links
    for i = 1:nL
        x(i+1) = x(i) + l(i) * cos(angle(i));
        y(i+1) = y(i) + l(i) * sin(angle(i));

        set(links(i), 'XData', x(i:i+1));
        set(links(i), 'YData', y(i:i+1));
    end

    % Move the joints
    for i = 2:nL
        set(joints(i), 'XData', x(i));
        set(joints(i), 'YData', y(i));
    end

    pause(0.01)
    
end  % of path points loop

isRobotMoving = 0;

end  % of function moveRobot




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mouseDown (~,~)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Called when the user clicks the mouse

global pathPts isMouseDown isRobotMoving

if ~isRobotMoving
    pathPts = [];   % Reset the path

    isMouseDown = 1;
end

end  % of function mouseDown




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mouseUp (~,~)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Called when the user clicks the mouse

global isRobotMoving isMouseDown

if isMouseDown && ~isRobotMoving
    moveRobot
end

isMouseDown = 0;

end  % of function mouseUp




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mouseMove (~,~)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global path pathPts isRobotMoving isMouseDown

if ~isRobotMoving && isMouseDown

    % Get the coordinates of the mouse pointer
    C = get(gca, 'CurrentPoint');
    mouseX = C(1,1);
    mouseY = C(1,2);

    pathPts = [pathPts; mouseX mouseY];   % Add the current mouse pointer
                                          % coordinates to the path
    % Show the path as it is being drawn
    set(path, 'XData', pathPts(:,1));
    set(path, 'YData', pathPts(:,2));

    drawnow;
end

end  % of the mouseMove function




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function closeWindow (~,~)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Called when the user wants to close the figure window
global wantToQuit

wantToQuit = 1;   % This will let use go out of the while loop of the main function.

delete(gcf)       % Close the figure window.
end
