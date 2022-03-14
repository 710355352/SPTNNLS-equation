clear     % 清除工作区所有变量
close all     % 关闭所有图表
clc           % 清空命令行窗口

%p12 = p121

az = 70;%70%40
el = 40;%40%60;% 设置视角默认值
% 设置横纵坐标范围和精度
% a1 = -0.1;
% a2 = 0.7;
% b1 = 0.8;
% b2 = -0.45;c1 = 1*1e-3;

a1 = 30;
a2 = 30;
b1 = 30;
b2 = 30;c1 = 5*1e-2;



rou =1;
theta = pi/6;
x0 = 1;
k = 3;
c = 1;


x = -1*a1:c1:a2;   
t = -1*b1:c1:b2;

[X,T] = meshgrid(x, t); % 将x, y横纵坐标向量转化为二维网格
[u] = u_NN1(X,T,rou,theta,k,c,x0);
u1=abs(u);
umax = max(max(u1));
 h1 = figure; % 画板
 ax = axes;% 重命名坐标
 surf(X,T,u1),
 title(['\rho =',num2str(rou),',\theta =',num2str(theta),',c=',num2str(c)])
 shading interp;
 xlabel('x');
 ylabel('t');
 zlabel('|u|'); 
    view(az,el);
    set(gca,'FontSize',25);   % 设置字体
    colormap(jet); % 对比度增强
%     ax.ZLim = [c3  c2];
    ax.XLim = [-a1 a2];
    ax.YLim = [-b1 b2];
    % 设置横纵竖坐标刻度精度
     %zticks([0 umax]);
%      zticks([c3 c2]); 
     xticks([-a1 0 a2]);
     yticks([-b1 0 b2]);