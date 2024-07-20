clc
m=[height1 weight bark_days ear_head_ratio class1];
N=zeros(1,3);
for i=1:length(height1)-1
    for j=1:length(height1)-1
        if m(j,5)>m(j+1,5)
            a=m(j,5);
            b=m(j+1,5);
            m(j,5)=b;
            m(j+1,5)=a;
        end
    end
end
for i=1:length(height1)
    if m(i,5)==0
        N(1,1)=N(1,1)+1;
    elseif m(i,5)==1
        N(1,2)=N(1,2)+1;
    else
        N(1,3)=N(1,3)+1;
    end
end
%%
h0=[]; h1=[]; h2=[];
w0=[]; w1=[]; w2=[];
b0=[]; b1=[]; b2=[];
e0=[]; e1=[]; e2=[];
c0=[]; c1=[]; c2=[];

for i=1:length(height1)
    if i<=N(1,1)
        h0=[h0 m(i,1)]; w0=[w0 m(i,2)]; b0=[b0 m(i,3)]; e0=[e0 m(i,4)]; c0=[c0 m(i,5)];
    elseif i>N(1,1)&i<=(N(1,2)+N(1,1))
        h1=[h1 m(i,1)]; w1=[w1 m(i,2)]; b1=[b1 m(i,3)]; e1=[e1 m(i,4)]; c1=[c1 m(i,5)];
    else
        h2=[h2 m(i,1)]; w2=[w2 m(i,2)]; b2=[b2 m(i,3)]; e2=[e2 m(i,4)]; c2=[c2 m(i,5)];
    end
end
PM=zeros(3,8);
PM(1,1)=mean(h0); PM(1,2)=var(h0); PM(1,3)=mean(w0); PM(1,4)=var(w0); PM(1,5)=mean(b0);
    PM(1,6)=var(b0); PM(1,7)=mean(e0); PM(1,8)=var(e0);
 PM(2,1)=mean(h1); PM(2,2)=var(h1); PM(2,3)=mean(w1); PM(2,4)=var(w1); PM(2,5)=mean(b1);
    PM(2,6)=var(b1); PM(2,7)=mean(e1); PM(2,8)=var(e1);
PM(3,1)=mean(h2); PM(3,2)=var(h2); PM(3,3)=mean(w2); PM(3,4)=var(w2); PM(3,5)=mean(b2);
    PM(3,6)=var(b2); PM(3,7)=mean(e2); PM(3,8)=var(e2);
%%
%class 0
n0=min(b0):1:max(b0);
N0=zeros(1,length(n0));
for i=1:length(b0)
    for j=1:length(n0)
        if b0(i)==n0(j);
            N0(j)=N0(j)+1;
        end
    end
             
end
subplot(2,2,1)
histogram(h0,20)
grid
title('Class 0 height','interpreter','latex')
subplot(2,2,2)
histogram(w0,20)
title('Class 0 weight','interpreter','latex')
grid
subplot(2,2,3)
stem(n0,N0,'.')
title('Class 0 bark days','interpreter','latex')
grid
subplot(2,2,4)
histogram(e0,20)
grid
title('Class 0 ear head ratio','interpreter','latex')
%%
n1=min(b1):1:max(b1)
N1=zeros(1,length(n1))
for i=1:length(b1)
    for j=1:length(n1)
        if b1(i)==n1(j);
            N1(j)=N1(j)+1;
        end
    end
             
end
    
figure
subplot(2,2,1)
histogram(h1,20)
grid
title('Class 1 height','interpreter','latex')
subplot(2,2,2)
histogram(w1,20)
title('Class 1 weight','interpreter','latex')
grid
subplot(2,2,3)
stem(n1,N1,'.')
title('Class 1 bark days','interpreter','latex')
grid
subplot(2,2,4)
histogram(e1,20)
grid
title('Class 1 ear head ratio','interpreter','latex')
%%
figure
n2=min(b2):1:max(b2);
N2=zeros(1,length(n2));
for i=1:length(b2)
    for j=1:length(n2)
        if b2(i)==n2(j);
            N2(j)=N2(j)+1;
        end
    end
             
