function [A,xy] = Grid3d7plusMat(n)
% Grid3d7plusMat Generate 3-dimensional 7-point finite difference mesh with
% postive disturbance.
%
% [A,xy] = Grid3d7plusMat(n) returns a n^3-by-n^3 symmetric positive 
% definite matrix A with the structure of the n-by-n-by-n 7-point grid plus
% a positive disturbance, and an array xy of coordinates for the grid 
% points.

delta = 0.1;

[A,xy] = grid3d(n);
A = A + delta*speye(size(A)); 

end

