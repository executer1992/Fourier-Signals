classdef lab_2
    
    properties
        internal_fs
    end
    methods
        function [obj] = lab_2(fs)
            
            if nargin > 0
                if isnumeric(fs)
                    obj.internal_fs=fs;
                else
                    error('Bad input data')
                end
            end
          
        end
    
   %Wszystkie sygnaly
function [t, d1,d2,d3] = getSineSignal(obj,A,f,sim_time,fi,c1,c2,c3,d1,d2,d3)
    t=0:1/obj.internal_fs:sim_time;
%     for k = 3:2:n
%         x=(sin(2*pi*k*t*f))/k;
%       b=[b,x];
%     end

    c1= sin(2*pi*t*f)+(sin(2*pi*3*t*f)/3)+(sin(2*pi*5*t*f)/5)+(sin(2*pi*7*t*f)/7)+(sin(2*pi*9*t*f)/9);
    d1= 4*A/pi*c1;
    disp(d1);
    c2= sin(2*pi*t*f)-(sin(2*pi*2*t*f)/2)+(sin(2*pi*3*t*f)/3)-(sin(2*pi*4*t*f)/4);
    d2= 2*A/pi*c2;
    c3= sin(2*pi*t*f)-(sin(2*pi*3*t*f)/3^2)+(sin(2*pi*5*t*f)/5^2)-(sin(2*pi*7*t*f)/7^2);
    d3= 8*A/(pi^2)*c3;
end
% Sygnal Prostokatny
function [t, d] = getprostokatny(obj,A,f,sim_time,fi,d,c,b,n)
    t=0:1/obj.internal_fs:sim_time;
    for k = 1:2:n
        x=sin(2*pi*k*t*f)/k;
      	b=b+x;
    end
    disp(b);
    d=4*A/pi*b;
end
% Sygnal Piloksztaltny
function [t, d] = getpiloksztaltny(obj,A,f,sim_time,fi,d,c,b,n,e)
    t=0:1/obj.internal_fs:sim_time;
    for k = 1:2:n
        x=sin(2*pi*k*t*f)/k;
      	b=b+x;
    end
    for z = 2:2:n
        o=-sin(2*pi*z*t*f)/z;
      	c=c+o;
    end
    e=b+c;
    disp(e);
    d=2*A/pi*e;
end
% Sygnal Trojkatny
function [t, d] = gettrojkatny(obj,A,f,sim_time,fi,d,c,b,n,e)
   t=0:1/obj.internal_fs:sim_time;
    for k = 1:4:n
        x=sin(2*pi*k*t*f)/k^2;
      	b=b+x;
    end
    for z = 3:4:n
        o=-sin(2*pi*z*t*f)/z^2;
      	c=c+o;
    end
    e=b+c;
    d=8*A/(pi^2)*e;
 
      
     
end

    end
end
