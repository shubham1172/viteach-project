%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cluster data based on centroids - custom algorithm   %
% Start clustering with points from last_schools.mat   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all;

%% FINAL DATA
KITCHEN_X = [20.840249];
KITCHEN_Y = [73.065424];
NO_STUDENTS_PER_CLUSTER = 2000;

%% COLORS
colormap = [hot(30); winter(30); summer(30); cool(30)];
randRows = randi(size(colormap, 1), [28, 1]);
randCols = colormap(randRows, :);

%% LOAD DATA
load('location.mat');
load('last_schools.mat');
% loads into var data                    %
% data(:, 1) gives X                     %
% data(:, 2) gives Y                     %
% data(:, 3) gives beneficiary data      %
% last_schools gives points for starting %

hold on;
%% PLOT THE SCHOOLS
scatter(data(:,1),data(:,2),'g');

%% PLOT THE KITCHEN
scatter(KITCHEN_X, KITCHEN_Y, 'r')

fprintf('Schools listed. Press enter to continue...\n');
pause;

%% GENERATE CLUSTERS
figure;
hold on;
to_save = [];
for counter=1:length(last_schools)
  %% CLUSTERIZE
  i = last_schools(counter,3); % select index
  to_plot = [];
  if(length(data)<i)
    i = 1;
  end;
  total = data(i, 3); cent = data(i, 1:2);
  to_plot = [cent]; % add centroid to list
  data(i,:) = []; % remove from list
  while total<NO_STUDENTS_PER_CLUSTER
    d = distance(cent, data(:,1:2)); % distance vector
    [c ind] = min(d); % select minimum distance
    total = total + data(ind, 3); % add beneficiary data
    to_plot = [to_plot; [data(ind, 1:2)]]; % add data to plot
    to_save = [to_save; [counter data(ind, 1:2)]];
    data(ind,:) = []; % remove from list
    cent = centroid(to_plot); % choose new centroid
  end
  scatter(to_plot(:,1), to_plot(:,2), [], randCols(counter)) % plot cluster data
end
axis([20.5 21.1 72.7 73.5]); % select custom axis scale
