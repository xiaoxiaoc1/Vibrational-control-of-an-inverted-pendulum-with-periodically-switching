function [ parm ] = ParametersSheet( name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
switch name
%%%%% Dynamics System Parameters %%%%
    case {'alfa'}
        parm = 0.6;  % gain;
    case {'beta'}
        parm = 1;   % magnitude of multiply dither;
    case {'epsilon'}
        parm = 0.001;   % magnitude of plus dither 
    case {'x_initial'}
        parm = [pi-0.2;0]; 
        
%%%%% Simulation Parameters %%%%
    case {'STEP'}
        parm = 0.001;     
    case {'T0'}
        parm = 0;   
    case {'TF'}
        parm = 10;   
    case {'options'}
        parm = odeset('RelTol',1e-12);  
%%%%% Switching time%%%%
    case {'T'}
        parm = 1;   
    case {'t_un'}
        parm = 0.2;     
    otherwise

end

