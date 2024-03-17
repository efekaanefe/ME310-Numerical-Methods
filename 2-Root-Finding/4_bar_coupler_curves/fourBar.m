% METU ME310 Spring 2024
% Author: Cuneyt Sert

% This code simulates the motion of a four=bar linkage. It calculates the
% output link angle for each 1 degree rotation of the input link. For this,
% it solves the Freudenstein's equation using the Newton-Raphson method.
%
% Freudenstein eqn: f(t4) = k1*cos(t4) - k2*cos(t2) + k3 - cos(t2-t4) = 0;
%                   where t4 is the unknown output link angle and t2 is the
%                   known input link angle. k1, k2 and k3 are known
%                   geometric parameters defined in terms of link lengths.
%
% This code plots output link angle vs. input link angle and shows an
% animation of the moving linkage.

clc;
close all;
clear;

nCycles = 5;       % Animate for this many cycles of the input link
tol     = 1e-3;    % Tolerance for the Newton-Raphson method
maxIter = 1000;    % Maximum iteration number for the Newton-Raphson

% Link lengths
a = 100;    % Input link
b = 250;    % Coupler link
c = 250;    % Output link
d = 200;    % Ground link

% Geometric parameters used in the Freudenstein eqn.
k1 = d/a;
k2 = d/c;
k3 = (a^2-b^2+c^2+d^2)/(2*a*c);



%====================================================================================
% To initialize the solution, set theta2 to zero and calculate the corresponding
% theta4 exactly.
%====================================================================================
theta2 = 0;
theta4 = acosd((k3-k2)/(1-k1));    % Exact solution of the Freudenstein's eqn. for
                                   % theta2 = 0

fprintf('Theta2 = %3.0f deg.,   Theta4 = %6.2f deg. \n', theta2, theta4);

t2 = theta2 * pi/180;       % theta2 in radians
t4 = theta4 * pi/180;       % theta4 in radians


%====================================================================================
% Call a function to initialize plots
%==================================================================================== 
[plot1,plot2, plot3, plot4] = initializePlots();

pause(0.5);    % Pause a bit before the animation starts.


%====================================================================================
% This is the loop where the linkage rotates
% You can change the increment to see a faster rotating linkage.
%====================================================================================
for theta2 = 1:3:360*nCycles    % Calculations will be done for nCycles cycles
    t2 = theta2 * pi/180;       % theta2 in radians
    
    %================================================================================
    % Define the Freudenstein function and its derivative with respect to t4 angle.
    %================================================================================
    % This is done inside the for loop because the t2 angle changes and needs to be
    % updated in the function.
    f  = @(t4) k1*cos(t4) - k2*cos(t2) + k3 - cos(t2-t4);
    df = @(t4) -k1*sin(t4) - sin(t2-t4);

    
    %================================================================================
    % Solve the Freudenstein eqn. for t4 using Newton-Raphson
    %================================================================================
    initialGuess = t4;  % Previous t4 will be used as the initla guess
    t4 = NewtonRaphson(f, df, tol, maxIter, initialGuess);
    
    theta4 = t4 * 180/pi;   % theta4 in degrees
    
    %================================================================================
    % Print input and output links angles on the screen.
    %================================================================================
    % Modulus function "mod" used below gives the remainder theta2/360
    % division. We know that 360 degrees is the same as 0 degree, and we do not
    % want to go beyond 360 on the screen.
    fprintf('Theta2 = %3.0f deg.,   Theta4 = %6.2f deg. \n', mod(theta2,360), theta4);

    
    %================================================================================
    % Update plots
    %================================================================================
    i = 1;
    updatePlots(plot1,plot2, plot3, plot4, a, c, d, theta2, theta4)

end  % of the theta2 loop
