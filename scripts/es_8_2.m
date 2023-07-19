%28/06/2022

clc;
clear;
close all;

A = [1 1 1; -1 2 0.2; 1 -0.1 2];
b = [1 2 3]';
x_k = zeros(3, 1);
x_k1 = zeros(3, 1);

eps = 10^(-3) .* ones(length(x_k), 1);
gap = 10^(-2) .* ones(length(x_k), 1);  %any value greater than eps

while(abs(gap) > eps)
    %disp('iterazione');
    for i=1:length(x_k)
        sum = 0;
        for j=1:length(x_k)
            if(j ~= i)
                sum = sum + A(i, j) * x_k(j, 1);
            end
        end
    
        x_k1(i, 1) = 1/A(i, i) * (b(i, 1) - sum);
    end

    gap = x_k1 - x_k;
    x_k = x_k1;
end

disp('soluzione esatta:');
x = A \ b

disp('soluzione approssimata con Jacobi:')
x_k1