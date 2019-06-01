clc
clear
close all
%%
E = 1;
Re = 5000;
dt = 12.5;
% Prob1 = [ 0 2 36 240 500 1000]
% E= (240*dt)/(Re*(1/20)^2)
A = -E/2;
B = 1+E;
N = 20;

Del =1/N;
Y(1) = 0;
T = 0;
% Boundry condition
U(1) = 0;
U(N+1) = 1;
Uf(1,:) = U;
% Initial Condition
j = 2;
U(j) = 0;
a(1) = 1;
b(1) = 1;
c(1) = 1;
d(1) = 1;
k = 1;

%% Original coeff.
for g=2:1000
for j = 2:N
Y(j) = Y(j-1) +Del;
a(j) = A;
if(j==N) 
    a(j) = 0;end

    d(j) = B;
    b(j) = A;

if(j==2)
    b(j) = 0;end

    c(j) = (1-E)*U(j) + .5*E*(U(j+1)+U(j-1));

if (j==N)
    c(j) = c(j) - A*U(N+1);end
end

%%
for j = 3:N
    d(j) = d(j) - b(j)*a(j-1)/d(j-1);
    c(j) = c(j) - c(j-1) *b(j)/d(j-1);
end
%%
for k = 2:N
    M = N-(k-2);
    U(M) = (c(M) - a(M) *U(M+1))/d(M);
end
Uf(g,:) = U;
end

Y(N+1) = Y(N) + Del;
figure(1)
plot(Uf([1 2 36 240 500 1000],:),Y)
ylabel('y/D')
xlabel('U')
title('Project 1.1')
legend('0 Delta T','2 Delta T','36 Delta T','240 Delta T','500 Delta T','1000 Delta T','Location','southeast')
%% 






