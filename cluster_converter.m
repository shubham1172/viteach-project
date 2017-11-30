% Converts cluster csv into mat data file
clc; clear all;
raw1 = csvread('clusterdata.csv');
raw2 = csvread('routedetails.csv');
route_nos = raw1(:,2)(2:end);
S = raw1(:,1)(2:end);
X = raw1(:,7)(2:end);
Y = raw1(:,8)(2:end);
time_routes = sortrows([(1:length(raw2))' raw2(:,8)], 2);
data = [route_nos X Y S];
save('clusterdata.mat','data', 'time_routes')
