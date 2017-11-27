%% Computes distance between point and vector
function dist = distance( P1, P2 )
  dist = [];
  for i = 1:length(P2)
    dist = [dist sqrt((P1(1)-P2(i,1))^2 + (P1(2)-P2(i,2))^2)];
end  % function
