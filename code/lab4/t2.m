clear;
possion = 0.05;
x = [];
x(1) = 0;
t = [];
t(1) = 0;
i = 0;
num = 0;
j = 2;
while i < 10000
    t1 = exprnd(1/possion);
    num = num + 1;
    i = i + t1;
    x(j) = num;
    t(j) = i;
    j = j + 1;
end
event1 = 0;
event2 = 0;
fre = 0;
m = 0;
dt = 2;
total = 10000/dt;
for k = 0:total-1
    for l = 1:num-m
        if t(l) > dt*(k+1)
            break;
        elseif t(l) >= dt*k && t(l) <= dt*(k+1)
            t(l) = [];
            m = m + 1;
            fre = fre + 1;
        else
            t(l) = [];
            m = m + 1;
        end
    end
    if fre == 0
        continue;
    elseif fre == 1
        event1 = event1 + 1;
    else
        event2 = event2 + 1;
    end
    fre = 0;
end
p1 = event1/total 
p2 = event2/total 
