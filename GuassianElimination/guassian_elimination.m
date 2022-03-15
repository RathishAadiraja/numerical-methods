%% Solving system of n linear equations by using Gaussian elimination with partial pivoting
clear all
close all
clc
%total number of matrices to be checked
t_val = 9;
%this variable has dimensions of all matrices used(number of linear equations)
n = zeros(1,t_val);
%starting the dimension of the matrix(number of linear equations)
%from n = 10,20,40....
n_val = 10;
%to generate the dimensions of the needed matrices(number of linear equations)
for i = 1:t_val
    n(i) = n_val;
    n_val = n_val*2;
end
%creating zeros of Euclidean norm vector
eq_val = zeros(1,t_val);
for j = 1:t_val
    %the variable s gets the value of the dimension of the matrix ie)
    %number of linear equations to be solved
    s = n(j);
    %--------------------------------------------------------------------------
    %please comment/uncomment this below part of code for question 2a
    %----------------------------------------------------------------
    % %the matrix A is generated question 2a
    % A = zeros(s);
    % for c = 1:s
    % for r = 1:s
    %
    % if r == c
    % A(r,c) = 9;
    % elseif (r == c - 1) || (r == c + 1)
    % A(r,c) = 3;
    % else
    % A(r,c) = 0;
    %
    % end
    % end
    % end
    %
    % A_gen = A;
    % A;
    %
    % %the vector B is generated question 2a
    % B = zeros(s,1);
    % for k = 1:s
    % B(k,1) = 1.5+(0.5*k);
    %
    % end
    %
    % B_gen = B;
    % B;
    %--------------------------end of ques 2a----------------------------------
    %--------------------------------------------------------------------------
    %please comment/uncomment this below part of code for question 2b
    %----------------------------------------------------------------
    %the matrix A is generated question 2b
    A = zeros(s);
    for c = 1:s
        for r = 1:s
            A(r,c) = 2/(3*(r+c-1));
        end
    end
    A_gen = A;
    A;
    %the vector B is generated question 2b
    B = zeros(s,1);
    for k = 1:s
        if mod(k,2) == 1
            B(k,1) = 0;
        elseif mod(k,2) == 0
            B(k,1) = 1/k;
        end
    end
    B_gen = B;
    B;
    %--------------------------end of ques 2b----------------------------------
    %--------------------------------------------------------------------------
    %performing gaussian elimination with partial pivoting, where s is %dimension of the matrix
    [A_res,b_res,x_res] = gaussian(A,B,s);
    %solution vector x
    x_res;
    %the vector of residuum is calculated
    r_val = ((A_gen*x_res)-B_gen);
    r_val;
    if s == 10
        disp("printing the solution vector for 10x10 matrix");
        x_res
        disp("printing the solution errors");
        r_val
    end
    %the Euclidean norm(solution error) is calculated
    eq_sum = 0;
    for eq_var = 1:s
        eq_sum = (eq_sum + abs(r_val(eq_var))^2 );
    end
    eq_val(j) = sqrt(eq_sum);
end
disp("printing euclidean norm values of solution error of matrices from dimension 10,20,40...");
n
eq_val
m = 1:t_val;
figure(1);
plot(m,eq_val,':*b');
xlabel('Number of iterations');
ylabel('Euclidean norm values');
title('Solution error vs iterations graph');
grid on;