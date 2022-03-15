%%
A = [12, 34, 67; 23, 54, 90; 12, 64, 78];
b = [785;34;44];
x = [53;50;44];
y = [47.91631596;21.67845581;-25.441243120];
c = 30;
f = @(x) c + (transpose(b)*x) + ((transpose(x)*A)*x);
fdx = @(x)  b + (2*A*x);
fddx = @(x) 2*A; 

g = @(x) c + (transpose(b)*x) + ((transpose(x)*A)*x);
gdx = @(x)  ((A+transpose(A))*x)+b;
gddx = @(x) A+transpose(A); 

%%
a = 24;
b = 42;
c = 15;
d = 6;
f = @(x)  a*x^3 + b*x^2 + c*x + d;
fdx = @(x) 3*a*x^2 + 2*b*x + c;
fddx = @ (x) 6*a*x + 2*b;

%setting maximum iteration
max_iter = 10;
%setting initial point
x0 = 0.2;
i = 1;
while i <= max_iter
    %newton method algorithm
    fdx(x0)
    fddx(x0)
    x1 = x0-(fdx(x0)/fddx(x0))
    x0 = x1;
    i = i+1
end
%%

z = peaks(25);

figure
surf(z)
%%

x = linspace(-100,100,100);
y = linspace(-100,100,100);
z = linspace(-100,100,100);
vec = [x;y;z];
b = [29;51;31];
A = [42,60,90;15,6,52;77,82,46];
c = 10;
q = c + transpose(b)*vec + transpose(vec)*A*vec

surf(x,y,q)
