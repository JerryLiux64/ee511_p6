alpha=0.5;
beta=0.75;
gamma=1;
delta=0;
samnum=1000;
a=stbsample(alpha,beta,gamma,delta,samnum);%Samples
b=stblrnd(alpha,beta,gamma,delta,samnum,1);%Theorical
figure(1);
histogram(a);
hold on;
h.FaceColor = [0 0.5 0.5];
histogram(b);
xlabel('Sample and Theorical Distirbtion');ylabel('Probability*1000');title('Pdf of A and sample distribution of Alpha=0.5, Beta=0.75, Gamma=1, Delta=0');
legend('Sample distribution','Theorical distribution');
hold off;
figure(2);
plot(a);
hold on;
plot(b,'r--');
xlabel('Sample number');ylabel('Value');title('Time plot of A and sample distribution of Alpha=0.5, Beta=0.75, Gamma=1, Delta=0');
legend('Sample distribution','Theorical value');
hold off;