function Xout = ptqj(alpha0)
% 输入alpha的值为弧度制
    %% 定义机构各结构参数
    R = 60;
    l = 100;
    r = 40;
    Xout = [60   -40    40;
            60     0    40;
            60     0   140;
            120    60   140;
            160    60    40;
            120    60    40;
            120    60   140;
            60   120   140;
            60   160    40;
            60   120    40;
            60   120   140;
             0    60   140;
           -40    60    40;
             0    60    40;
             0    60   140;
            60     0   140];
    alpha = [pi-alpha0,pi+alpha0];
    A = 2*r*(l+R*sin(alpha));
    B = 2*r*(r+R*(1+cos(alpha)));
    C = l^2-(r+R*(1+cos(alpha))).^2-r^2-(l+R*sin(alpha)).^2;
    beta = 2*atan((A-(A.^2+B.^2-C.^2).^0.5)./(B-C))% 此处为弧度
    % 点12
    Xout(2,2) = -r + r*cos(beta(1,1));
    Xout(2,3) =  r + r*sin(beta(1,1));
    % 点13
    Xout(3,2) = R*(1-cos(alpha0(1)));
    Xout(3,3) = (l+r)+R*sin(alpha0(1));
    % 点14
    Xout(4,1) = R+R*cos(alpha0(2));
    Xout(4,3) = (l+r)+R*sin(alpha0(2));
    % 点22
    Xout(6,1) = 2*R+r*(1-cos(beta(2)));
    Xout(6,3) = r+r*sin(beta(2));
    % 点23
    Xout(7,:) = Xout(4,:);
    % 点24
    Xout(8,2) = R*(1+cos(-alpha0(1)));
    Xout(8,3) = (l+r)+R*sin(-alpha0(1));
    % 点32
    Xout(10,2) = 2*R+r*(1-cos(beta(3)));
    Xout(10,3) = r+r*sin(beta(3));
    % 点33
    Xout(11,:) = Xout(8,:);
    % 点34
    Xout(12,1) = R-R*cos(alpha0(2));
    Xout(12,3) = (l+r)+R*sin(-alpha0(2));
    % 点42
    Xout(14,1) = -r + r*cos(beta(4));
    Xout(14,3) = r+r*sin(beta(4));
    % 点43
    Xout(15,:) = Xout(12,:);
    % 点44
    Xout(16,:) = Xout(3,:);
    
    
    
    
end