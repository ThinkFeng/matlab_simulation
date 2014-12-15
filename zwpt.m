clear all
%clc
% �������
% ��ƽ̨�뾶��R
% ���˳��ȣ�l
% ����ۣ�r
% ƽ̨ת�ǣ�alpha
tic
R = 60;
l = 100;
r = 40;
alpha0 = 149;
alpha = [alpha0/180*pi,-alpha0/180*pi];
A = 2*r*(l+R*sin(alpha));
B = 2*r*(r+R*(1+cos(alpha)));
C = l^2-(r+R*(1+cos(alpha))).^2-r^2-(l+R*sin(alpha)).^2;
beta = 2*atan((A-(A.^2+B.^2-C.^2).^0.5)./(B-C))*180/pi
toc