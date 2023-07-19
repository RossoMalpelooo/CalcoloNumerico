clc;
clear;
close all;

nodes = [-1 0 1 2]';
y_nodes = [-0.1 2.03 3.5 6]';
V = fliplr(vander(nodes));
coeff = V \ y_nodes;

xrange = -2.5:0.1:2.5;
yrange = p(xrange, coeff);

subplot(1, 2, 1);
plot(xrange, yrange);
hold on;
plot(nodes, p(nodes, coeff), "*", "Color", "green");
%plot(nodes, 0, "*", "Color", "green");
hold on;
title('grafici');
% minimi quadrati
A = [8 4; 4 12];
b = [22.86 31.2]';
betas = A \ b;
f_ls = @(x) betas(1, 1) + x.*betas(2, 1);
plot(xrange, f_ls(xrange), "--", "Color", "black");
legend('p(x)', 'nodes', 'least squares');

xrange = -1:0.1:2;
subplot(1, 2, 2);
diff = f_ls(xrange) - p(xrange, coeff);
plot(xrange, abs(diff))
title('differenza tra approssimazioni');
grid on;

function res = p(x, coeff)
   res = coeff(1, 1) + coeff(2, 1).*x + coeff(3, 1).*x.^2 + coeff(4, 1).*x.^3;
end