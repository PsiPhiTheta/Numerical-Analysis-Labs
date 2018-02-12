%%%% Simulates RLC circuit of Lab 2, Fig 1
%%%% Two resistor values, one capacitor value and one inductor value
%%%%   all given below
%%%% Calls Simulink file generic_RLC
%%%% Stopping time is T
%%%% Last modified WPH 24 Nov 17



C1 = 7e-4;
L2 = 4;
R1 = 1000;
R2 = 6;


Mx = zeros(2,2); 
Mw = [0  0  1/C1;
       1/L2 0 0];
Mu = [0;0];
Nw = [0  -R1  0;
		-1  0  0;
		0  1  -1];
Nwi = inv(Nw);
Nx = [1  0;
-1  R2;
0  1];
Nu =  [
	-1;
	0;
	0];
Pv1 = [1  0;
	   0  0];
Pv2 = [0  0  0;
	   1  0  0];
Pi1 = [0  0;0  0;0  1];
Pi2  =[0  1  0;
    0   0   1
    0  0  0];

T = 5;
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

