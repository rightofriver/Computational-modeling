clear;
birth = 0.05;
death = 0.03;
x = [];
x(1) = 0;
t = [];
t(1) = 0;
i = 0;
num = 0;
j = 2;
while i < 1000
    t1 = exprnd(1/birth);
    t2 = exprnd(1/death);
    if t1 < t2
        num = num + 1;
        i = i + t1;
        x(j) = num;
        t(j) = i;
    else 
        num = num - 1;
        i = i + t2;
        x(j) = num;
        t(j) = i;
    end
    j = j + 1;
end
plot(t,x)
