clear
q2_x = [1.0365 1.0699 1.1038 1.1383 1.1732...
    1.2087 1.2448 1.2815 1.3189 1.3568 1.3955...
    1.4349 1.4751 1.516 1.5577 1.6003 1.6438...
    1.6882 1.7337 1.7801 1.8277 ];
q2_y = [0.4973 0.5029 0.5085 0.5142 0.5198...
    0.5255 0.5311 0.5368 0.5426 0.5483 0.5541...
    0.5598 0.5657 0.5715 0.5774 0.5833 0.5892...
    0.5952 0.6013 0.6074 0.6135 ];
L=(sqrt(q2_x.^2+q2_y.^2))';
As0=(atan(q2_y./q2_x))';
dAs0=abs(As0(1)-As0(end));
N=31+28+31+18;
delta=asin(0.39795*cos(0.98563*(N ...
    -173)*pi/180)); %计算赤纬角
i=0;
t0=(14+42/60):(3/60):(15+42/60);
gamma0=120;
for L0=1.5:0.1:3 %进行遍历搜索÷
    for gamma=-180:0.01:180
        t=t0+(gamma-gamma0)/15;
        td=(t-12).*pi./12; %计算时角
        for fai=-90:0.01:90
            Li=L0./tan(asin(sin(fai*...
                pi/180)*sin(delta)+cos(fai*pi/180)...
                *cos(delta).*cos(td)));
            dL=mean(abs(Li-L)); %计算影长误差
            if dL<0.0013
                t1=(14+42/60)+(gamma-gamma0)/15;
                t2=(15+42/60)+(gamma-gamma0)/15;
                td1=(t1-12).*pi./12;
                td2=(t2-12).*pi./12;
                h1=asin(sin(fai*pi/180)*sin(...
                    delta)+cos(fai*pi/180)*cos(delta).* ...
                    cos(td1));
                h2=asin(sin(fai*pi/180)*sin(delta)+...
                    cos(fai*pi/180)*cos(delta).*cos(td2));
                As1=acos((sin(fai*pi/180)*sin(h1)-...
                    sin(delta))/cos(h1)/cos(fai*pi/180));
                As2=acos((sin(fai*pi/180)*sin(h2)...
                    -sin(delta))/cos(h2)/cos(fai*pi/180));
                dAs=abs(As1-As2); %计算太阳方位角变化量
                if (dAs-dAs0)/dAs0<0.0013
                    i=i+1;
                    point(i,:)=[L0 gamma fai];
                end
            end
        end
    end
end