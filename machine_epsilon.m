%% machine epsilon
clear all
close all
clc
x = 1.0;
new_x = 1.0 + x;
while new_x > 1.0
% we store our old value of x in mach_eps
mach_eps = x;
% we check for this condition; in each loop the x value gets smaller
x = x/2;
% we add our x to 1.0 in this step to check if it is greater than 1.0
new_x = 1.0 + x;
% the loop terminates when the x value is really small, less than
% (10e-16) so that if we add it to our new_x we get value 1.0
end
mach_eps