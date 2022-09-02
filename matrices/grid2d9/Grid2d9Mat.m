function [A,xy] = Grid2d9Mat(n)
% Grid2d5Mat Generate 2-dimensional 9-point finite difference mesh.
%
% [A,xy] = Grid3d5Mat(n) returns a n^2-by-n^2 symmetric positive definite
% matrix A with the structure of the n-by-n 9-point grid, and an array xy 
% of coordinates for the grid points.

% Jingyu Liu, 2022

[A,xy] = grid9(n);

end

