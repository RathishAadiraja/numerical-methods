%% Mullers MM2
clear
clc
%our function f(x) with its firat and second derivative f'(x) and f''(x)
f = @(x) 1*x^4 + 0.9*x^3 - 6*x^2 + 3*x - 1;
fdx = @(x) 4*x^3 + (27*x^2)/10 - 12*x + 3;
fddx = @(x) 12*x^2 + (27*x)/5 - 12;
%setting the initial point
x = -2;
for i = 1:10
    %finding the root using MM2
    if abs(fdx(x)+sqrt((fdx(x)^2)-(2*f(x)*fddx(x)))) >= abs(fdx(x)-sqrt((fdx(x)^2)-(2*f(x)*fddx(x))))
        z_min = (-2*f(x))/(fdx(x)+sqrt((fdx(x)^2)-(2*f(x)*fddx(x))));
    else
        z_min = (-2*f(x))/(fdx(x)-sqrt((fdx(x)^2)-(2*f(x)*fddx(x))));
    end
    %the root nearer to the approximation is taken
    x = x + z_min
end