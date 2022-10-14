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

% Chessboard.
N = n^3;
offset = n / 8;
B = 0.1 * speye(N);

ivec = zeros(7*N,1);
jvec = zeros(7*N,1);
vvec = zeros(7*N,1);
itt = 0;

for it =1:length(row)
    rowi = row(it);
    coli = col(it);
    if rowi ~= coli
        [i1,j1,k1] = Idx1d(rowi,n,n,n);
        i1 = floor((i1-1)/offset);
        j1 = floor((j1-1)/offset);
        k1 = floor((k1-1)/offset);
        [i2,j2,k2] = Idx1d(coli,n,n,n);
        i2 = floor((i2-1)/offset);
        j2 = floor((j2-1)/offset);
        k2 = floor((k2-1)/offset);
        if mod(i1 + j1 + k1, 2) == 0
            a1 = 1000;
        else
            a1 = 0.1;
        end
        if mod(i2 + j2 + k2, 2) == 0
            a2 = 1000;
        else
            a2 = 0.1;
        end
        a = (a1 + a2)/2;
        itt = itt + 1;
        ivec(itt) = rowi;
        jvec(itt) = coli;
        vvec(itt) = -a;
    end
end
A = sparse(ivec(1:itt), jvec(1:itt), vvec(1:itt));
dA = sparse(1:N, 1:N, sum(A,2)); % dA is a negative diagonal matrix.
A = A - dA;
A = A + B;

end