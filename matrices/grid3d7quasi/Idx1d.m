function [x,y,z] = Idx1d(index,xsize,ysize,zsize)
% Idx1d Convert a 1d-index to a 3d-index.
%
% index = 1 + (x-1) + (y-1)*xsize + (z-1)*xsize*ysize;

tmpindex = index - 1;
x = mod(tmpindex,xsize);
tmpindex = (tmpindex - x)/xsize;
y = mod(tmpindex,ysize);
z = (tmpindex - y)/ysize;

x = x + 1;
y = y + 1;
z = z + 1;

if x < 1 || x > xsize || y < 1 || y > ysize || z < 1 || z > zsize 
    error("Index out of range!!");
end

end