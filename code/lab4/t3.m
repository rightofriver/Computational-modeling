clear;
x = [0.697,0.774,0.634,0.608,0.556,0.403,0.481,0.437,0.666,0.243,0.245,0.343,0.639,0.657,0.360,0.593,0.719,0.359,0.339,0.282,0.748,0.714,0.483,0.478,0.525,0.751,0.532,0.473,0.725,0.446];
y = [0.460,0.376,0.264,0.318,0.215,0.237,0.149,0.211,0.091,0.267,0.057,0.099,0.161,0.198,0.370,0.042,0.103,0.188,0.241,0.257,0.232,0.346,0.312,0.437,0.369,0.489,0.472,0.376,0.445,0.459];
data = [x;y]';
k = 3;
m = 30;
alpha = [1/3,1/3,1/3];
sigma1 = [0.1,0.0;0.0,0.1];
sigma2 = [0.1,0.0;0.0,0.1];
sigma3 = [0.1,0.0;0.0,0.1];
mu1 = data(6,:);mu2 = data(22,:);mu3= data(27,:);
for iter = 1:50
    gamma1 = [];gamma2 = [];gamma3 =[];
    for j = 1:m
        gamma1(j) = alpha(1)*mvnpdf(data(j,:),mu1,sigma1)/(alpha(1)*mvnpdf(data(j,:),mu1,sigma1)+alpha(2)*mvnpdf(data(j,:),mu2,sigma2)+alpha(3)*mvnpdf(data(j,:),mu3,sigma3));
        gamma2(j) = alpha(2)*mvnpdf(data(j,:),mu2,sigma2)/(alpha(1)*mvnpdf(data(j,:),mu1,sigma1)+alpha(2)*mvnpdf(data(j,:),mu2,sigma2)+alpha(3)*mvnpdf(data(j,:),mu3,sigma3));
        gamma3(j) = alpha(3)*mvnpdf(data(j,:),mu3,sigma3)/(alpha(1)*mvnpdf(data(j,:),mu1,sigma1)+alpha(2)*mvnpdf(data(j,:),mu2,sigma2)+alpha(3)*mvnpdf(data(j,:),mu3,sigma3));
    end
    total1 = [0,0];total2 = [0,0];total3 = [0,0];
    total21 = [0,0;0,0];total22 = [0,0;0,0];total23 = [0,0;0,0];
    alpha(1) = sum(gamma1)/m;alpha(2) = sum(gamma2)/m;alpha(3) = sum(gamma3)/m;
    for j = 1:m
        total1 = total1 + gamma1(j).*data(j,:);
        total2 = total2 + gamma2(j).*data(j,:);
        total3 = total3 + gamma3(j).*data(j,:);
    end
    mu1 = total1/sum(gamma1);mu2 = total2/sum(gamma2);mu3 = total3/sum(gamma3);
    for j = 1:m
        total21 = total21 + gamma1(j).*((data(j,:)-mu1)'*(data(j,:)-mu1));
        total22 = total22 + gamma2(j).*((data(j,:)-mu2)'*(data(j,:)-mu2));
        total23 = total23 + gamma3(j).*((data(j,:)-mu3)'*(data(j,:)-mu3));
    end
    sigma1 = total21/sum(gamma1);sigma2 = total22/sum(gamma2);sigma3 = total23/sum(gamma3);
end
groupx1 = [];groupx2 = [];groupx3 = [];
groupy1 = [];groupy2 = [];groupy3 = [];
for n = 1:m
    A = [gamma1(n),gamma2(n),gamma3(n)];
    if gamma1(n) == max(A)
        groupx1 = [groupx1,data(n,1)];
        groupy1 = [groupy1,data(n,2)];
    elseif gamma2(n) == max(A)
        groupx2 = [groupx2,data(n,1)];
        groupy2 = [groupy2,data(n,2)];
    else
        groupx3 = [groupx3,data(n,1)];
        groupy3 = [groupy3,data(n,2)];
    end
end
scatter(groupx1,groupy1,'r','filled')
hold on
scatter(groupx2,groupy2,'b','filled')
hold on
scatter(groupx3,groupy3,'g','filled')
