%% Laguerre’s method
clear
clc
%our function f(x) with its first and second derivative f'(x) and f''(x)
f = @(x) 1*x^4 + 0.9*x^3 - 6*x^2 + 3*x - 1;
fdx = @(x) 4*x^3 + (27*x^2)/10 - 12*x + 3;
fddx = @(x) 12*x^2 + (27*x)/5 - 12;
%order of the polynomial
n = 4;
%setting the initial point
x = -2;
for i = 1:10
    %Laguerre’s algorithm
    a = sqrt((n-1) * ((n-1)*(fdx(x))^2 - n*f(x)*fddx(x)));
    %finding roots and using the one which is nearer to the approximation
    if abs(fdx(x)+a) >= abs(fdx(x)-a)
        x = x-((n*f(x))/(fdx(x)+a));
    else
        x = x-((n*f(x))/(fdx(x)-a));
    end
    x
end

%% finding roots using MATLAB roots function
roots([1 0.9 -6 3 -1])