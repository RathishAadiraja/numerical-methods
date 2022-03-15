%% RK4 with adaptive step size
clc
clear
close all;
f1 = @(x1,x2) x2+(x1*(0.5-x1^2-x2^2))
f2 = @(x1,x2) -x1+(x2*(0.5-x1^2-x2^2))
func = @ode_func;
interval_start = 0;
interval_end = 15;
x1_init = -8;
x2_init = 9;
x1(1) = x1_init;
x2(1) = x2_init;
rel_tol = 10^-4;
abs_tol = 10^-4;
h(2) = 0.009;
h_min = 10^-5;
t(1) = x1_init;
t(2) = t(1)+h(2);
s = 0.9;
beta = 5;
order = 4;
max_iter = 4;
t(1) = interval_start;
i = 2;
while(t < interval_end)
    % Rk4 method
    k11 = f1(x1(i-1),x2(i-1));
    k12 = f2(x1(i-1),x2(i-1));
    k21 = f1(x1(i-1) + (h(i)/2)*k11, x2(i-1) + (h(i)/2)*k12);
    k22 = f2(x1(i-1) + (h(i)/2)*k11, x2(i-1) + (h(i)/2)*k12);
    k31 = f1(x1(i-1) + (h(i)/2)*k21, x2(i-1) + (h(i)/2)*k22);
    k32 = f2(x1(i-1) + (h(i)/2)*k21, x2(i-1) + (h(i)/2)*k22);
    k41 = f1(x1(i-1) + h(i)*k31, x2(i-1) + h(i)*k32);
    k42 = f2(x1(i-1) + h(i)*k31, x2(i-1) + h(i)*k32);
    x1(i) = x1(i-1) + (h(i)/6)*(k11 + 2*k21 + 2*k31 + k41);
    x2(i) = x2(i-1) + (h(i)/6)*(k12 + 2*k22 + 2*k32 + k42);
    % finding delta values
    del_1 = (x1(i)-x1(i-1))/((2^order)-1);
    del_2 = (x2(i)-x2(i-1))/((2^order)-1);
    % finding alpha values
    tol_1 = abs(x1(i))*(rel_tol+abs_tol);
    alpha_1 = (tol_1/abs(del_1))^(1/(order+1));
    tol_2 = abs(x2(i))*(rel_tol+abs_tol);
    alpha_2 = (tol_2/abs(del_2))^(1/(order+1));
    % finding the smallest alpha
    if alpha_1 < alpha_2
        h_temp = s*alpha_1*h(i);
        min_alpha = alpha_1;
    else
        h_temp = s*alpha_2*h(i);
        min_alpha = alpha_2;
    end
    % continuation of algorithm accoeding to the flowchart
    if (s*min_alpha) >= 1
        if (t(i)+h(i)) > interval_end
            break;
        else
            t(i+1) = t(i)+h(i);
            h(i+1) = min(h_temp,beta*h(i));
            i = i+1;
        end
    else
        if h_temp <= h_min
            disp("solution not possible with assumed accuracy");
        else
            h(i) = h_temp;
        end
    end
end