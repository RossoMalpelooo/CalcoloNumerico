% 31/05/2023

clc;
clear;
close all;

%2) calcolo coefficienti
range = 0.5:0.01:1.5;

nodes = [0.5 0.75 1.5]';
y_nodes = f(nodes)

coeff = fliplr(vander(nodes)) \ y_nodes;

%3) grafico errore commesso
plot(range, abs(p(range, coeff) - f(range)));
hold on;
plot(nodes, abs(p(nodes, coeff) - f(nodes)), "*", "Color", "green");
title("interpolation error (green nodes)");
xlabel('x');
ylabel('error');
grid on;

% grafico di p(x) e f(x)
%{
plot(range, f(range));
hold on;
plot(range, p(range, coeff), "--");
legend('f', 'p');
title('vandermonde interpolation');
grid on;
%}

%5) Gauss-Seidel
size = length(y_nodes);
gs_coeff = zeros(size, 1)+1;
old_coeff = gs_coeff;
A = fliplr(vander(nodes));
eps = 1/10^4;
step = 1;   %any value greater than eps

while(step > (zeros(size, 1)+1).*eps)
    for i=1:size
        sum = 0;
        for j=1:size
            if(j~=i)
                sum = sum + A(i, j)*gs_coeff(j, 1);
            end
        end
        old_coeff(i, 1) = gs_coeff(i, 1);
        gs_coeff(i, 1) = 1/A(i, i) * (y_nodes(i, 1) - sum);
    end

    step = abs(gs_coeff - old_coeff);
end

gs_coeff

%8) stima funzione con trapezi
x0 = nodes(1, 1);
x1 = nodes(2, 1);
x2 = nodes(3, 1);

int = (x1-x0)*(f(x1)+f(x0))/2 + (x2-x1)*(f(x2)+f(x1))/2

%9) calcolo errore commesso
int_ref = 0;
xnodes = [0.5:0.1:1.5]';
for i=1:length(xnodes)-1
    a = xnodes(i, 1);
    b = xnodes(i+1, 1);
    int_ref = int_ref + (b-a)*(f(a)+f(b))/2;
end

error = int_ref - int

function y = f(x)
    y = sin(pi.*x) + 2.*cos(pi.*x);
end

function y = p(x, coeff)
    y = 0;

    for i=1:length(coeff)
        y = y + coeff(i, 1).*x.^(i-1);
    end
end