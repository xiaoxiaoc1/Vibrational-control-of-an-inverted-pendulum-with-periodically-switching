function [ x_dot ] = SystemDynamics(t,x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% alfa = ParametersSheet( 'alfa' );
% beta     = ParametersSheet( 'beta' );
% epsilon     = ParametersSheet( 'epsilon' );


x1 = x(1);
x2 = x(2);

d = t^2/(1+t^2);
% d = 0;
m = 1; g = 9.8; w = 200; l = 1; k = 2;
a = vib_amplitude( t );
% a = 10;
x_dot = [x2; -1/m/l*((m*g-m*a*w*sin(w*t)+k*(a*cos(w*t)))*sin(x1)+k*l*x2+d)];
end

