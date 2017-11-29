%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualize the current data according to time         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all;
load('clusterdata.mat'); % copies route_nos, X, Y in data, time_routes

KITCHEN_X = [20.840249];
KITCHEN_Y = [73.065424];

%% COLORS
length = length(time_routes)*5;
red = [1, 0, 0];
white = [1, 1, 1];
colors = [linspace(white(1), red(1), length)', linspace(white(2), red(2), length)', linspace(white(3), red(3), length)'];
colors = colors(1:5:end, :);
%% PLOT
plot(KITCHEN_X, KITCHEN_Y, 'Color', 'b', 'Marker', '*', 'MarkerSize', 10);
hold on
for i = 1:size(data,1)
  plot(data(i,2), data(i,3), 'Color', colors(find(time_routes==data(i,1)), :), 'Marker', '*');
end
axis([20.5 21.1 72.7 73.5]); % select custom axis scale
set(gca,'Color','k')
