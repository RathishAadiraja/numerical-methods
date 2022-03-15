function [x1_res,x2_res] = RK4(func_1,func_2,h,x1_init,x2_init,max_iter)
f1 = func_1;
f2 = func_2;
% initialization of x1 and x2
x1 = zeros(1,max_iter+1);
x2 = zeros(1,max_iter+1);
% initial values
x1(1) = x1_init;
x2(1) = x2_init;
for i = 1:max_iter
    % RK4 algorithm
    k11 = f1(x1(i),x2(i));
    k12 = f2(x1(i),x2(i));
    k21 = f1(x1(i) + (h/2)*k11, x2(i) + (h/2)*k12);
    k22 = f2(x1(i) + (h/2)*k11, x2(i) + (h/2)*k12);
    k31 = f1(x1(i) + (h/2)*k21, x2(i) + (h/2)*k22);
    k32 = f2(x1(i) + (h/2)*k21, x2(i) + (h/2)*k22);
    k41 = f1(x1(i) + h*k31, x2(i) + h*k32);
    k42 = f2(x1(i) + h*k31, x2(i) + h*k32);
    x1(i+1) = x1(i) + (h/6)*(k11 + 2*k21 + 2*k31 + k41);
    x2(i+1) = x2(i) + (h/6)*(k12 + 2*k22 + 2*k32 + k42);
end
x1_res = x1;
x2_res = x2;
end
