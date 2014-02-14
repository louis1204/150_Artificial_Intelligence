function viterbi

a = txt2mat('transitionMatrix.txt');
b = txt2mat('emissionMatrix.txt');
pi = txt2mat('initialStateDistribution.txt');
data = load('observations.txt');
O = data(1,:);

T = 60000;  %time
n = 26; %states

St = zeros(T, 1); %the most likely sequence of states
lit = zeros(n, T);  %lit table

%fill up the lit* table with foward pass
for t=1:T
    for j =1:n%j = row #
        if(t == 1)
            y = O(1, 1);
            lit(j,t) = log(pi(j,1)) + log(b(j, y + 1)); %look at log(b(o))
        else
            y = O(1,t);
            
            temp = zeros(n, 1);      
            for i=1:n
                temp(i,1) = lit(i, t-1) + log(a(i, j)) + log(b(j, y + 1));
            end
            [am,mx] = max(temp);
            lit(j,t) = am; %mx or am for the first?!
        end
    end
end

%find St with backwards pass
for t =T:-1:1
    if(t == T)
        [am,mx] = max(lit(:, t));
        St(t, 1) = mx;
    else
        y = St(t+1,1);
        temp = zeros(n, 1);
        
        for i=1:n
            temp(i,1) = lit(i, t) + log(a(i, y));
        end
        [am,mx] = max(temp);
        St(t, 1) = mx;
    end
end

plot(St);

for i =1: size(St,1)
    if(i == 1)
        if(St(i,1) == 1);
            fprintf('a')
        elseif(St(i,1) == 2);
            fprintf('b')
        elseif(St(i,1) == 3);
            fprintf('c')
        elseif(St(i,1) == 4);
            fprintf('d')
        elseif(St(i,1) == 5);
            fprintf('e')
        elseif(St(i,1) == 6);
            fprintf('f')
        elseif(St(i,1) == 7);
            fprintf('g')
        elseif(St(i,1) == 8);
            fprintf('h')
        elseif(St(i,1) == 9);
            fprintf('i')
        elseif(St(i,1) == 10);
            fprintf('j')
        elseif(St(i,1) == 11);
            fprintf('k')
        elseif(St(i,1) == 12);
            fprintf('l')
        elseif(St(i,1) == 13);
            fprintf('m')
        elseif(St(i,1) == 14);
            fprintf('n')
        elseif(St(i,1) == 15);
            fprintf('o')
        elseif(St(i,1) == 16);
            fprintf('p')
        elseif(St(i,1) == 17);
            fprintf('q')
        elseif(St(i,1) == 18);
            fprintf('r')
        elseif(St(i,1) == 19);
            fprintf('s')
        elseif(St(i,1) == 20);
            fprintf('t')
        elseif(St(i,1) == 21);
            fprintf('u')
        elseif(St(i,1) == 22);
            fprintf('v')
        elseif(St(i,1) == 23);
            fprintf('w')
        elseif(St(i,1) == 24);
            fprintf('x')
        elseif(St(i,1) == 25);
            fprintf('y')
        elseif(St(i,1) == 26);
            fprintf('z')
        end
    elseif(St(i,1) ~= St(i-1,1))
        if(St(i,1) == 1);
            fprintf('a')
        elseif(St(i,1) == 2);
            fprintf('b')
        elseif(St(i,1) == 3);
            fprintf('c')
        elseif(St(i,1) == 4);
            fprintf('d')
        elseif(St(i,1) == 5);
            fprintf('e')
        elseif(St(i,1) == 6);
            fprintf('f')
        elseif(St(i,1) == 7);
            fprintf('g')
        elseif(St(i,1) == 8);
            fprintf('h')
        elseif(St(i,1) == 9);
            fprintf('i')
        elseif(St(i,1) == 10);
            fprintf('j')
        elseif(St(i,1) == 11);
            fprintf('k')
        elseif(St(i,1) == 12);
            fprintf('l')
        elseif(St(i,1) == 13);
            fprintf('m')
        elseif(St(i,1) == 14);
            fprintf('n')
        elseif(St(i,1) == 15);
            fprintf('o')
        elseif(St(i,1) == 16);
            fprintf('p')
        elseif(St(i,1) == 17);
            fprintf('q')
        elseif(St(i,1) == 18);
            fprintf('r')
        elseif(St(i,1) == 19);
            fprintf('s')
        elseif(St(i,1) == 20);
            fprintf('t')
        elseif(St(i,1) == 21);
            fprintf('u')
        elseif(St(i,1) == 22);
            fprintf('v')
        elseif(St(i,1) == 23);
            fprintf('w')
        elseif(St(i,1) == 24);
            fprintf('x')
        elseif(St(i,1) == 25);
            fprintf('y')
        elseif(St(i,1) == 26);
            fprintf('z')
        end
    end  
end

fprintf('\n');
end