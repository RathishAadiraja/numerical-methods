function [A_res,e_val,iterate_val] = QR_without_shifts(A,stop_val,max_iter)
i = 1;
%performing QR method for finding eigenvalues without shifting
while i <= max_iter
%steps done according to the algorithm
[Q,R] = qr_fac(A);
A = R*Q;
%assigning solution matrix value to C
C = A;
%making diagonal of matrix C to zeros because we need to check all the
%elements in our solution matrix except our diagonal elements
C(1:1+size(C,1):end) = 0;
%finding the maximum value in the matrix C
max_val = max(max(C));
%checks maximum value of matrix C if it is less than stop_value the
%while loop terminates
if max_val < stop_val
fprintf("condition met at %dth iteration\n",i);
break;
end
i = i+1;
end
%final matrix after solving
A_res = A;
%eigenvalues of the matrix
e_val = diag(A);
%total number of iterations
iterate_val = i;
end

