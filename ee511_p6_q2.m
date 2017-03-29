%getting c
pdffx=@(x) 32/(945*sqrt(pi)).*x.^(4.5).*exp(-x);%f(x)
pdffy=@(y) 2/11*exp(-2*y/11);%g(x)
t=0:0.01:20;
c=max(pdffx(t)./pdffy(t));%c=max(f(x)/g(x))
samnum=100;%sample number
z=[];count=0;
%sampling using accept-reject
for i=1:samnum
    while 1
        count=count+1;
        r=exprnd(5.5);
        if (c*pdffy(r)*rand()<=pdffx(r)) 
            z(i)=r;
            break;
        end
    end
end
hist(z);hold on;
x=gaminv(0.005:0.001:0.995,5.5,1); %generating theoretical pdf
y=gampdf(x,5.5,1);
plot(x,y*samnum,'r--','linewidth',3);
hold off;
xlabel('x');ylabel('Probability*1M');title('Pdf of Gamma and sample distribution');
legend('Sample distribution','Pdf of Gamma');
disp('Acceptance rate:');
disp(samnum/count);
