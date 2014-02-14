function OptimalStateValueFunction

gamma = 0.975;

s = 81;

r = load('rewards.txt');

a1 = load('prob_a1.txt');

a2 = load('prob_a2.txt');

a3 = load('prob_a3.txt');

a4 = load('prob_a4.txt');

vorig = r;%zeros(size(r));
v = r;%vorig;

convergence = 1e-6;

done = false;

while(~done)
    vorig = v;

    for i=1:s       %iterate the states
        temp = zeros(4,1); %find the max summation of the best action
    
        for j=1:4   %iterate the actions
            if(j == 1)
                for k=1:s   %iterate the s'
                    if(a1(k,1) == i)
                        temp(j,1) = temp(j,1)+ (a1(k,3) * v(a1(k,2))); % wouldn't this always be 0???
                    end                                                 %the v is always 0 for some reason
                end
            elseif(j == 2)
                for k=1:s
                    if(a2(k,1) == i)
                        temp(j,1) = temp(j,1)+ a2(k,3) * v(a2(k,2)); % wouldn't this always be 0???
                    end
                end
            elseif(j == 3)
                for k=1:s
                    if(a3(k,1) == i)
                        temp(j,1) = temp(j,1)+ a3(k,3) * v(a3(k,2)); % wouldn't this always be 0???
                    end
                end
            elseif(j == 4)
                for k=1:s
                    if(a4(k,1) == i)
                        temp(j,1) = temp(j,1)+ a4(k,3) * v(a4(k,2)); % wouldn't this always be 0???
                    end
                end
            end
        end
    
        [c,index] = max(temp); %c is always 0
 
        v(i) = r(i,1) + gamma * c;
    
    end %done with 1 round of iteration

    temp2 = zeros(s,1); %find the max difference

    for a=1:s
        temp2(a,1) = abs(vorig(a,1) - v(a,1));
    end

    [diff,index] = max(temp2)

    if(diff < convergence)  %check if we converged
        done = true;
    end
end

v %eventually need to trim out 0's

end