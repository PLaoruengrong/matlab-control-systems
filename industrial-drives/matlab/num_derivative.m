function y = num_derivative(u,T)
    
    y=zeros(size(u));
    y(2:end)=(u(2:end)-u(1:end-1))/T

end