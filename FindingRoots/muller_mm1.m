%% Mullers MM1
clear
clc
%our function f(x)
f = @(x) 1*x^4 + 0.9*x^3 - 6*x^2 + 3*x - 1;
%setting three initial points
x0 = 100;
x1 = 50;
x2 = 2;
for i = 1:15
    %finding differences
    z0 = x0-x2;
    z1 = x1-x2;
    %value of function at point x2
    c = f(x2);
    %assigning system of linear quadratic equation to a matrix
    z_mat = [z0^2, z0; z1^2 , z1];
    f_mat = [f(x0)-c ; f(x1)-c];
    %finding coefficients of the root
    sol = linsolve(z_mat,f_mat);
    a = sol(1);
    b = sol(2);
    %using those coefficients to find roots
    if abs((b+sqrt(b^2-4*a*c))) >= abs((b-sqrt(b^2-4*a*c)))
        z_min = (-2*c)/(b+sqrt(b^2-4*a*c));
    else
        z_min = (-2*c)/(b-sqrt(b^2-4*a*c));
    end
    %the root which is nearer to the approximation is taken for next
    %iteration
    x3 = x2 + z_min;
    %our initial x values in a vector
    x_vals = [x0,x1,x2];
    %finding the distance between our initial x values and the new x value
    my_vals = [abs(x3-x0),abs(x3-x1),abs(x3-x2)];
    %getting the two nearest points
    [sor_vals,sor_index] = sort(my_vals,'ascend');
    %setting values for nex iteration
    x0 = x_vals(sor_index(2))
    x1 = x_vals(sor_index(1))
    x2 = x3
end