clear; close all; clc
%% LOAD PARAMETERS
COLOR_MASS1=[0,102,255]/255;
COLOR_MASS2=[0.1 0.4 0.6];
COLOR_LINK1=[0.5 0.1 0.7];
COLOR_LINK2=[0.7 0.1 0.5];
COLOR_JOINT=[.9,.9,.9];
COLOR_SLIDER = [255,153,85]/255;
R_mass = 25; % Radius of mass
l1 = 1;
l2 = 1;
b = 0.2;
STEP = ParametersSheet( 'STEP' );
T0     = ParametersSheet( 'T0' );
TF     = ParametersSheet( 'TF' );
options     = ParametersSheet( 'options' );
x_initial     = ParametersSheet( 'x_initial' );
T = ParametersSheet( 'T' );
t_un     = ParametersSheet( 't_un' );
a = 20;
w = 4000;
%% DO I WANT TO RECORD THE VIDEO
dt = 0.02;
FLAG = 0; % 0: Plot trajectory; 1: Record VIDEO; 
%% CREAT MOVEMENT

% [T0:STEP:TF]
% x_dot = @(t,x) SystemDynamics(t,x);
% [T_nominal,x_nominal] = ode45(x_dot,[T0:STEP:TF],x_initial,options);
% t = T_nominal;
% x = x_nominal;
% figure()
% subplot(2,1,1)
% plot(t,x(:,1));
% ylabel('x_1');
% subplot(2,1,2)
% plot(t,x(:,2));
% ylabel('x_2');
% xlabel('time/s');
% load('matlab_1_bounded');
% [ t,x] = Vib_Controller( );
load('matlab_w1Tu02');
Theta = x(:,1);
%% Inverted pendulum
% Mass
r = 0.1;
R = 0.3;
l = 1;
l_Boundary = 1.5;
theta = 0:2*pi/20:2*pi;
% Pendulum
xl1 = linspace(0,l1,2);
yl1 = linspace(-b/8,-b/8,2);
yl2 = linspace(0,0,2);
yl3 = -yl1;
X_pendum1 = [xl1;xl1;xl1];X_pendum1 = X_pendum1.';
Y_pendum1 = [yl1;yl2;yl3];Y_pendum1 = Y_pendum1.';
% X_pendum1 = linspace(r,r,10);
% X_pendum2 = linspace(-r,-r,10);
% Y_pendum1 = linspace(0,-l,length(X_pendum1));
% Y_pendum2 = linspace(0,-l,length(X_pendum1));
% Slider
% X_slider1 = linspace(-3*r,-3*r,10);
% X_slider2 = linspace(-3*r,3*r,10);
% X_slider3 = linspace(3*r,3*r,10);
% X_slider4 = X_slider2;
% Y_slider1 = linspace(-5*r,5*r,length(X_slider1));
% Y_slider2 = linspace(5*r,5*r,length(X_slider1));
% Y_slider3 = linspace(-5*r,5*r,length(X_slider1));
% Y_slider4 = linspace(-5*r,-5*r,length(X_slider1));
% Track
X_track1 = linspace(-2*r-0.05,-2*r-0.05,10);
Y_track1 = linspace(-1.5,1.5,length(X_track1));
X_track2 = linspace(-3*r,-3*r,10);
Y_track2 = linspace(-1.5,1.5,length(X_track2));
X_track3 = -X_track1;
X_track4 = -X_track2;
Y_track3 = Y_track1;
Y_track4 = Y_track2;
if FLAG
%% CREAT ANIMATION
    % SETUP VIDEO
    fps = 1/dt;
    bipedVideo = VideoWriter('InvertedPendulumSim','MPEG-4');
    bipedVideo.FrameRate = fps;
    open(bipedVideo);
