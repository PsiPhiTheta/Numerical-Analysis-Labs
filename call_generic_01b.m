%%%% Simulates RLC circuit of Lab 2, Fig 4
%%%% Two resistor values, one capacitor value and one inductor value
%%%%   all given below
%%%% Calls Simulink file generic_RLC
%%%% Stopping time is T
%%%% Last modified WPH 24 Nov 17

C2 = 7e-4;
L1 = 4;
R1 = 1000;
R2 = 6;


Mx = zeros(2,2); 
Mw = [0  0  1/C2;
       1/L1 0 0];
Mu = [0;0];
Nw = [1  R1  0;
		1  0  -R2;
		0  1  -1];
Nwi = inv(Nw);
Nx = [0  0;
1  0;
0  1];
Nu =  [
	1;
	0;
	0];
Pv1 = [0  0;
	   1  0];
Pv2 = [1  0  0;
	   0  0  0];
Pi1 = [0  0;0  1;0  0];
Pi2  =[0  1  0;
    0   0   0
    0  0  1];

T = 10000;
dt_max = 0.001;

sim('generic_RLC');

subplot(211)
plot(t,v)
ylabel('voltage')
legend('v1','v2')
subplot(212)
plot(t,i)
ylabel('current')
xlabel('time')
legend('i1','i1a','i2')

