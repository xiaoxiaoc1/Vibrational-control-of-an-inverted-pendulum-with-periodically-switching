function [ t,x,sigma] = Vib_Controller( )
close all; clc; clear;
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
STEP = ParametersSheet( 'STEP' );
T0     = ParametersSheet( 'T0' );
TF     = ParametersSheet( 'TF' );
options     = ParametersSheet( 'options' );
x_initial     = ParametersSheet( 'x_initial' );
T = ParametersSheet( 'T' );
t_un     = ParametersSheet( 't_un' );
% [T0:STEP:TF]

x_dot = @(t,x) SystemDynamics(t,x);
[T_nominal,x_nominal] = ode45(x_dot,[T0:STEP:TF],x_initial,options);
t = T_nominal;
x = x_nominal;

figure()
subplot(3,1,1)
% yyaxis left
plot(t,x(:,1),'Linewidth',1);hold on
ylabel('\theta [rad]')
grid on;
hold on;
% ylim([pi-0.3,pi+0.3]);
subplot(3,1,2)
hold on;
plot(t,x(:,2),'Linewidth',1);
% ylabel('$\dot{\theta}$ [rad/s]');
ylabel('$\dot{\theta}$ [rad/s]','interpreter','latex')
grid on;
subplot(3,1,3)
sigma = SwitchingSignal( TF,STEP,T,t_un )/10;
hold on;
% sigma = linspace(10,10,length(t)); sigma = sigma';
plot(t,sigma,'Linewidth',1);
ylabel('\sigma');
xlabel('Time/s');
hold on;

load('matlab_w1Tu01');
subplot(3,1,1)
% yyaxis right
plot(t,x(:,1),'Linewidth',1);hold on
plot(t,linspace(pi,pi,length(t)),'k--');
ylabel('\theta [rad]')
grid on;
hold on;
% ylim([pi-0.3,pi+0.3]);
subplot(3,1,2)
hold on;
plot(t,x(:,2),'Linewidth',1);
plot(t,linspace(0,0,length(t)),'k--');
legend('T_u = 0.3','T_u = 0.1')
% ylabel('$\dot{\theta}$ [rad/s]');
grid on;
subplot(3,1,3)
% sigma = linspace(10,10,length(t)); sigma = sigma';
plot(t,sigma/10,'Linewidth',1);
hold on;
% plot(t,linspace(1,1,length(t)));
% title('Closed system states with time');
end

