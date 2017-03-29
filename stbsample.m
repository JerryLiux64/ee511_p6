function r=stbsample(alpha,beta,gamma,delta,samnum)
r=[];
B=atan(beta*tan(pi*alpha/2))/alpha;
S=(1+beta^2*(tan(pi*alpha/2))^2)^(1/(2*alpha));
for i=1:samnum
    V=pi*rand()-(pi/2);
    W=exprnd(1);
    if alpha==1
        r(i)=(2/pi)*((0.5*pi+beta*V)*tan(V)-beta*log(W*cos(V)/(0.5*pi+beta*V)));
    else
        r(i)=S*(sin(alpha*(V+B))/((cos(V))^(1/alpha)))*(cos(V-alpha*(V+B))/W)^((1-alpha)/alpha);
    end
end

if alpha==1
    r=gamma*r+delta;
else
    r=gamma*r+(pi/2)*beta*gamma*log(gamma)+delta;
end
end