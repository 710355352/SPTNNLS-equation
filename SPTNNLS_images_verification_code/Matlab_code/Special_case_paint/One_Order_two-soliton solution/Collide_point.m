hold on
view(90,90);
xb = x0/2;
XB = xb * ones(1,length(x));
tb = (1/2).*rou.^(-2).*csc(2.*theta).*((-1).*rou.*(2.* ...
  k+x0).*cos(theta)+log(2.*rou.*abs(c).*cos(theta))) 
TB = tb * ones(1,length(t));

xa = x0/2;
XA = xa * ones(1,length(x));
ta = (1/2).*rou.^(-2).*csc(2.*theta).*((-1).*rou.*(2.* ...
  k+x0).*cos(theta)+log(2.*rou.*abs(c).*cos(theta).* ...
  sin(theta).^2))
TA = ta * ones(1,length(t));

p = max(MaxA1,MaxA2);


hold on 
plot3(x, TA, p*ones(1,length(x)), 'k--', 'LineWidth',2)
hold on
plot3( XA, t,p*ones(1,length(x)), 'k--','LineWidth',2)
hold on
plot3(x, TB, p*ones(1,length(x)), 'r', 'LineWidth',2)
hold on
plot3( XB, t,p*ones(1,length(x)), 'r','LineWidth',2)