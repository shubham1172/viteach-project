%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Plot last schools of each cluster   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('clusterdata.mat'); % data and time_routes imported

last_schools = [];

%% FINAL DATA
KITCHEN_X = [20.840249];
KITCHEN_Y = [73.065424];
figure;
hold on;
test = 1;
plot(KITCHEN_X, KITCHEN_Y, 'MarkerSize', 10, 'Marker', '*', 'Color', 'b');
for i = 2:length(data),
  if(data(i,1)~=data(i-1,1))
    plot(data(i-1,2), data(i-1,3), 'MarkerSize', 10, 'Marker', '*', 'Color', 'r');
    last_schools = [last_schools; data(i-1,2:end)];
    disp(test);
    test = 1;
  else
    test = test+1;
  end
end
plot(data(end,2), data(end,3), 'MarkerSize', 10, 'Marker', '*', 'Color', 'r');
last_schools = [last_schools; data(i,2:end)];
axis([20.5 21.1 72.7 73.5]); % select custom axis scale
set(gca,'Color','k');
