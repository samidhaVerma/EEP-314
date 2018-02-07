%% ASSIGNMENT 3 - SAMIDHA MRIDUL VERMA 2015UEE1434

a = [0.007 0.008 0.009];
b = [7 6.3 6.8];
c = [200 180 140];
Pgmin = [10 10 10];
Pgmax = [85 80 70];
Pg = [0 0 0];
Pd = 140;

lambda = 8.2;
delLambda = 0.0001;
e = 0.1;
delP = 1;
noOfIterations = 1;

while (delP > e)
noOfIterations = noOfIterations + 1;
sum = 0;
    for i=1:3
        Pg(i) = (lambda - b(i))/(2*a(i));
        if (Pg(i) > Pgmax(i))
            Pg(i) = Pgmax(i);
        else if (Pg(i) < Pgmin(i))
            Pg(i) = Pgmin(i);
            end
        end
        sum = sum + Pg(i);
        cost(i) = (a(i))*(Pg(i).^(2)) + (b(i))*(Pg(i)) + c(i);
    end
    
    delP = sum - Pd;
    
    if (delP < e)
        break;
    end
   if (delP > 0)
        lambda = lambda - delLambda;
    else
        lambda = lambda + delLambda;
   end
end

disp(Pg);
disp(cost);
disp(noOfIterations);



