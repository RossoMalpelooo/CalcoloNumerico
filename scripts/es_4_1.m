clc;
clear;
close all;

num = 10;

disp('numero ' + string(num) + ' della successione di Fibonacci = ');
fib_array = Fib(num);
disp(fib_array(num));

max = 100;
xrange = 2:1:max-1;
fib_yrange = zeros(max-2, 1);
fib_array = Fib(max);
for i = xrange
    fib_yrange(i-1, 1) = fib_array(i-1, 1) * fib_array(i+1, 1) - fib_array(i, 1)^2;
end

lim_yrange = zeros(max-2, 1);
for i = xrange-1
    lim_yrange(i, 1) = (-1)^(i+1);
end

plot(xrange, fib_yrange);
hold on
plot(xrange, lim_yrange, "--" , "Color", "green");
title("function compare");
xlabel("x");
ylabel("f(x), g(x)");

legend("Fib(n-1)Fib(n+1) - Fib(n)^2", "(-1)^{n+1}");

format long e;
disp('diff = ');
disp(lim_yrange - fib_yrange);
% risultati discostanti sono causati dal
% mal condizionamento dell'operazione somma

function result = Fib(n)
    fib = zeros(n, 1);
    fib(1, 1) = 1;
    fib(2, 1) = 1;

    for i=3:n
        fib(i, 1) = fib(i-1, 1) + fib(i-2, 1);
    end

    result = fib;
end