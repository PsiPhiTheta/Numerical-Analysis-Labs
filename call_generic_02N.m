R1 = 60;
R2 = 5;
R3 = 4;
R4 = 7;
R5 = 6;
R6 = 10;

L1 = 9;
C2 = 5;
C3 = 7e-4;
L4 = 3;
L5 = 5e-4;
C6 = 3e-4;

Mx = zeros(6,6); 

Mw = zeros(6,11);
Mw(1,1) = 1/L1;
Mw(2,2) = 1/C2;
Mw(3,7) = 1/C3;
Mw(4,3) = 1/L4;
Mw(5,10) = 1/L5;
Mw(6,11) = 1/C6;
    
Mu = [0;0;0;0;0;0];

Nw = zeros(11,11);
% Nw(1,1) = 1;
% Nw(1,4) = -R1;
% Nw(2,1) = 1;
% Nw(2,2) = -1;
% Nw(2,5) = -R2;
% Nw(3,2) = 1;
% Nw(3,5) = -R3;
% Nw(4,3) = -1;
% Nw(4,8) = -R4;
% Nw(5,3) = 1;
% Nw(5,9) = -R5;
% Nw(6,11) = -R6;
% Nw(7,4) = 1;
% Nw(7,5) = -1;
% Nw(8,5) = 1;
% Nw(8,6) = -1;
% Nw(9,6) = 1;
% Nw(9,7) = -1;
% Nw(9,8) = -1;
% Nw(10,8) = 1;
% Nw(10,9) = -1;
% Nw(11,9) = 1;
% Nw(11,10) = -1;
% Nw(11,11) = -1;

Nw(1,1) = -1;
Nw(1,4) = -R1;
Nw(2,1) = 1;
Nw(2,9) = R4;
Nw(3,3) = 1;
Nw(3,11) = -R6;
Nw(4,4) = 1;
Nw(4,5) = -1;
Nw(5,5) = 1;
Nw(5,6) = -1;
Nw(5,7) = -1;
Nw(6,1) = 1;
Nw(6,5) = -R2;
Nw(7,7) = R3;
Nw(8,2) = 1;
Nw(8,3) = -1;
Nw(8,10) = -R5;
Nw(9,7) = 1;
Nw(9,8) = -1;
Nw(9,9) = -1;
Nw(10,9) = 1;
Nw(10,10) = -1;
Nw(11,10) = 1;
Nw(11,11) = -1;

Nwi = inv(Nw);

Nx = zeros(11,6);
Nx(2,4) = 1;
Nx(3,1) = 1;
Nx(4,6) = 1;
Nx(6,5) = 1;
Nx(7,4) = -1;
Nx(7,5) = 1;
Nx(10,3) = 1;
Nx(11,2) = 1;

Nu =  [1;0;0;0;0;0;0;0;0;0;0];

Pv1 = zeros(6,6);
Pv1(2,5) = 1;
Pv1(3,4) = 1;
Pv1(6,1) = 1;

Pv2 = zeros(6,11);
Pv2(1,1) = 1;
Pv2(4,2) = 1;
Pv2(5,3) = 1;

Pi1 = zeros(11,6);
Pi1(2,6) = 1;
Pi1(8,3) = 1;
Pi1(10,2) = 1;

Pi2 = zeros(11,11);
Pi2(1,4) = 1;
Pi2(3,5) = 1;
Pi2(4,6) = 1;
Pi2(5,7) = 1;
Pi2(6,8) = 1;
Pi2(7,9) = 1;
Pi2(9,10) = 1;
Pi2(11,11) = 1;

T = 50;
dt_max = 0.001;

sim('generic_RLC');

subplot(211)
plot(t,v)
ylabel('voltage')
legend('v1','v2','v3','v4','v5','v6')
subplot(212)
plot(t,i)
ylabel('current')
xlabel('time')
legend('i1','i1a','i2','i2a','i3','i3a','i4','i4a','i5','i5a','i6')