% CREAT ANIMATION
handle = figure;
hold on
for i = 1:10:length(t)
    cla
    a = vib_amplitude( t(i) );
    R01 = [cos(Theta(i)),-sin(Theta(i)); sin(Theta(i)),cos(Theta(i))];
    R01i = [cos(Theta(i)-pi/2),-sin(Theta(i)-pi/2); sin(Theta(i)-pi/2),cos(Theta(i)-pi/2)];
   [x_pendum1,y_pendum1] = rotation(X_pendum1,Y_pendum1,R01i);
    y_pendum1 = a/w*sin(w*t(i))+y_pendum1;
%   PLOT CURRENT MECHANISM
    % TRACK 
    plot(X_track1,Y_track1,'k','LineWidth',1.5);plot(X_track2,Y_track2,'k','LineWidth',1.5);
    plot(X_track3,Y_track3,'k','LineWidth',1.5);plot(X_track4,Y_track4,'k','LineWidth',1.5);
    % SLIDER
    rectangle('Position',[-2*r,-3*r+a/w*sin(w*t(i)),4*r,6*r],'FaceColor',COLOR_SLIDER) ;      
    % PENDULUM1 
    plot(x_pendum1,y_pendum1,'Color',COLOR_LINK1,'LineWidth',4);
    plot(l*cos(Theta(i)-pi/2),a/w*sin(w*t(i))+l*sin(Theta(i)-pi/2),'ko',...
        'MarkerFaceColor',COLOR_MASS1,'MarkerSize',R_mass); % MASS
%     % PENDULUM2 
%     plot(x_pendum2,y_pendum2,'Color',COLOR_LINK2,'LineWidth',4);
%     plot(l*cos(Theta2(i)-pi/2),a/w*sin(w*t(i))+l*sin(Theta2(i)-pi/2),'ko',...
%         'MarkerFaceColor',COLOR_MASS2,'MarkerSize',R_mass); % MASS
    % OTHERS
    plot(0,a/w*sin(w*t(i)),'ko','MarkerFaceColor',COLOR_JOINT,'MarkerSize',8); % JOINT   
    plot(0,l,'r*');
    % Boundary
%     plot(X_slider1,Y_slider1+a/w*sin(w*t(i)),'b--');
%     plot(X_slider2,Y_slider2+a/w*sin(w*t(i)),'b--');
%     plot(X_slider3,Y_slider3+a/w*sin(w*t(i)),'b--');
%     plot(X_slider4,Y_slider4+a/w*sin(w*t(i)),'b--');
    
    
    axis square
    axis equal    
    axis([-1.5,1.5,-1.5,1.5]);
    xlabel('X')
    ylabel('Y')
    
    writeVideo(bipedVideo,getframe(handle));
    
end
% CLOSE VIDEO
    close(bipedVideo)
else
%% DRAW TRAJECTORY
    fps = 1/dt;
    bipedVideo = VideoWriter('TrajectorySim','MPEG-4');
    bipedVideo.FrameRate = fps;
    open(bipedVideo);
% CREAT ANIMATION
handle = figure;
for i = 1:10:length(t)
    subplot(3,1,1)
    cla
    hold on;
    plot(t,x(:,1));
    plot(t,linspace(pi,pi,length(t)),'k');
    plot([t(i),t(i)],[2.5,3.5],'k','LineWidth',1);
    % ylim([pi-0.3,3.6]);
    grid on;
    ylabel('\theta')
    subplot(3,1,2)
    cla
    hold on;
    plot(t,x(:,2));
    plot(t,linspace(0,0,length(t)),'k');
    plot([t(i),t(i)],[-5,5],'k','LineWidth',1);
    ylabel('d\theta/dt')
    xlabel('Time/s')
    grid on;
    hold on   
    subplot(3,1,3)
    cla
    sigma = SwitchingSignal( TF,STEP,T,t_un );
    plot(t,sigma/10);hold on
    plot([t(i),t(i)],[0,1],'k','LineWidth',1);
    ylabel('\sigma');
    xlabel('Time/s');
    ylim([0,1])
    writeVideo(bipedVideo,getframe(handle));
    
end
% CLOSE VIDEO
    close(bipedVideo)
end