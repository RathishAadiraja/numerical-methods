%% plotting the function for Task 1
clear
clc
my_func = @(x) -1.65+(0.3*x)-(x.*exp(-x))
x = linspace(-2,10);
y = linspace(-2,10);
y = -1.65+(0.3*x)-(x.*exp(-x));
plot(x,y);
xlabel("x");
ylabel("y");
title("Graph of the function");
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
grid on;
xline(-2,'--r','LineWidth', 1.5);
xline(0,'--r','LineWidth', 1.5);
xline(4,'--m','LineWidth', 1.5);
xline(6,'--m','LineWidth', 1.5);