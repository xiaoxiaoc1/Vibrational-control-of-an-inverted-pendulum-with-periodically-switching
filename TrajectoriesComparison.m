function [ output_args ] = TrajectoriesComparison( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% Comparison
load('matlab_w0Tu0.mat')
figure()
plot(t,x(:,1));
ylabel('x_1');
grid on;
hold on;

load('matlab_w1Tu0.mat')
plot(t,x(:,1));
ylabel('x_1');
grid on;
hold on;

load('matlab_w1Tu01.mat')
plot(t,x(:,1));
ylabel('x_1');
grid on;
hold on;

load('matlab_w1Tu02.mat')
plot(t,x(:,1));
ylabel('x_1');
grid on;
hold on;
plot(t,linspace(pi,pi,length(t)),'k');
xlabel('Time/s');
legend('|w|=0, T_u = 0','|w|=1, T_u = 0','|w|=1, T_u = 0.1','|w|=1, T_u = 0.2');
% legend('T_u = 0','T_u = 0.5')
grid on;

end

