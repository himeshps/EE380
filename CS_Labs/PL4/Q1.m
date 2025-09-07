% solve_BR.m
% Compute viscous friction B and armature resistance Ra
% Using:
%   Km = Kt / (Ra*B + Kt*Kb)
%   Tm = (Ra*J) / (Ra*B + Kt*Kb)
%
% Closed-form results:
%   B  = (J/Tm) * (1 - Km*Kb)
%   Ra = (Tm*Kt) / (J*Km)

clc; clear; close all;

% ----- Known motor constants from Table 1.1 (SI units) -----
J  = 13.0e-7;      % Rotor inertia [kg*m^2] (13.0 g*cm^2)
Kt = 25.5e-3;      % Torque constant [N*m/A] (25.5 mN*m/A)
Kb = 1 / ((374*2*pi)/60);  % Back-emf constant [V*s/rad]

% ----- Enter your measured values from Experiment 1 -----
Km = 34.6875;   %  measured DC gain
Tm = 0.044;   %  measured time constant

% ----- Check inputs -----
if Km <= 0 || Tm <= 0
    error('Please set your measured Km (>0) and Tm (>0) before running.');
end

% ----- Solve equations -----
B  = (J/Tm) * (1 - Km*Kb);
Ra = (Tm*Kt) / (J*Km);

% ----- Display results -----
fprintf('Results:\n');
fprintf('  B  (viscous friction)   = %.6g N*m*s/rad\n', B);
fprintf('  Ra (armature resistance) = %.6g ohms\n', Ra);

