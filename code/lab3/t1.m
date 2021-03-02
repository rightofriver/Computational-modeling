clear;
init = [0.6,0.4];
matrix = [0.6,0.4;0.3,0.7];
weather = [];
for i = 1:20
    p = mtimes(init,matrix^i);
    if rand() < p(1)
        weather(i) = 1;
    else
        weather(i) = 2;
    end 
end
weather
state = [];
for j = 1:20
    r = rand();
    if (weather(j) == 1) && (r < 0.6)
        state(j) = 1;
    elseif (weather(j) == 1) && (r > 0.6) && (r < 0.9)
        state(j) = 2;
    elseif (weather(j) == 1) && (r > 0.9)
        state(j) = 3; 
    elseif (weather(j) == 2) && (r < 0.1)
        state(j) = 1;
    elseif (weather(j) == 2) && (r > 0.1) && (r < 0.5)
        state(j) = 2;
    else 
        state(j) = 3;
    end
end
state
