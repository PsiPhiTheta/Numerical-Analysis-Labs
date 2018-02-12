%%%% Function to obtain 26 resistor values from id.
%%% WPH, last modified 26 Oct 17
%%% TH, last modified 8 Oct 11

function values = get_valuesB2(id);

%%%% Find x,y,z,a,b,c,p,q
x = floor(id/10^7); 
id1 = id-x*10^7;
y = floor(id1/10^6);
id1 = id1-y*10^6;
z = floor(id1/10^5);
id1 = id1-z*10^5;
a = floor(id1/10^4);
id1 = id1-a*10^4;
b = floor(id1/10^3);
id1 = id1-b*10^3;
c = floor(id1/10^2);
id1 = id1-c*10^2;
p = floor(id1/10);
id1 = id1-p*10;
q = id1;

%%% Now R
R = zeros(26,1);

R(1) = x+1;
R(2) = y+1;
R(3) = z+1;
R(4) = a+1;
R(5) = b+1;
R(6) = c+1;
R(7) = p+1;
R(8) = q+1;

R(9) = x+y+1;
R(10) = y+z+1;
R(11) = z+a+1;
R(12) = a+b+1;
R(13) = b+c+1;
R(14) = c+p+1;
R(15) = p+q+1;

R(16) = x+y+z+1;
R(17) = y+z+a+1;
R(18) = z+a+b+1;
R(19) = a+b+c+1;
R(20) = b+c+p+1;
R(21) = c+p+q+1;

R(22) = x+y+z+a+1;
R(23) = y+z+a+b+1;
R(24) = z+a+b+c+1;
R(25) = a+b+c+p+1;
R(26) = b+c+p+q+1;

values = R;
