function [x,iterations,eq_val] = gauss_seidel(A,b,max_iter)
%gets the size of vector b
s = size(b,1);
%first we decompose our matrix A into three matrices as D(diagonal matrix),
%L(lower triangular matrix), U(upper triangular matrix)
%diagonal matrix with only diagonal values of matrix A
d = diag(A);
D = diag(d);
%upper and lower triangular matrices of matrix A
L = zeros(s);
U = zeros(s);
for i = 2:s
    L(i,1:(i-1)) = A(i,1:(i-1));
    U((i-1),i:s) = A((i-1),i:s);
end
%first we set solution vector to zeros
x = zeros(s,1);
%inverse of the diagonal+lower triangular matrix as per our algorithm
inver = inv(D+L);
n = 1;
while n < max_iter
    %the iterative method(Gauss-seidel) used to calculate solution vector x
    x1 = (-inver*U*x) + (inver*b);
    x = x1;
    %the vector of residuum is calculated for each iteration
    r = ((A*x)-b);
    %Euclidean norm(solution error) is calculated
    eq_sum = 0;
    for eq_var = 1:s
        eq_sum = (eq_sum + abs(r(eq_var))^2 );
    end
    %Euclidean norm values stored for each iteration
    eq_val(n) = sqrt(eq_sum);
    %the norm value is checked if it is less than our assumed accuracy of
    %10e-10 if so the while loop terminates
    if eq_val(n) < 10e-10
        fprintf("conditoin met at %dth iteration.\n",n);
        break;
    end
    n = n+1;
 end
%solution vector x
x = x1;
%total number of iterations done using this method
iterations = n;
end

