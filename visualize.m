%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualize the current data and analyze the scenario  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all;
load('clusterdata.mat'); % copies route_nos, X, Y in data, time_routes

KITCHEN_X = [20.840249];
KITCHEN_Y = [73.065424];

%% COLOR MAPS
colormap = [hot(15); winter(15); summer(15); cool(15)];
randRows = randi(size(colormap, 1), [28, 1]);
randCols = colormap(randRows, :);
%% PLOT
plot(KITCHEN_X, KITCHEN_Y, 'Color', 'k', 'Marker', 'd');
hold on
for i = 1:length(data)
  plot(data(i,2), data(i,3), 'Color', randCols(data(i,1), :), 'Marker', '*');
end
axis([20.5 21.1 72.7 73.5]); % select custom axis scale
