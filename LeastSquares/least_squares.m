%% Least squares approximation
clc
clear
close all;
% given values
x = [-5; -4; -3; -2; -1; 0; 1; 2; 3; 4; 5] ;
y = [24.6523; 13.1631; 5.6428; 2.3010; -0.4826; -0.0630; 1.1643; -0.1156; -2.2584; -7.2294; -17.2654];
% maximum order of the polynomial
order = 12;
row_max = size(x,1);
sol_err = zeros(1,order);
err_val = zeros(1,order);
cond_num = zeros(1,order);
for col_max = 1:order
    % matrix A is generated
    for i = 1:row_max
        for j = 1:col_max
            A(i,j) = x(i,1)^(j-1);
        end
    end
    A;
    % matrix A is decomposed to Q and R using qr factorization
    [Q,R] = qr(A);
    a = R\Q'*y;
    sol_err(col_max) = norm(R*a-Q'*y);
    % residual vector
    vec_residuum = ((A'*A*a)-(A'*y));
    err_val(col_max) = norm(vec_residuum);
    cond_num(col_max) = cond(A);
    approx_func_x = -5:0.1:5;
    approx_func_x = approx_func_x';
    % values of polynoimal with the coefficients
    z = poly_func(a,approx_func_x);
    figure(col_max);
    scatter(x,y);
    xlabel('x');
    ylabel('y');
    hold on;
    plot(approx_func_x,z);
    hold off;
end
sol_err = sol_err';
disp("sol_err");
disp(sol_err);
err_val = err_val';
disp("err_val");
disp(err_val);
cond_num = cond_num';
disp("cond_num");
disp(cond_num);