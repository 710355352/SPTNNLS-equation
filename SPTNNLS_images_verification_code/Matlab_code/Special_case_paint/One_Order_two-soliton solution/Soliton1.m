function u = Soliton1(x,t,rho,theta,k,c,x0)
absc = abs(c);
cc= conj(c);
 u = exp(1).^((sqrt(-1)*2).*rho.^2.*t).*rho.*(1+absc.^(-2).*exp(1).^(2.*rho.*cos(theta).*(k+x+2.*rho.*t.*sin(theta))+2.*rho.*cos(theta).*(k+(-1).*x+x0+2.* ...
  rho.*t.*sin(theta))).*rho.^(-2).*csc(2.*theta).^2+(1/2).*c.^(-1).*exp(1).^(2.*rho.*cos(theta).*(k+x+2.*rho.*t.*sin(theta))).*rho.^(-1).*sec(theta)+( ...
  1/2).*cc.^(-1).*exp(1).^(2.*rho.*cos(theta).*(k+(-1).*x+x0+2.*rho.*t.*sin(theta))).*rho.^(-1).*sec(theta)).^(-1).*(1+absc.^(-2).*exp(1).^((sqrt(-1)*4) ...
  .*theta+2.*rho.*cos(theta).*(k+x+2.*rho.*t.*sin(theta))+2.*rho.*cos(theta).*(k+(-1).*x+x0+2.*rho.*t.*sin(theta))).*rho.^(-2).*csc(2.*theta).^2+(-1/2) ...
  .*c.^(-1).*exp(1).^((sqrt(-1)*2).*theta+2.*rho.*cos(theta).*(k+x+2.*rho.*t.*sin(theta))).*rho.^(-1).*sec(theta)+(-1/2).*cc.^(-1).*exp(1).^((sqrt(-1)* ...
  2).*theta+2.*rho.*cos(theta).*(k+(-1).*x+x0+2.*rho.*t.*sin(theta))).*rho.^(-1).*sec(theta));