function [ sigma ] = SwitchingSignal( TF,STEP,T,t_un )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
sigma = 10;
sigma1 = linspace(sigma,sigma,round((T-t_un)/STEP)-1);
sigma1 = sigma1.';
sigma2 = linspace(0,0,round(t_un/STEP)+1);
sigma2 = sigma2.';
for i = 1: TF/T
sigma = [sigma;sigma1;sigma2];
end

