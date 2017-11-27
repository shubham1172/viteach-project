%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cluster data based on centroids - custom algorithm   %
% Start with a random point, add points to the cluster %
% add till it reaches a threshold weight.              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all;

%% FINAL DATA
KITCHEN_X = [20.840249];
KITCHEN_Y = [73.065424];
NO_STUDENTS_PER_CLUSTER = 2000;

%% LOAD DATA
load('location.mat')
data_backup = data; % replenish data again
% loads into var data               %
% data(:, 1) gives X                %
% data(:, 2) gives Y                %
% data(:, 3) gives beneficiary data %

hold on;
%% PLOT THE SCHOOLS
scatter(data(:,1),data(:,2),'g');

%% PLOT THE KITCHEN
scatter(KITCHEN_X, KITCHEN_Y, 'r')

fprintf('Schools listed. Press enter to continue...\n');
pause;

%% SELECT RANDOM POINTS AND CLUSTERIZE
figure;
while 1
  %% CLUSTERIZE
  data = data_backup; % replenish data
  i = round(rand(1,1)*length(data(:, 1))); % random point index
  total = data(i, 3); cent = data(i, 1:2);
  to_plot = [cent]; % add centroid to list
  data(i,:) = []; % remove from list
  while total<NO_STUDENTS_PER_CLUSTER
    d = distance(cent, data(:,1:2)); % distance vector
    [c ind] = min(d); % select minimum distance
    total = total + data(ind, 3); % add beneficiary data
    to_plot = [to_plot; [data(ind, 1:2)]]; % add data to plot
    data(ind,:) = []; % remove from list
    cent = centroid(to_plot); % choose new centroid
  end
  scatter(to_plot(:,1), to_plot(:,2)) % plot cluster data
  axis([20.5 21.1 72.7 73.5]); % select custom axis scale
  fprintf('Press enter for more...\n');
  pause;
end
