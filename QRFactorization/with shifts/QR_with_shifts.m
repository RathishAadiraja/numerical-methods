function [A_res,e_val,iterate_val] = QR_with_shifts(A,stop_val,max_iter)
%gets the size of the matrix A
n = size(A,1);
%gets the value of matrix A
B = A;
iterations = 0;
for i = n:-1:2
    I = eye(i);
    j = 0;
    while j < max_iter
        %this variable gets the better root value of the plynomial of
        %last 2x2 submatrix
        shift_val = shift(B);
        %steps done according to the algorithm
        M = B - (I*shift_val);
        [Q,R] = qr_fac(M);
        B = (R*Q)+(I*shift_val);
        j = j+1;
        %checks with the stop value and if the condition is met the loop
        %terminates
        if max(abs(B(i,1:i-1))) < stop_val
            break;
        end
    end
    iterations = iterations + j;
    %eigenvalues are stored in this variable
    e_val(i) = B(i,i);
    if i > 2
        %The matrix is deflated in each iteration
        B = B(1:i-1,1:i-1);
    else
        %in the final loop the final eigenvalue is directly taken from our
        %matrix B(1,1)
        e_val(1) = B(1,1);
    end
end
%the result matrix
A_res = B;
%total number of iterations performed
iterate_val = iterations;
end

