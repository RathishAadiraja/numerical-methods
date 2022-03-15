%% ADAM PC
clc
clear
close all;
f1 = @(x1,x2) x2+(x1*(0.5-x1^2-x2^2))
f2 = @(x1,x2) -x1+(x2*(0.5-x1^2-x2^2))
% start and end interval
interval_start = 0;
interval_end = 15;
% step size
h = 0.0001;
% total length of the interval with step size
t = interval_start:h:interval_end;
max_iter_adam = length(t);
% initial values
x1_init = -8;
x2_init = 9;
max_iter = 3;
% first few are calculated using RK4 method
[x1_res,x2_res] = RK4(f1,f2,h,x1_init,x2_init,max_iter);
x1 = x1_res;
x2 = x2_res;
x_pre1 = x1_res;
x_pre2 = x2_res;
% beta values for implicit and explicit method
beta_exp=[55/24,-59/24,37/24,-9/24];
beta_imp=[251/720,646/720,-264/720,106/720,-19/720];
for i=5:(max_iter_adam+1)
    % explicit prediction
    sum_exp_1 = 0;
    sum_exp_2 = 0;
    for j =1:4
        sum_exp_1 = sum_exp_1+(beta_exp(j)*f1(x1(i-j), x2(i-j)));
        sum_exp_2 = sum_exp_2+(beta_exp(j)*f2(x1(i-j), x2(i-j)));
    end
    % explicit evaluation
    x10 = x1(i-1) + h*sum_exp_1;
    x20 = x2(i-1) + h*sum_exp_2;
    x_pre1(i) = x10;
    x_pre2(i) = x20;
    fc1 = f1(x10,x20);
    fc2 = f2(x10,x20);
    sum_imp_1 = 0;
    sum_imp_2 = 0;
    % implicit prediction
    for j =1:3
        sum_imp_1 = sum_imp_1+(beta_imp(j+1)*f1(x1(i-j), x2(i-j)));
        sum_imp_2 = sum_imp_2+(beta_imp(j+1)*f2(x1(i-j), x2(i-j)));
    end
    % implicit evaluation
    x1(i) = x1(i-1) + h*sum_imp_1 + h*beta_imp(1)*fc1;
    x2(i) = x2(i-1) + h*sum_imp_2 + h*beta_imp(1)*fc2;
end
figure(1);
plot(x1,x2,'b');
hold on;