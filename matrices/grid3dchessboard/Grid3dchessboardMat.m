function A = Grid3dchessboardMat(n)
% Grid3d19Mat Generate 3-dimensional chessboard matrix.

% A is from following elliptic PDE:
%  - \nabla \cdot ( a(x) \nabla u(x) ) + b(x) u(x) = f(x), x in (0,1)^3.
% where a(x) = 
% and b(x) = 0.1.

% Jingyu Liu, 2022

% TODO (Jingyu Liu): Also return coordinates.

% Generate grid3d7Mat
aI = blockdiags ([-1 6 -1],-1:1,n,n);
I = speye(n,n);
aII = blockdiags ([-I aI -I],-1:1,n,n);
II = speye(n^2,n^2);
Apattern = blockdiags ([-II aII -II],-1:1,n,n);
[row,col] = find(Apattern);

% Disturbance
N = n^3;
A = sparse(N,N);
B = 0.1 * speye(N);

for it =1:length(row)
    rowi = row(it);
    coli = col(it);
    if rowi ~= coli
        [i1,j1,k1] = Idx1d(rowi,n,n,n);
        [i2,j2,k2] = Idx1d(coli,n,n,n);
        if mod(i1 + j1 + k1, 14) < 7
            a1 = 1000;
        else
            a1 = 0.1;
        end
        if mod(i2 + j2 + k2, 14) < 7
            a2 = 1000;
        else
            a2 = 0.1;
        end
        a = (a1 + a2)/2;
        A(rowi,coli) = -a;
        A(rowi,rowi) = A(rowi,rowi) + a;
    end
end

A = A + B;

end