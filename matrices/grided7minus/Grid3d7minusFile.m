%% test
% nvec = [16];
%% On the server
run("/home/jyliu/GenerateMatrices/meshpart/meshpart_startup.m")
nvec = [16,32,64,128,256];
%% Main
for it = 1:length(nvec)
    n = nvec(it);
    A = Grid3d7minusMat(n);
    
    % Store matrix.
    [i,j,val] = find(A);
    i = i-1;
    j = j-1;
    fid_mat = fopen("A_grid3d7minus_" + int2str(n) + ".txt", 'w');
    fprintf(fid_mat,'%d\n',size(A,1));
    for t = 1:length(i)
        fprintf(fid_mat,'%d  %d  %3f\n',i(t),j(t),val(t));
    end
    fclose(fid_mat);
    
    % Store x and b = Ax.
    m = size(A,1);
    x = ones(m,1);
    b = A*x;
    fid_x = fopen("x_grid3d7minus_" + int2str(n) + ".txt", 'w');
    for t = 1:length(x)
        fprintf(fid_x,'%3f \n',x(t));
    end
    fclose(fid_x);
    fid_b = fopen("b_grid3d7minus_" + int2str(n) + ".txt", 'w');
    for t = 1:length(b)
        fprintf(fid_b,'%3f \n',b(t));
    end
    fclose(fid_b);
end
