clc;
clear;
close all;

% 1b
xrange = 0:0.01:1;
yrange = f(xrange);

subplot(1, 2, 1);
plot(xrange, yrange);
xlabel('x');
ylabel('f(x)');
legend('f(x)');
hold on
subplot(1, 2, 2);
plot(xrange, f1(xrange), "--", "Color", "green");
legend('f''(x)');

% 1c - implementare metodo di Newton (tangenti)
eps = 10^(-4);

disp('soluzione con punto d''innesco 0.8');
disp(newton(0.8, eps));

disp('soluzione con punto d''innesco 0.3');
disp(newton(0.3, eps));

function result = f(x)
    result = sqrt(x) - 3.*x.^2 + x;
end

function derivative = f1(x)
    derivative = (-6).*x + 1./(2.*sqrt(x)) + 1;
end

function sol = newton(x_0, eps)
    i = 1;
    X(i, 1) = x_0;
    X(i+1, 1) = x_0 - f(x_0)/f1(x_0);
    step = abs(X(i+1, 1) - X(i, 1));
    i = i + 1;

    while(step > eps)
        x_k = X(i, 1);
        X(i+1) = x_k - f(x_k)/f1(x_k);

        step = abs(X(i+1, 1) - X(i, 1));
        i = i + 1;
    end

    sol = X(i);
end