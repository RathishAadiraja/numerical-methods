function [new_mat] = poly_func(a,x)
row_max_2 = size(x,1);
col_max_2= size(a,1);
new_mat = zeros(row_max_2,1);
for i = 1: row_max_2
    for j = 1:col_max_2
        new_mat(i) = new_mat(i) + a(j) * x(i)^(j-1);
    end
end
end

