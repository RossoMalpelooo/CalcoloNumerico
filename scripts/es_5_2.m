% 15/07/2022

clc;
clear;
close all;

range = [-1:0.01:1]';

plot(range, f(range));
title('f(x)');

int_area = 0;
for i = 1:length(range)-1
    a = range(i, 1);
    b = range(i+1, 1);

    local_area = (b-a)*(f(a)+f(b))/2;
    int_area = int_area + local_area;
end

disp('stima integrale = ');
disp(int_area);

disp('stima integrale con comando <quad> =');
q = quad(@(x) f(x), -1, 1);
disp(q);

% tabella decadimento errore [...]

function y = f(x)
    y = 1 + (exp(-x.^2))./2;
end