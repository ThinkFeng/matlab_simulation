function pingtai
clf
shg
set(gcf,'doublebuf','on','color','w','name','自稳平台拓扑机构','numbertitle','off')
set(gca,'pos',get(gca,'pos')+[0 .07 0 0])
%% 关节点的数据由上到下，由里到外分别保存在X Y Z中
load pingtai
L = {[1 2 3 4],[5 6 7 8],[9 10 11 12],[13 14 15 16]};
for k = 1:4
   p(k) = line(X(L{k},1),X(L{k},2),X(L{k},3),'marker','o', ...
      'markersize',10,'linewidth',1.5,'linestyle','-','erasemode','background');
end
axis([-45 200 -45 200 -5 200])
set(gca,'xtick',[],'ytick',[],'ztick',[])       % 清除坐标轴刻度
view(67.5,20)                                   % 此处数值为角度值
labels = {'Rotating around X axis','Rotating around Y axis'};
for j = 1:2
   smin = -30; start = 0; smax = 30;
   txt = uicontrol('style','text','string',sprintf('%4.2f',start), ...
      'back','w','units','norm','pos',[.5*j-.3 .11 .08 .03]);
   sliders(j) = uicontrol('style','slider','units','norm','back','w', ...
      'pos',[.5*j-.45 .07 .4 .03],'min',smin,'max',smax,'val',start, ...
      'sliderstep',[1/(0.5*smax),1/(smax)],'userdata',txt,'callback',...
      'set(get(gco,''userd''),''str'',sprintf(''%4.2f'',get(gco,''val'')))');
   uicontrol('style','text','string',labels{j},'back','w', ...
      'units','norm','pos',[.5*j-.45 .02 .4 .04])
end
cameratoolbar
stop = uicontrol('style','toggle','units','norm','pos',[.91 .94 .08 .05], ...
   'backgr','w','fontw','bold','string','stop');
uicontrol('style','text','units','norm','pos',[.00 .92 .25 .06], ...
   'backgr','w','fontangle','italic','string', ...
   {'Change the view','with the mouse'})
s0 = [0;0];
while get(stop,'value') == 0
   s = cell2mat(get(sliders,'value'));
   if s0(1) ~= s(1) || s0(2) ~= s(2),
       alpha0 = s/180*pi;
       X = ptqj(alpha0);
   end
   s0 = s;
   for k = 1:4
      set(p(k),'xdata',X(L{k},1),'ydata',X(L{k},2),'zdata',X(L{k},3))
   end
   pause(0.01)
end
cameratoolbar close
set(stop,'val',0,'str','close','fontw','bold','callb','close(gcf)')
