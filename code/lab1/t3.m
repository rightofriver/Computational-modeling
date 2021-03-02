clear
NUM = [];
for i = 1:3
    NUM = [NUM,poissrnd(4)];
end
Total = sum(NUM)
NUM

clear
NUM = [];
TIME = [];
Total = 0;
while Total <= 3
    random = exprnd(1/4);
    NUM = [NUM,random];
    Total = random + Total;
    TIME = [TIME,Total];
end
TIME
