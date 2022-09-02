function A = Grid3d19Mat(n)
% Grid3d19Mat Generate 3-dimensional 19-point finite difference mesh.
%
% [A,xy] = Grid3d19Mat(n) returns a n^3-by-n^3 symmetric positive definite
% matrix A with the structure of the n-by-n-by-n 19-point grid, and an 
% array xy of coordinates for the grid points.

% Jingyu Liu, 2022

% TODO (Jingyu Liu): Also return coordinates.

a1 = blockdiags([-8 60 -8],-1:1,n,n);
a2 = blockdiags ([-1 -8 -1],-1:1,n,n);
a3 = blockdiags([a2,a1,a2],-1:1,n,n);

b1 = blockdiags ([-1 -8 -1],-1:1,n,n);
b2 = -speye(n,n);
b3 = blockdiags([b2,b1,b2],-1:1,n,n);

A = blockdiags ([b3 a3 b3],-1:1,n,n);

end