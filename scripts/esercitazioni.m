clc;
clear;
close all;

% Lagrange interpolation from es 7_1
% (alternative to Vandermonde matrix)

nodes = [0.5 0.75 1.5]';
values = f(nodes);

xrange = 0.5:0.1:1.5;

plot(xrange, f(xrange));
hold on;
plot(xrange, l(1, xrange, nodes));
hold on;
plot(xrange, l(2, xrange, nodes));
hold on;
plot(xrange, l(3, xrange, nodes));
hold on;
plot(xrange, p(xrange, nodes), "--");
legend('f', 'l_1', 'l_2', 'l_3', 'p');
grid on;
title('interpolazione polinomiale di Lagrange');

function y = p(x, nodes)
    y = 0;

    for i=1:length(nodes)
        y = y + f(nodes(i, 1)) .* l(i, x, nodes);
    end
end

function y = l(i, x, nodes)
    y = 1;
    for j=1:length(nodes)
        if(j~=i)
            y = y .* (x - nodes(j, 1)) ./ (nodes(i, 1) - nodes(j, 1));
        end
    end
end

function y = f(x)
    y = sin(x.*pi) + 2.*cos(x.*pi);
end
