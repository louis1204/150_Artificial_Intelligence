function hw4 = hw4(xs, ys)
    %xs = txt2mat('X.dat.txt');
    %ys = txt2mat('Y.dat.txt');

    T = 12000;
    n = 18;
    pi = zeros(n,1);
    L = zeros(65, 1);
    
    for a=1:n
        pi(a, 1) = 0.2;
    end
    
    probRes = 0;
    
    for a = 1: 65
        if(a~=1)
            for i=1:n
                for t = 1: T
                    probRes = probRes + (ys(t,1)*pi(i, 1)*xs(t, i)/ CalcNoisyOr(1, n, t, xs, pi, 1));
                end
                pi(i,1) = probRes/sum(xs(:,i));
                probRes = 0;
                fprintf('iteration %d. p_%d : %f\n', a-1, i, pi(i,1));
            end
        end
    
        for t = 1: T
            L(a,1) = L(a,1) + log(CalcNoisyOr(1, n, t, xs, pi, ys(t,1)));
        end
        fprintf('L #%d : %f\n\n', a-1, L(a,1))
    end
    
end

function CalcNoisyOr = CalcNoisyOr(start, finish, t, xs, pi, y)
        res = 1;
        for j = start: finish
            res = res*((1 - pi(j)) ^ xs(t,j));
        end
        
        if(y == 1)
            CalcNoisyOr = 1 - res;
        else        
            CalcNoisyOr = res;
        end
end