clc;
clear;
close all;

dim = 10;

A = eye(dim, dim) .* 199 + 1

if(check_simmetry(A, dim) == 1)
    disp('simmetria rilevata');

    if(check_positive_definition(A) == 1)
        disp('matrice definita positiva');
    end
end

disp(' ');

[R, flag] = chol(A);
flag

A_1 = R' * R;

if(A_1 == A)
    disp('risultato corretto (R'' * R = A)');
end

L = zeros(dim, dim);

for i = 1:dim
    for j = 1:dim
        sum = 0;
        if(i == j) 
            for k = 1:j-1
                sum = sum + A(j, k) * A(j, k);
            end

            L(i, j) = sqrt(A(i, j) - sum);
        elseif(i > j)
            for k = 1:j-1
                sum = sum + L(i, k) * L(j, k);
            end

            L(i, j) = (A(i, j) - sum) / L(j, j);
        end
    end
end

disp('Errore assoluto nel procedimento manuale: ')
disp(L-R');

% l'errore è nell'algoritmo scritto e non nella funzione Chol,
% questo si può notare dal fatto che L*L' non è uguale ad A,
% mentre R'*R è esattamente uguale.

function result = check_simmetry(A, size)
    diff = A - transpose(A);

    zero = zeros(size)*zeros(size)';

    if(diff == zero)
        result = 1;
    else
        result = 0;
    end
end

function result = check_positive_definition(A)
    result = 1;
    eigen = eig(A);

    for e = eigen
        if(e < 0)
            result = 0;
            break;
        end
    end
end