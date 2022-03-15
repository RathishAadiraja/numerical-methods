function sh = shift(A)
%gets the size of matrix A
n = size(A,1);
%the last 2x2 submatrix
SM = A(n-1:n,n-1:n);
%coefficient of the polynomial
a = 1;
b = -(SM(1,1)+SM(2,2));
c = det(SM);
%finding roots of the polynomial
x1 = -b + sqrt(b^2 - 4*a*c);
x2 = -b - sqrt(b^2 - 4*a*c);
%the greater value of these roots is picked and calculated normally and the
%other root is calculated from Viete's formula
if abs(x1) > abs(x2)
    numerator = x1;
else
    numerator = x2;
end
root1 = numerator/(2*a);
root2 = ((-b)/a)-root1;
%finding a better root value which is nearer to our last diagonal element
%of 2x2 submatrix
if abs(root1 - SM(2,2)) <= abs(root2-SM(2,2))
    sh = root1;
else
    sh = root2;
end
end
