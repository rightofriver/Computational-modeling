clear
MEAN = [];
VAR = [];
NUM = [];
for i = 1:1000
    X = normrnd(10,sqrt(5),1,i);
    MEAN = [MEAN,mean(X)];
    VAR = [VAR,var(X)];
    NUM = [NUM,i];
end
plot(NUM,MEAN,NUM,VAR);
