%% Gauss-Seidel method
clear all
close all
clc
A = [6,2,1,-1;4,-10,2,-1;2,-1,8,-1;5,-2,1,-8];
b = [6;8;0;2];
max_iter = 100;
A
b
%gauss-seidel method is performed here for the matrix A and b
[x,iterations,eq_val] = gauss_seidel(A,b,max_iter);
x
eq_val
m = 1:iterations;
figure(1);
plot(m,eq_val,':*b');
xlabel('Number of iterations');
ylabel('Eucliedan norm values');
title('Solution error vs iterations graph');
set(gca,'XTick',m);
grid on;