function dy = ode_func(t,y)
dy = zeros(2,1);
dy(1) = y(2)+y(1)*(0.5-y(1)*y(1)-y(2)*y(2));
dy(2) = -y(1)+y(2)*(0.5-y(1)*y(1)-y(2)*y(2));
end
