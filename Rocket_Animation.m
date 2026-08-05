%% Rocket Launch Animation
% Author: Mia Morrison

% This script runs the Simulink rocket launch model and creates a three-dimensional animation of the rocket trajectory. During the flight,
% the rocket position, orientation, flight path, and mission telemetry are updated in real time.

clc; close all

%% Load Rocket Parameters & Run Simulink Model
% Loads all rocket parameters into the MATLAB workspace that are are shared with the Simulink model so both MATLAB and Simulink use the
% same vehicle properties and initial conditions. Subsequently executes the rocket launch simulation and stores every output variable inside the structure "out".

RocketParameters

out = sim('Rocket_Launch_Sim');

%% Create Animation Figure

figure
set(gcf,'Position',[100 100 1126 750])

hold on
grid on
axis equal
view(3)

xlabel('X Position (m)')
ylabel('Y Position (m)')
zlabel('Altitude (m)')

title('Rocket Launch Simulation')

%% Plot Complete Trajectory

plot3(out.x,out.y,out.z,'k--')

%% Create Rocket Marker
% Represents the rocket using a red triangular marker. The marker position
% will be updated every animation frame.

rocket = plot3(out.x(1),out.y(1),out.z(1),'^','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',12);

%% Create Flight Trail
% Stores every previous rocket position to visualize the flight path as the rocket travels.

trail = animatedline('Color','b','LineWidth',1.5);

% Creates launch pad near origin 

fill3([-100 100 100 -100],[-100 -100 100 100],[0 0 0 0],[0.5 0.5 0.5]);

text(0,300,20,'Launch Pad','HorizontalAlignment','center')

%% Create Orientation Arrow
% The green arrow represents the rocket body axis. The arrow direction is calculated from the simulated Euler angles in every frame.

L = 100;

arrow = quiver3(out.x(1),out.y(1),out.z(1),L,0,0,0,'Color','g','LineWidth',3,'MaxHeadSize',2);

% Telemetry Display for Updated Flight Information in Real Time Using Figure Coordinates

telemetry = annotation('textbox',[0.78 0.70 0.18 0.18],'String','','FitBoxToText','on','BackgroundColor','white','EdgeColor','black','FontSize',10);

%% Animate Rocket Flight
% Stepping through every time sample produced by Simulink. During each iteration the rocket position, trajectory, orientation, and telemetry are updated.

for k = 1:length(out.x)
    
    % Update Rocket Position

    set(rocket,'XData',out.x(k),'YData',out.y(k),'ZData',out.z(k));

    % Updates flight trail by adding the newest position to the trajectory history.

    addpoints(trail,out.x(k),out.y(k),out.z(k));

    % Calculates Flight Quantities for Telemetry Display

    speed = sqrt(out.v_x(k)^2 + out.v_y(k)^2 + out.v_z(k)^2);

    downrange = sqrt(out.x(k)^2 + out.y(k)^2);

    set(telemetry,'String',sprintf(['MISSION TIME\n%.1f s\n\nALTITUDE\n%.0f m\n\nSPEED\n%.1f m/s\n\nDOWNRANGE\n%.0f m'],out.time(k),out.z(k),speed,downrange));

    % Calculates rocket orientation by converting the simulated Euler angles into a direction vector, where the rocket body is pointing in the world frame.

    theta = out.theta(k);
    psi = out.psi(k);

    dx = L*cos(theta)*cos(psi); % Equations calculated using geometric relations
    dy = L*cos(theta)*sin(psi);
    dz = L*sin(theta);

    % Update orientation arrow with position and direction
    set(arrow,'XData',out.x(k),'YData',out.y(k),'ZData',out.z(k),'UData',dx,'VData',dy,'WData',dz);

    % Refresh Animation

    drawnow

 end

disp('Animation Complete!')