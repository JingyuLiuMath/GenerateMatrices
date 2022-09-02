function [A,xy] = Grid3d7Mat(n)
% Grid3d7Mat Generate 3-dimensional 7-point finite difference mesh.
%
% [A,xy] = Grid3d7Mat(n) returns a n^3-by-n^3 symmetric positive definite
% matrix A with the structure of the n-by-n-by-n 7-point grid, and an 
% array xy of coordinates for the grid points.

% Jingyu Liu, 2022

[A,xy] = grid3d(n);

end

