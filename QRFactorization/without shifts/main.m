%% QR method for finding eigenvalues without shifts
clear all
close all
clc
A = [4,3,3,10,3;3,5,8,7,9;3,8,1,7,1;10,7,7,7,9;3,9,1,9,1];
stop_val = 10e-6;
max_iter = 1000;
%eigenvaluse are found using QR method without shifts
[A_res,e_val,iterate_val] = QR_without_shifts(A,stop_val,max_iter);
fprintf("\n\n\n");
disp("final matrix");
A_res
fprintf("\n\n\n");
disp("eigenvalues of the final matrix");
e_val
disp("total number of iterations");
iterate_val