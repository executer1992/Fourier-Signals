clear all
close all
clc

fs = 1000; %Hz
A= 10; %Amplituda
e=0;    %Zmienne pomocnicze 
c=0; %Zmienne pomocnicze 
c1=0; %Zmienne pomocnicze   
c2=0;%Zmienne pomocnicze 
c3=0;%Zmienne pomocnicze
n=7; %Zmienna wykorzystana w pétli
b=0;    %Zmienne pomocnicze
d=0;
d1=0;
d2=0;
d3=0;
f=10; %Hz
fi=0; %rad
sim_time=1; %s czas symulacji

% 1 Funkcja,która tworzy 3 wykresy na raz

ST = lab_2(fs); %pseudo system transmisyjny
[t, d1,d2,d3]= ST.getSineSignal(A,f,sim_time,fi,d1,d2,d3,c1,c2,c3);

subplot(3,1,1);
plot (t,d1, 'r'),title('A=1, f=10Hz, fi=0, sim-time= 1s');
xlabel('Czas [s]'),ylabel('Prostokatny');

subplot(3,1,2);
plot (t,d2, 'r'),title('A=1, f=10Hz, fi=0, sim-time= 1s');
xlabel('Czas [s]'),ylabel('Piloksztaltny');

subplot(3,1,3);
plot (t,d3, 'r'),title('A=1, f=10Hz, fi=0, sim-time= 1s');
xlabel('Czas [s]'),ylabel('Trojkatny');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Wywołanie funkcji osobno do każdego sygnału
PT = lab_2(fs); %pseudo system transmisyjny
[t, d]= PT.getprostokatny(A,f,sim_time,fi,d,c,b,n);
figure('Name', 'Prostokatny')
plot (t,d, 'r'),title('A=1, f=10Hz, fi=0, sim-time= 1s');
xlabel('Czas [s]'),ylabel('Amplituda');
% Wywołanie funkcji osobno do każdego sygnału
PST = lab_2(fs); %pseudo system transmisyjny
[t, d]= PST.getpiloksztaltny(A,f,sim_time,fi,d,c,b,n,e);
figure('Name', 'Piloksztaltny')
plot (t,d, 'r'),title('A=1, f=10Hz, fi=0, sim-time= 1s');
xlabel('Czas [s]'),ylabel('Amplituda');
% Wywołanie funkcji osobno do każdego sygnału
TT = lab_2(fs); %pseudo system transmisyjny
[t, d]= TT.gettrojkatny(A,f,sim_time,fi,d,c,b,n,e);
figure('Name', 'Trojkatny')
plot (t,d, 'r'),title('A=1, f=10Hz, fi=0, sim-time= 1s');
xlabel('Czas [s]'),ylabel('Amplituda');
