%% secant method
clear
clc
% our function f(x)
f = @(x) -1.65+(0.3*x)-(x.*exp(-x));
%setting maximum itertion value
max_iter = 15;
%setting initial points
x0 = -2;
x1 = 0;
i = 1;
while i <= max_iter
    %secant method algorithm
    x2 = (x0*f(x1) - x1*f(x0))/(f(x1)-f(x0));
    x0 = x1
    x1 = x2
    i = i+1
end