end
subplot(2,2,1)
histogram(h2,20)
grid
title('Class 2 height','interpreter','latex')
subplot(2,2,2)
histogram(w2,20)
title('Class 2 weight','interpreter','latex')
grid
subplot(2,2,3)
stem(n2,N2,'.')
title('Class 2 bark days','interpreter','latex')
grid
subplot(2,2,4)
histogram(e2,20)
grid
title('Class 2 ear head ratio','interpreter','latex')
%%
fprintf('\n\nThe output mean and variance matrix is as follow:\n')
PM
%%
%The expected distributions for class 0
figure
%height
subplot(2,2,1)
t=10:1e-2:60;
fxh0=1/sqrt(41.8*pi)*exp(-(t-34.30).^2/41.8);
plot(t,fxh0)
grid
title('Expexcted Dsistribution for height in class0','interpreter','latex')
%weight
subplot(2,2,2)
t=0:1e-2:50;
fxw0=1/sqrt(67.14*pi)*exp(-(t-24.00).^2/67.14);
plot(t,fxw0)
grid
title('Expexcted Dsistribution for weight in class0','interpreter','latex')
%barkly days
subplot(2,2,3)
n0=30;
p0=0.553;
x0=0:30;
P0=zeros(1,length(x0));
for i=1:length(x0)
    P0(i)=nchoosek(n0,x0(i)).*(p0.^x0(i)).*((1-p0).^(30-x0(i)));
end
stem(x0,P0,'.')
title('Expexcted Dsistribution for Bark Days in class0','interpreter','latex')
grid
%ear head ratio
subplot(2,2,4)
t=0:1e-3:1;
a0=0.087;
b0=0.532;
fxe0=1/(b0-a0)*(heaviside(t-a0)-heaviside(t-b0));
plot(t,fxe0)
grid
title('Expexcted Dsistribution for Ear head ratio in class0','interpreter','latex')

%%
%The expected distributions for class 1
figure
%height
subplot(2,2,1)
t=10:1e-2:60;
fxh1=1/sqrt(44.35*pi)*exp(-(t-34.316).^2/44.35);
plot(t,fxh1)
grid
title('Expexcted Dsistribution for height in class1','interpreter','latex')
%weight
subplot(2,2,2)
t=0:1e-2:50;
fxw1=1/sqrt(69.04*pi)*exp(-(t-25.204).^2/69.04);
plot(t,fxw1)
grid
title('Expexcted Dsistribution for weight in class1','interpreter','latex')
%barkly days
subplot(2,2,3)
n1=30;
p1=0.543;
x1=0:30;
P1=zeros(1,length(x1));
for i=1:length(x1)
    P1(i)=nchoosek(n1,x1(i)).*(p1.^x1(i)).*((1-p1).^(30-x1(i)));
end
stem(x1,P1,'.')
title('Expexcted Dsistribution for Bark Days in class1','interpreter','latex')
grid
%ear head ratio
subplot(2,2,4)
t=0:1e-3:1;
a1=0.097;
b1=0.520;
fxe1=1/(b1-a1)*(heaviside(t-a1)-heaviside(t-b1));
plot(t,fxe1)
grid
title('Expexcted Dsistribution for Ear head ratio in class1','interpreter','latex')
%%
%The expected distributions for class 2
figure
%height
subplot(2,2,1)
t=10:1e-2:60;
fxh2=1/sqrt(41.272*pi)*exp(-(t-34.346).^2/41.272);
plot(t,fxh2)
grid
title('Expexcted Dsistribution for height in class2','interpreter','latex')
%weight
subplot(2,2,2)
t=0:1e-2:50;
fxw2=1/sqrt(67.53*pi)*exp(-(t-25.023).^2/67.53);
plot(t,fxw2)
grid
title('Expexcted Dsistribution for weight in class2','interpreter','latex')
%barkly days
subplot(2,2,3)
n2=30;
p2=0.559;
x2=0:30;
P2=zeros(1,length(x2));
for i=1:length(x2)
    P2(i)=nchoosek(n2,x2(i)).*(p2.^x2(i)).*((1-p2).^(30-x2(i)));
end
stem(x2,P2,'.')
title('Expexcted Dsistribution for Bark Days in class2','interpreter','latex')
grid
%ear head ratio
subplot(2,2,4)
t=0:1e-3:1;
a1=0.098;
b1=0.535;
fxe2=1/(b1-a1)*(heaviside(t-a1)-heaviside(t-b1));
plot(t,fxe2)
grid
title('Expexcted Dsistribution for Ear head ratio in class2','interpreter','latex')
%%

