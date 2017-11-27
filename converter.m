% Converts csv into mat data file
clc; clear all;
raw = csvread("test.csv");
X = raw(:,7)(2:end);
Y = raw(:,8)(2:end);
Z = raw(:,6)(2:end);
XX = []; YY = []; ZZ = [];
hold on
k = 0;
for i = 1:size(X)
  if(X(i)<30)
    plot(X(i),Y(i))
    XX = [XX;X(i)];
    YY = [YY;Y(i)];
    ZZ = [ZZ;Z(i)]
    k = k+1;
  else
    fprintf("%f %f %d\n", X(i), Y(i), k);
  end
end
disp(k);
data = [XX YY ZZ]
save('location.mat','data')
