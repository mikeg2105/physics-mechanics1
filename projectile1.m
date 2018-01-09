%rocket2
%what rocket2 does

%this rocket will go out of the earths atmosphere

clear all %here because variables not initilised correctly :-( :-(  merde!!!




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%inputs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nsteps=14;
dt=0.1; %time step
%launch angle
theta=43;
 %theta is in degrees here

%initial speed
u=10; %metres per second
g=9.81; %acceleration due to gravity



x=0;
y=0;

%convert theta to radians
theta=theta*2*pi/360;

vx=u*cos(theta);
vy=u*sin(theta);



%output



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:nsteps
 
       %calculate vx
       newvx=vx;
       
       %calculate vy
       newvy=vy-g*dt;
 
        %store old position vector
        oldr(1,1)=x;
        oldr(1,2)=y;

          oldr(1,1)=x;
        oldr(1,2)=y;
      
        
        
       %calculate x
       x=x+0.5*(vx+newvx)*dt;
       
       %calculate y
       y=y+0.5*(vy+newvy)*dt;


       vx=newvx;
       vy=newvy;
       
        newr(1,1)=x;
        newr(1,2)=y;
        vectarrow(oldr, newr);
        hold on;

end