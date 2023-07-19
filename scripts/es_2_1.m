clc
clear
close all;

m = createMatrix(3);

disp(m);

function M = createMatrix(dim)
    M = zeros(dim, dim);

    x1 = 1:1:dim;
    x2 = linspace(0, dim*(dim-1), dim);

    M = M + x1;
    M = M + x2';
end