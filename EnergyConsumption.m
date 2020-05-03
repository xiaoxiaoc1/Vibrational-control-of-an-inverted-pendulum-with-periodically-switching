function [ E ] = EnergyConsumption( t,x,sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = 1; g = 9.8; w = 200; l = 1; k = 2;a = 10;
E = 0;
J = 0;
dt = t(2)-t(1);
theta = x(:,1);
dtheta = x(:,2);
V0 = m*g*(l*sin(theta(1)-pi/2)+a/w*sin(w*t(1)));
v_sq0 = l^2*(dtheta(1))^2+2*a*l*dtheta(1)*sin(theta(1))*sin(w*t(1))+(a*sin(w*t(1)))^2;
T0 = 0.5*m*v_sq0;
for i = 2:(length(t)-1)
    if sigma(i) == 0
        E(i) = E(i-1);
    else 
        v_sq = l^2*(dtheta(i))^2+2*a*l*dtheta(i)*sin(theta(i))*sin(w*t(i))+(a*sin(w*t(i)))^2;
        J = J + dt*k*v_sq;
        V = m*g*(l*sin(theta(i)-pi/2)+a/w*sin(w*t(i)));
        T = 0.5*m*v_sq;
        E(i) = T+V+J-m*g*sin(theta(1)-pi/2)-V0-T0;
    end
end
E = [0 E];
% plot(t,E);
end

