tic;% Start the timer
clear all; close all; clc;

M1 = 1; % Mean of X
M2 = 2; % Mean of Y
V1 = 4; % Variance of X
V2 = 9; % Variance of Y
samnum=1000000;
u1 = rand(samnum,1);
u2 = rand(samnum,1);

% Geberate X and Y that are N(0,1) random variables and independent
X = sqrt( - 2*log(u1)).*cos(2*pi*u2 ); 
Y = sqrt( - 2*log(u1)).*sin(2*pi*u2 );

% Scale them to a particular mean and variance 
x = sqrt(V1)*X + M1; % x~ N(M1,V1)
y = sqrt(V2)*Y + M2; % y~ N(M2,V2)
A=x+y;
toc; % Read elapsed time from stopwatch

disp('Covariance of X and Y:')
disp((var(x+y)-var(x)-var(y))/2);
disp('Sample mean:')
disp(mean(A));
disp('Sample variance:')
disp(var(A));
hist(A);
hold;

%theo_x=[];
%theo_y=[];
theo_A=[];
k=[-15:.01:20];
n=length(k);
for i=1:n;
    theo_A(i)=normpdf(k(i),3,sqrt(13));
    %theo_y(i)=normpdf(k(i),2,3);
end
%theo_A=theo_x+theo_y;
%figure(2); 
plot(k,theo_A*samnum,'r--','linewidth',3);
xlabel('A(a)');ylabel('Probability*1M');title('Pdf of A and sample distribution');
legend('Sample distribution','Pdf of A');
