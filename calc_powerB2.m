%Author: 9563426
%Subject: Numerical Analysis (Lab1PartB1)

%0. Function declaration
function P = calc_powerB2(Rvals);

%1. Get R and V
R = Rvals; %gets resistor values
V = 1; %sets voltage to 1V

%2. Make resistor loop array
A = [  
        (R(1)+R(5)+R(6)+R(9)) -R(6) 0 0 -R(9) 0 0 0 0 0;
        -R(6) (R(6)+R(2)+R(7)+R(10)) -R(7) 0 0 -R(10) 0 0 0 0;
        0 -R(7) (R(3)+R(7)+R(11)+R(8)) -R(8) 0 0 -R(11) 0 0 0;
        0 0 R(8) -(R(26)+R(22)+R(15)+R(8)+R(4)) 0 0 R(15) 0 0 R(22);
        -R(9) 0 0 0 (R(12)+R(9)+R(13)+R(16)) -R(13) 0 -R(16) 0 0;
        0 -R(10) 0 0 -R(13) (R(13)+R(10)+R(14)+R(17)) -R(14) 0 -R(17) 0;
        0 0 -R(11) -R(15) 0 -R(14) (R(11)+R(14)+R(15)+R(18)) 0 0 -R(18);
        0 0 0 0 -R(16) 0 0 (R(19)+R(16)+R(20)+R(23)) -R(20) 0;
        0 0 0 0 0 -R(17) 0 -R(20) (R(20)+R(17)+R(21)+R(24)) -R(21);
        0 0 0 -R(22) 0 0 -R(18) 0 -R(21) (R(18)+R(21)+R(22)+R(25))
    ];
b = [0;0;0;V;0;0;0;0;0;0];

%3. Calculate mesh currents
Iloop = A \ b; %calculates the mesh currents
I = zeros(26,1); %initialise the current array
I(1) = Iloop(1); 
I(2) = Iloop(2);
I(3) = Iloop(3);
I(4) = Iloop(4);
I(5) = Iloop(1);
I(6) = Iloop(1)-Iloop(2);
I(7) = Iloop(2)-Iloop(3); 
I(8) = Iloop(3)-Iloop(4);
I(9) = Iloop(5)-Iloop(1);
I(10) = Iloop(6)-Iloop(2);
I(11) = Iloop(7)-Iloop(3);
I(12) = Iloop(5);
I(13) = Iloop(5)-Iloop(6); 
I(14) = Iloop(6)-Iloop(7);
I(15) = Iloop(7)-Iloop(4);
I(16) = Iloop(8)-Iloop(5);
I(17) = Iloop(6)-Iloop(9);
I(18) = Iloop(7)-Iloop(10);
I(19) = Iloop(8); 
I(20) = Iloop(8)-Iloop(9);
I(21) = Iloop(9)-Iloop(10);
I(22) = Iloop(10)-Iloop(4);
I(23) = Iloop(8);
I(24) = Iloop(9);
I(25) = Iloop(10);
I(26) = Iloop(4);

%4. Calculate and display dissipated power
format long
P = (I.*I)'*R; %calculates total power dissipated
%Result should be = 0.027064W
