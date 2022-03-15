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
fddx = @ (x) 12*x^2 + ((27/5)*x) - 12;
%--------------------------------------------------------------------------
%setting maximum iteration
max_iter = 10;
%setting initial point
x0 = 3;
i = 1;
while i <= max_iter
    %newton method algorithm
    x1 = x0-(fdx(x0)/fddx(x0))
    x0 = x1;
    i = i+1
end
%% plot func for Task2
clear
clc
%x = linspace(-3.5,2.5);
%y = linspace(-3.5,2.5);
%x = linspace(-1.5,0.3);
%y = linspace(-1.5,0.3);
x = linspace(-50,50);
y = linspace(-50,50);
%y = x.^4 + 0.9*x.^3 - 6*x.^2 + 3*x - 1;
y =  24*x.^3 + 42*x.^2 + 15*x + 6;
plot(x,y);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on;