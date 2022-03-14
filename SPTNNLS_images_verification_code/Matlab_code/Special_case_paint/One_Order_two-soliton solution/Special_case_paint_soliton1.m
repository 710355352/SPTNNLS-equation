clear     % 清除工作区所有变量
close all     % 关闭所有图表
clc           % 清空命令行窗口

%p12 = p121

% az = 70;%70%40
% el = 40;%40%60;% 设置视角默认值
az = 90;%70%40
el = 90;%40%60;% 设置视角默认值

% 设置横纵坐标范围和精度
% a1 = -0.1;
% a2 = 0.7;
% b1 = 0.8;
% b2 = -0.45;c1 = 1*1e-3;

a1 = 20;
a2 = 20;
b1 = 20;
b2 = 20;
c1 = 2*1e-2;



rou =1;
Theta = 1/3;
theta =Theta * pi;
x0 = -10* sqrt(3);
k = 10* sqrt(3);
theta0 = 1/2;
c = 1 * exp(theta0 * pi * 1i);

MaxA1 = abs(sin(theta) - cos(theta)*tan(theta0*pi/2))
MaxA2 = abs(sin(theta) + cos(theta)*tan(theta0*pi/2))

x = -1*a1:c1:a2;
t = -1*b1:c1:b2;

[X,T] = meshgrid(x, t); % 将x, y横纵坐标向量转化为二维网格
[u] = Soliton1(X,T,rou,theta,k,c,x0);
u1=abs(u);
umax = max(max(u1));
h1 = figure; % 画板
ax = axes;% 重命名坐标
surf(X,T,u1),
%  title(['\rho =',num2str(rou),',\theta =',num2str(Theta),',c=',num2str(c)])

% title('$\theta =\frac{\pi}{6}$','Interpreter','LaTex')

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