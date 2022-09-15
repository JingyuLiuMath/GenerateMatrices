function g = ChessBoard3D(n)

N = n^3;

g = zeros(n,n,n);

offset = n / 8;

for i = 1:n
    for j = 1:n
        for k = 1:n
            i1 = floor((i-1)/offset);
            j1 = floor((j-1)/offset);
            k1 = floor((k-1)/offset);
            if mod(i1 + j1 + k1, 2) == 0
                g(i,j,k) = 1000;
            else
                g(i,j,k) = 0.1;
            end
        end
    end
end

% xid = 1:n;
% yid = 1:n;
% zid = 1:n;
% [xco,yco,zco] = meshgrid(xid,yid,zid);
% % h = slice(xco,yco,zco,g,xid,yid,zid);
% camproj perspective
% box on

figure(1);
disp(" yz ")
image(reshape(g(1,:,:),[n,n]));
figure(2);
disp(" xz ")
image(reshape(g(2,:,:),[n,n]));
figure(3);
disp(" xy ")
image(reshape(g(3,:,:),[n,n]));