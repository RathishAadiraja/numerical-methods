%% Newton's method
clear
clc
%-------------------------------Task1--------------------------------------
% f = @(x) -1.65+(0.3*x)-(x.*exp(-x))
% fdx = @(x) x*exp(-x) - exp(-x) + 3/10
%--------------------------------------------------------------------------
%-------------------------------Task2--------------------------------------
f = @(x) 1*x^4 + 0.9*x^3 - 6*x^2 + 3*x - 1;
fdx = @(x) 4*x^3 + (27*x^2)/10 - 12*x + 3;
%--------------------------------------------------------------------------
%setting maximum iteration
max_iter = 100;
%setting initial point
x0 = -3;
i = 1;
while i <= max_iter
    %newton method algorithm
    x1 = x0-(f(x0)/fdx(x0))
    x0 = x1;
    i = i+1
end
%% plot func for Task2
clear
clc
x = linspace(-3.5,2.5);
y = linspace(-3.5,2.5);
y = x.^4 + 0.9*x.^3 - 6*x.^2 + 3*x - 1;
plot(x,y);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on;