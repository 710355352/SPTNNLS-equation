clear     % 清除工作区所有变量
close all     % 关闭所有图表
clc           % 清空命令行窗口

%p12 = p121

az = 70;%70%40
el = 40;%40%60;% 设置视角默认值
% az = 90;%70%40
% el = 90;%40%60;% 设置视角默认值

% 设置横纵坐标范围和精度
% a1 = -0.1;
% a2 = 0.7;
% b1 = 0.8;
% b2 = -0.45;c1 = 1*1e-3;

a1 = 20;
a2 = 20;
b1 = 20;
b2 = 20;
l = 1*1e-2;



rou =1;
Theta1 = 1/6;
theta1 =Theta1 * pi;
Theta2 = 1/3;
theta2 =Theta2 * pi;
x0 = 0;
k1 =  0;
k2 = 0;
theta3 = 1/3;
c1 = 1 * exp(theta3 * pi * 1i);
theta4 = 5/6;
c2 = 1 * exp(theta4 * pi * 1i);

MaxA11 = abs(sin(theta1) - cos(theta1)*tan(theta3*pi/2))
MaxA12 = abs(sin(theta1) + cos(theta1)*tan(theta3*pi/2))

MaxA21 = abs(sin(theta2) - cos(theta2)*tan(theta4*pi/2))
MaxA22 = abs(sin(theta2) + cos(theta2)*tan(theta4*pi/2))

x = -1*a1:l:a2;
t = -1*b1:l:b2;

[X,T] = meshgrid(x, t); % 将x, y横纵坐标向量转化为二维网格
[u] = Soliton1(X,T,rou,theta1,theta2,k1,k2,c1,c2,x0);
u1=abs(u);
umax = max(max(u1));
h1 = figure; % 画板
ax = axes;% 重命名坐标
surf(X,T,u1),
%  title(['\rho =',num2str(rou),',\theta =',num2str(Theta),',c=',num2str(c)])

% title('$\theta =\frac{\pi}{6}$','Interpreter','LaTex')
% colorbar()
shading interp;
xlabel('x');
ylabel('t');
zlabel('|u|');
view(az,el);
set(gca,'FontSize',25);   % 设置字体
colormap(jet); % 对比度增强
% ax.ZLim = [0  1.5];
ax.XLim = [-a1 a2];
ax.YLim = [-b1 b2];
% 设置横纵竖坐标刻度精度
%zticks([0 umax]);
%      zticks([c3 c2]);
xticks([-a1 0 a2]);
yticks([-b1 0 b2]);



% picname = ['two_soliton_(a,d)_f', '.png']; % 设计图片变量名
% saveas(gcf, picname);  % 保存图片到当前路径