clear     % 清除工作区所有变量
close all     % 关闭所有图表
clc           % 清空命令行窗口


par = 0;% 设置参数默认值
az = 0;
el = 90;% 设置视角默认值
% 设置横纵坐标范围和精度
a1 = 30;
b1 = 30;
b2 = 30;
c1 =5*1e-2;
x = -a1:c1:a1;   
t = -b1:c1:b2;
% 进入画图主循环
% 对时间t调参
Time=linspace(-3,3,61);
% Time=-0.00000; 
dell = [];

rou =1;
theta = pi/6;
% x0 = 1;
k = 3;
c = 1;

for i= 1:length(Time)
  x0=Time(i);
%   if par == 0
%       continue
%   end
  [X,T] = meshgrid(x, t); % 将x, y横纵坐标向量转化为二维网格
    [u]=u_NN1(X,T,rou,theta,k,c,x0);
      
   % subplot(1, length(ALPHA), i);% 利用subplot函数输出图片群空白画布，subplot(a1,b1,c1)
                        % a1:图片群行数，b1:图片群列数，c1:当前图片序数（优先画满整行）
 u1=abs(u);
 umax = max(max(u1));
 umin = min(min(u1));
   if isinf(umax) || isnan(umax) || abs(umax)>20 || abs(umin) >20
       dell = [dell i];
       continue
   end
 h1 = figure; % 画板
 ax = axes;% 重命名坐标
 surf(X,T,u1),
 shading interp;
 xlabel('x');
 ylabel('t');
 zlabel('|u|'); 
% title(sprintf('\alpha=%.4f',Time(i)));% 设置横纵竖坐标标题 % 画3D图片
   title( ['x0',sprintf('=%.4f',Time(i)) ] );
    % title(sprintf('t = 0'));    % 设置图片标题，以下为几种样例，可根据需求修改
    % title(sprintf('Alpha = % .1f '));
    % title({sprintf('N=1,ni=1, rational, t=% .2f ',t);sprintf('(a=% .2f, c11=% .2f, p1=% .2f, q1=% .2f, a1=% .2f, b1=% .2f)',a,c11,p1,q1,a1,b1)});
    %     view(10,45);  % 设置视角
    view(az,el);
    set(gca,'FontSize',25);   % 设置字体
    colormap(jet); % 对比度增强
    % 设置横纵竖坐标范围
    ax.ZLim = [0 umax];
    ax.XLim = [-a1 a1];
    ax.YLim = [-b1 b2];
    
    % 设置横纵竖坐标刻度精度
     zticks([0 umax]);     
     xticks([-a1 0 a1]);
     yticks([-b1 0 b2]);
    
picname = ['fc211=1',num2str(i), '.png']; % 设计图片变量名
saveas(gcf, picname);  % 保存图片到当前路径
close all
end

index = 1:length(Time);
for k=1:length(dell)
    index(index==dell(k))=[];
end
% 画gif图
tt = 12/length(index);
for i=index
% for i=index
%     if Time(i) == 0
%         continue
%     end
    picname=['fc211=1',num2str(i),'.png'];
    GifName='fc211=1.gif'; 

% 保存成名为onesoliton_i.gif的动图
%     open(picname);
    imshow(picname)
    %set(gcf,'outerposition',get(0,'screensize'));% matlab窗口最大化
    frame=getframe(gcf);  
    im=frame2im(frame);% 制作gif文件，图像必须是index索引图像  
    [I,map]=rgb2ind(im,256);
    if i==index(1)
        imwrite(I,map,GifName,'gif','Loopcount',inf,'DelayTime',tt);% 第一次必须创建！
    elseif i==index(end)
        imwrite(I,map,GifName,'gif','WriteMode','append','DelayTime',tt);
    else
        imwrite(I,map,GifName,'gif','WriteMode','append','DelayTime',tt);
    end
    close all
end