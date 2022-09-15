function g = ChessBoard2D(n)

g = zeros(n,n);

offset = n / 8;

for i = 1:n
    for j = 1:n
        i1 = floor((i-1)/offset);
        j1 = floor((j-1)/offset);
        if mod(i1 + j1, 2) == 0
            g(i,j) = 1000;
        else
            g(i,j) = 0.1;
        end
    end
end

image(g);
