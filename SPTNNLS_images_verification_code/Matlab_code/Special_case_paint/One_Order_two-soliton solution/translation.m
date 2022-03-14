view(90,90);
% colorbar()




xy = 0;
XY = xy * ones(1,length(x));
% tb = (1/2).*rou.^(-2).*csc(2.*theta).*((-1).*rou.*(2.* ...
%   k+x0).*cos(theta)+log(2.*rou.*abs(c).*cos(theta))) ;
% ta = (1/2).*rou.^(-2).*csc(2.*theta).*((-1).*rou.*(2.* ...
%   k+x0).*cos(theta)+log(2.*rou.*abs(c).*cos(theta).* ...
%   sin(theta).^2));

ty =0;

TY = ty * ones(1,length(t));

p = max(MaxA1,MaxA2);

if p<=1
    p=1.2;
end

hold on 
plot3(x, TY, p*ones(1,length(x)), 'k', 'LineWidth',2)
hold on
plot3( XY, t,p*ones(1,length(x)), 'k','LineWidth',2)


picname = ['two_soliton_(d,a)_f_x0_10g3_k_10g3', '.png']; % 设计图片变量名
saveas(gcf, picname);  % 保存图片到当前路径