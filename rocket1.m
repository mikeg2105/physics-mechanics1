%rocket2
%what rocket2 does

%this rocket will go out of the earths atmosphere

%use newtons law of gravity
%  https://en.wikipedia.org/wiki/Gravitational_constant


clear all %here because variables not initilised correctly :-( :-(  merde!!!

G=6.67e-11; %gravitational constants SI units
re=6.3781e6; %radius of the earth metres
me=5.97237e24; %earth mass kg
mr=1000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nsteps=400000;
dt=1; %time step
%launch angle
theta=0;
box=20000000;
 %theta is in degrees here

%initial speed
u=9000; %metres per second
g=9.81; %acceleration due to gravity

xe=0;
ye=0;

y=re+50000;
x=0;

%convert theta to radians
theta=theta*2*pi/360;

vx=u*cos(theta);
vy=u*sin(theta);


figure;
hold on;
hax1=line([-re-box -re-box], [re+box -re-box]);
hax2=line([re+box -re-box], [re+box +re+box]);
hax3=line([re+box re+box], [-re-box +re+box]);
hax4=line([-re-box re+box], [-re-box -re-box]);

  set( hax1 , 'Color' ,'red' );
plot( 0 , 0 ,'o','MarkerFaceColor','r','MarkerSize',30);
hold on
h=plot( x , y ,'o','MarkerFaceColor','g','MarkerSize',10);
hold on
%output



pause;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:nsteps
 h.XDataSource ='x';
h.YDataSource = 'y';
       %calculate vx
       newvx=vx;
       newvy=vy;
       r2=((x-xe).^2+(y-ye).^2);
       r=sqrt(r2);
       g=G*me/r2;
       
       gx=g*(x-xe)/r;
       gy=g*(y-ye)/r;
       
       
       
       
       %calculate vy
       newvy=vy-gy*dt;
       newvx=vx-gx*dt;
 
        %store old position vector
        oldr(1,1)=x;
        oldr(1,2)=y;

      
        
       
       %calculate x
       x=x+0.5*(vx+newvx)*dt;
       
       %calculate y
       y=y+0.5*(vy+newvy)*dt;
%       refreshdata; 

%       h.XData=x;
%       h.YData=y;
      set(h,'XData',x);
      set(h,'YData',y);

      drawnow;
       vx=newvx;
       vy=newvy;

        newr(1,1)=x;
        newr(1,2)=y;
 
 %plot( x , y ,'o','MarkerFaceColor','g','MarkerSize',10);
 %hold on;
        %vectarrow(oldr, newr);
%         hold on;

end