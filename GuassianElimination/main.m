%% performing residual correction to check if that improves the solution
clear all
close all
clc
%the dimension of the matrix(number of linear equations)
s = 10;
%the residual correction is checked only for the question '2b'
%for question '2a' error value is already less so no residual correction
%was needed
%%the matrix A is generated question 2b
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
%gaussian elimination with partial pivoting is performed
[A_res,b_res,x_res] = gaussian(A,B,s);
%initial value of solution vector x is stored in this variable
old_x = x_res;
% the initial vector of residuum is calculated
r_val = ((A_gen*x_res)-B_gen);
r_val;
%the intial euclidean norm(solution error) is calculated
eq_sum = 0;
for eq_var = 1:s
    eq_sum = (eq_sum + abs(r_val(eq_var))^2 );
end
eq_val = zeros(1,100);
eq_val(1) = sqrt(eq_sum);
%printing the initial values
fprintf("initial solution vector x\n");
disp(x_res);
fprintf("initial residual correction vector r\n");
disp(r_val);
fprintf("initial euclidean norm value\n")
disp(eq_val(1));
%setting minimum value to compare it with our solution error value at each
%iteration
min_val = 1000;
%residual iterative correction is performed
for r_iter = 1:99
    %with using same gaussian function we calculate new solution vector
    %with our residual vector on the right-hand side of our equation
    [A_res,b_res,delx_res] = gaussian(A,r_val,s);
    %we subtract our new x value from our old x value and use it to find
    %new residual correction vector
    new_x = old_x - delx_res;
    %new vector of residuum is calculated
    new_r_val = ((A_gen*new_x)-B_gen);
    r_val = new_r_val;
    old_x = new_x;
    %new euclidean norm(solution error) is calculated
    eq_sum = 0;
    for eq_var = 1:s
        eq_sum = (eq_sum + abs(new_r_val(eq_var))^2 );
    end
    eq_val(r_iter+1) = sqrt(eq_sum);
    %to check the minimum solutoin error value
    if eq_val(r_iter+1) < min_val
        min_val = eq_val(r_iter+1);
        pref_x = new_x;
        pref_r_val = new_r_val;
    end
end
eq_val;
%gets the minimum value of our solution error and at which iteration it %appears
[min_eq_val,min_iter_val] = min(eq_val);
disp("The minimum solution error after iterations")
disp(min_eq_val);
disp("At iteration");
disp(min_iter_val);
disp("preferable solution vector x")
disp(pref_x)
disp("residual vector of that solution vector")
disp(pref_r_val)
m = 1:100;
figure(1);
plot(m,eq_val,':*b');
xlabel('Number of iterations');
ylabel('Euclidean norm values');
title('Solution error vs iterations graph');
grid on;