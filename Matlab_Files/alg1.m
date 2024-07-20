clc
a=zeros(1,4);
t=1;
while t==1
    a(1,1)=input('\nEnter the height\t');
    a(1,2)=input('\nEnter the weigth\t');
    a(1,3)=input('\nEnter the bark days\t');
    a(1,4)=input('\nEnter the ear head ration\t');
    %%%class 0%%%
    h0=1/sqrt(41.8*pi)*exp(-(a(1,1)-34.30).^2/41.8);
    w0=1/sqrt(67.14*pi)*exp(-(a(1,2)-24.00).^2/67.14);
    a(1,3)=round(a(1,3));
    n0=30;
    p0=0.553;
    b0=nchoosek(n0,a(1,3)).*(p0.^a(1,3)).*((1-p0).^(30-a(1,3)));
    aa0=0.087;
    bb0=0.532;
    e0=1/(bb0-aa0)*(heaviside(a(1,4)-aa0)-heaviside(a(1,4)-bb0));
    m0=h0*w0*b0*e0*(1200/3450);
    %%%%%%%%%%%%%%
    
    %%%%class 1%%%
    h1=1/sqrt(44.35*pi)*exp(-(a(1,1)-34.316).^2/44.35);
    w1=1/sqrt(69.04*pi)*exp(-(a(1,2)-25.204).^2/69.04);
    n1=30;
    p1=0.543;
    b1=nchoosek(n1,a(1,3)).*(p1.^a(1,3)).*((1-p1).^(30-a(1,3)));
    aa1=0.097;
    bb1=0.520;
    e1=1/(bb1-aa1)*(heaviside(a(1,4)-aa1)-heaviside(a(1,4)-bb1));
    m1=h1*w1*b1*e1*(1350/3450);
    %%%%%%%%%%%%%%
    
    %%%%class 2%%%
    h2=1/sqrt(41.272*pi)*exp(-(a(1,1)-34.346).^2/41.272);
    w2=1/sqrt(67.53*pi)*exp(-(a(1,2)-25.023).^2/67.53);
    n2=30;
    p2=0.559;
    b2=nchoosek(n2,a(1,3)).*(p2.^a(1,3)).*((1-p2).^(30-a(1,3)));
    aa2=0.098;
    bb2=0.535;
    e2=1/(bb2-aa2)*(heaviside(a(1,4)-aa2)-heaviside(a(1,4)-bb2));
     m2=h2*w2*b2*e2*(900/3450);
     m=max(max(m0,m1),max(m1,m2));
     if m==m0
         fprintf('\nThe input data is assigned to %d',0)
     elseif m==1
         fprintf('\nThe input data is assigned to %d',1)
     else
         fprintf('\nThe input data is assigned to %d',2)
     end
     [m0 m1 m2]
    %%%%%%%%%%%%%%
   
    t=input('\nDo you want to continue?(1/0)\t');
    
end