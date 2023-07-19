%27/05/2023

% ----------- MAIN ---------------------

clc;
clear;
close all;

disp('------------ parte a ------------');

coeff = [1 -10 35 -50 24]';
ROOTS = roots(coeff)

disp('------------ parte b ------------');

xrange = [-5:0.1:10]';
yrange = pol(xrange);

plot(xrange, yrange);
ylim([-2 4]);
hold on
plot(pol(ROOTS), "*")

xlabel('x');
ylabel('p(x)');
title('polinomio scheda');
disp('  grafico creato ');

disp('------------ parte c ------------');
coeff_e = coeff;
coeff_e(1) = coeff_e(1) + 10^(-8);

roots_e = roots(coeff_e)
relative_error = norm(roots_e - ROOTS) / norm(ROOTS)

% ------------ FUNZIONI ----------------
function result = pol(x)
    x
    result = x.^4 - 10.*x.^3 + 35.*x.^2 - 50.*x + 24
end