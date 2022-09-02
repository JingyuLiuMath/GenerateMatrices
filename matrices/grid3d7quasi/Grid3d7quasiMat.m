function A = Grid3d7quasiMat(n)
% Grid3d7quasiMat Generate 3-dimensional 7-point finite quasi uniform 
% difference mesh.
%
% [A,xy] = Grid3d7Mat(n) returns a n^3-by-n^3 symmetric positive definite
% matrix A with the structure of the n-by-n-by-n 7-point quasi uniform 
% grid, and an array xy of coordinates for the grid points.

% Jingyu Liu, 2022

% TODO (Jingyu Liu): Also return coordinates.

% Generate grid3d7Mat
a = blockdiags ([-1 6 -1],-1:1,n,n);
I = speye(n,n);
aa = blockdiags ([-I a -I],-1:1,n,n);
II = speye(n^2,n^2);
A = blockdiags ([-II aa -II],-1:1,n,n);

% Disturbance
N = n^3;
tol = 1e-3;
dxyz = rand(N,3)*2*tol-tol;
% dxyz = zeros(N,3); % No disturbance.

[row,col] = find(A);

for i =1:length(row)
    rowi = row(i);
    coli = col(i);
    if rowi ~= coli
        [x1,y1,z1] = Idx1d(rowi,n,n,n);
        [x2,y2,z2] = Idx1d(coli,n,n,n);
        xyz1 = [x1,y1,z1] + dxyz(rowi,:);
        xyz2 = [x2,y2,z2] + dxyz(coli,:);
        A(rowi,coli) = -dist1(xyz1,xyz2);
    end
end

end

