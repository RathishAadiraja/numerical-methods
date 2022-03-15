function [Q,R] = qr_fac(A)
%setting all the initial values
n = size(A,1);
Q = A;
a = zeros(n,n);
R = zeros(n,n);
for c = 1:n
    %the diagonal elements of matrix R is set to 1 in each iteration
    R(c,c) = 1;
    %using Gram Schmidt algorithm, the columns of matrix Q is factorized
    %the summation is calculated separately
    q_sum = 0;
    for i = 1:c-1
        q_sum = q_sum + ((((a(:,i).')*Q(:,c))/((a(:,i).')*a(:,i)))*a(:,i));
    end
    Q(:,c) = Q(:,c) - q_sum;
    %the vector 'a' gets the value of each column of Q in each iteration
    a(:,c) = Q(:,c);
    %using Gram Schmidt algorithm, the matrix R is factorized
    for j = c+1:n
        R(c,j) = ((a(:,c).')*A(:,j))/((a(:,c).')*a(:,c));
    end
end
%the matrices Q and R are normalized
for j = 1:n
    norm_val = norm(Q(:,j));
    Q(:,j) = Q(:,j)/norm_val;
    R(j,j:n) = R(j,j:n)*norm_val;
end
end