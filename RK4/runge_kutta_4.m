%% RK4
clc
clear
close all;
f1 = @(x1,x2) x2+(x1*(0.5-x1^2-x2^2))
f2 = @(x1,x2) -x1+(x2*(0.5-x1^2-x2^2))
interval_start = 0;
interval_end = 15;
h = 0.02;
t = interval_start:h:interval_end;
max_iter = length(t);
x1_init = -8;
x2_init = 9;
[x1_res,x2_res] = RK4(f1,f2,h,x1_init,x2_init,max_iter);
plot(x1_res,x2_res,'b');
hold on;
%% ODE45
interval_start = 0;
interval_end = 15;
x1 = -8;
x2 = 9;
% using matlab ode45 method
[t,y] = ode45(@ode_func, [interval_start;interval_end], [x1;x2]);
plot(y(:,1),y(:,2),'m');
legend("ADAM PC","ODE45");
hold off;