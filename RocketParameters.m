%% Rocket Launch Project
% Author: Mia Morrison

% Rocket Paramters

% The parameters for this rocket were selected based on publicly available specifications of the Falcon 9 first stage and simplified for educational flight dynamics modeling.


% Mass Properties

m_0 = 549054;      % kg
m_dry = 25600;     % kg
burn_time = 162;    % sec
m_dot = (m_0 - m_dry)/burn_time; 

Thrust = 7607000;  % N

% Aerodynamics

Cd = 0.3;
A = 10.75;      % m^2
rho = 1.225;

g = 9.81;
R_E = 6371e3;  % m


% Initial Simulation Conditions

x_0 = 0;
y_0 = 0;
z_0 = 0;

vx_0 = 0;
vy_0 = 0;
vz_0 = 0;

yaw_0 = 0;
pitch_0 = 0;
roll_0 = 0;

p_0 = 0;
q_0 = -0.10;
r_0 = 0;
