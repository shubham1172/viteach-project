%% Computes centroid of a vector of points
function cent = centroid( V )
  cent = [sum(V(:,1))/length(V) sum(V(:,2))/length(V)];
end  % function
