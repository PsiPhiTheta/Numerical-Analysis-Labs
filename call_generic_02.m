%%%% Simulates RLC circuit of Lab 2, Fig 5
%%%% Six resistor values, three inductor values and three capacitor 
%%%%   values all given below in section 1
%%%% Calls Simulink file generic_RLC
%%%% Stopping time is T
%%%% Last modified by 9563426 28 Nov 17

%1. Set component values
R1 = 60;
R2 = 5;
R3 = 4;
R4 = 7;
R5 = 6;
R6 = 10;

L1 = 9;
L2 = 5;
C3 = 7e-4;
L4 = 3;
C5 = 5e-4;
C6 = 3e-4;

%2. Initiate matrices
Mx = zeros(6,6); 

Mw = zeros(6,11);
Mw(1,1) = 1/L1;
Mw(2,2) = 1/L2;
Mw(3,7) = 1/C3;
Mw(4,3) = 1/L4;
Mw(5,9) = 1/C5;
Mw(6,11) = 1/C6;

Mu = zeros(6,1);

Nw = zeros(11,11);
Nw(1,1) = -1;
Nw(1,4) = -R1;
Nw(2,1) = 1;
Nw(2,2) = -1;
Nw(2,5) = -R2;
Nw(3,2) = 1;
Nw(3,5) = -R3;
Nw(4,3) = -1;
Nw(4,8) = -R4;
Nw(5,3) = 1;
Nw(5,9) = -R5;
Nw(6,11) = -R6;
Nw(7,4) = 1;
Nw(7,5) = -1;
Nw(8,5) = 1;
Nw(8,6) = -1;
Nw(9,6) = 1;
Nw(9,7) = -1;
Nw(9,8) = -1;
Nw(10,8) = 1;
Nw(10,9) = -1;
Nw(11,9) = 1;
Nw(11,10) = -1;
Nw(11,11) = -1;

Nwi = inv(Nw);

Nx = zeros(11,6);
Nx(3,3) = 1;
Nx(4,3) = -1;
Nx(5,5) = 1;
Nx(6,5) = -1;
Nx(6,6) = 1;
Nx(7,1) = 1;
Nx(8,2) = 1;
Nx(10,4) = 1;

Nu = zeros(11,1);
Nu(1) = -1;

Pv1 = zeros(6,6);
Pv1(3,3) = 1;
Pv1(5,5) = 1;
Pv1(6,6) = 1;

Pv2 = zeros(6,11);
Pv2(1,1) = 1;
Pv2(2,2) = 1;
Pv2(4,3) = 1;

Pi1 = zeros(11,6);
Pi1(2,1) = 1;
Pi1(4,2) = 1;
Pi1(8,4) = 1;

Pi2 = zeros(11,11);
Pi2(1,4) = 1;
Pi2(3,5) = 1;
Pi2(5,6) = 1;
Pi2(6,7) = 1;
Pi2(7,8) = 1;
Pi2(9,9) = 1;
Pi2(10,10) = 1;
Pi2(11,11) = 1;

%3. Initiate remaining variables
T = 10;
dt_max = 0.001;

%4. Use Simulink to run the simulation
sim('generic_RLC');

%5. Plot results
subplot(211)
plot(t,v)
ylabel('voltage')
legend('v1','v2','v3','v4','v5','v6')
subplot(212)
plot(t,i)
ylabel('current')
xlabel('time')
legend('i1','i1a','i2','i2a','i3','i3a','i4','i4a','i5','i5a','i6')

