figure();
load('matlab_w0Tu0');
E1 = EnergyConsumption(t,x,sigma);
load('matlab_w1Tu02');
E2 = EnergyConsumption(t,x,sigma);
plot(t,E1,t,E2);
legend('T_u =0','T_u = 0.2');
ylabel('Energy/J');
xlabel('Time/s');
