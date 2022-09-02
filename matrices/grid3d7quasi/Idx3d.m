function index = Idx3d(i,j,k,xsize,ysize,zsize)
% Idx3d Convert a 3d-index to a 1d-index.

if i >= 1 && i <= xsize && j >= 1 && j <= ysize && k >= 1 && k <= zsize 
    index = 1 + (i-1) + (j-1)*xsize + (k-1)*xsize*ysize;
else
    index = 0;
end

end