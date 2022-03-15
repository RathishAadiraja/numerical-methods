function [A_res,b_res,x_res] = gaussian(A,b,s)
%variables to switch rows of matrix A and B according to the method
s_row = s;
s_col = s;
%this variable is to make method start checking from the k'th row k'th
%column(from the diagonal element)
G_row = 1;
for c = 1:s_col-1
    %to check in the given matrix from the kth row kth column if any of
    %the column elements are greater than the kth row element
    value = 0;
    for r = G_row:s_row
        if abs(A(r,c)) > value
            value = abs(A(r,c));
            row = r;
        end
    end
    %the varaiable is incremented after checking all elements in the column
    %so it will ckeck k+1 row and k+1 column in next iteration
    G_row = G_row + 1;
    %if the swapping is needed the rows are swapped
    if value ~= 0
        if row ~= c
            temp_A = A(row,:);
            A(row,:) = A(c,:);
            A(c,:) = temp_A;
            temp_b = b(row);
            b(row) = b(c);
            b(c) = temp_b;
        end
    end
    %Gaussian elimination of lower triangle of the matrix
    for r2 = G_row:s_row
        div = A(r2,c)/A(G_row-1,c);
        A(r2,:) = A(r2,:)-(div*A(G_row-1,:));
        b(r2) = b(r2)-(div*b(G_row-1));
    end
    %the result matrices are stored in these variables
    A_res = A;
    b_res = b;
    %setting initial values of solution vector x to zeros
    x = zeros(s,1);
    %we start backward substitution from the last element
    x(s) = b(s)/A(s,s);
    %the solution vector x is calculated using backward substitution
    for bs_row = (s-1):-1:1
        sum = A(bs_row,:)*x;
        x(bs_row) = (b(bs_row)-sum)/A(bs_row,bs_row);
    end
    %the solution vector x is stored in this variable
    x_res = x;
end
