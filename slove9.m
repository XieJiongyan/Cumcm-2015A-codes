clear
L=[2.358693 2.31381 2.265955 2.230092 2.179309 2.143417...
    2.101569 2.065726 2.020915 1.976128 1.934338 1.907463...
    1.865672];
N=31+28+31+30+31+30+13;
delta=asin(0.39795*cos(0.98563*(N-173)*pi/180));
i=0;
j=0;
t0=(8+57/60):(3/60):(9+33/60);
gamma0=120;
L0=2;
for gamma=104.65:0.1:114.65
    t=t0+(gamma-gamma0)/15;
    td=(t-12).*pi./12;
    for fai=-90:0.1:90
        Li=L0./tan(asin(sin(fai*pi/180)*sin(delta)+...
            cos(fai*pi/180)*cos(delta).*cos(td)));
        dL=mean(abs(Li-L));
        if dL<0.004
            i=i+1;
            point(i,:)=[L0 gamma fai dL];
        end
    end
end