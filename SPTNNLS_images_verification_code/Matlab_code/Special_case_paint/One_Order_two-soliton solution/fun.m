
function Y = fun(X)
% dL=0.02;
% X = -6:dL:6;
syms y 
Y = zeros(length(X),1);
% loss = Y;
for k=1:length(X)
    x = X(k);
    equ = x+y-log(x^2+y^2+1) == 0;
    Y(k) = vpasolve(equ,y);
%     Y(k)
%     loss(k) = X(k) + Y(k) - log(X(k)^2+Y(k)^2+1);
%     loss(k)
end

% figure(1),
% plot(X,Y)
% 
% figure(2),
% plot(X,abs(loss))
