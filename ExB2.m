%Author: 9563426
%Subject: Numerical Analysis (Lab1PartB1)
%Adapted from: WPH, sim_anneal_loop.m (26 Oct. 17)

%1. Get R
R = get_valuesB2(95634262); %gets resistor values

%2. Find minimum possible power & config
P = sprintf('%.6f',calc_powerB2(R)); %calculates associated power (6 d.p. as before)
T = 1000;

while T > 1e-10,
    mov = randi(26,2,1);
    if mov(1) ~= mov(2),
        if mov(1) > mov(2),
            mov = mov(2:-1:1);
        end
        ind = [[0:mov(1)-1],[mov(2):-1:mov(1)],[mov(2)+1:27]];
        Rnew = R(ind(2:27));
        Pnew = calc_powerB2(Rnew);
        if Pnew < P
            R = Rnew;
            P = Pnew;
        else
            Rand_variable = rand;
            if Rand_variable < exp(-(Pnew-P)/T),
                R = Rnew;
                P = Pnew; %bug found, fixed & reported to WPH on 30/11/2017
            end
        end
        T = T * 0.9995;
    end
end
clc
disp(['Minimum power is ' num2str(P) ' W']) %this fast script typically oscillates between 0.014435W and 0.014558W
disp(['  with permutation R = [' num2str(R') ']']) %best found so far is 0.014428W (~5min to run)