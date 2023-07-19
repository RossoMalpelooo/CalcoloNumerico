clear;
clc;
close all;

% rappresentazione matrice di hilbert
% H_ij = (i+j-1)^(-1)

dim = 100;
H=eye(dim);

for i=1:dim 
    for j=1:dim
        H(i, j) = 1/(i+j-1);
    end
end 

disp('Matrice di Hilbert creata:');
disp(H);

disp('Matrice di Hilbert con Matlab:');
disp(hilb(100));

