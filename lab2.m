syms x

% --- Завдання 1 ---
% --- Границя 1 ---
f1 = (log(1 - x + x^2) - acos(3*x)) / (tan(x) + sin(2*x) + 1);
limit1 = limit(f1, x, 0);

% --- Границя 2 ---
f2 = (1 - 2^x) / x;
limit2 = limit(f2, x, inf);

disp('Границя 1 =');
disp(limit1);

disp('Границя 2 =');
disp(limit2);


syms x

%% Завдання 2
%% Функція 1
f1 = asin(x) / sin(x);

f1_1 = diff(f1, x); 
f1_3 = diff(f1, x, 3);

disp('Перша похідна f1 =');
pretty(f1_1)

disp('Третя похідна f1 =');
pretty(f1_3)

%% Функція 2
f2 = (1 - 5^(-x)) / x^3;

f2_1 = diff(f2, x);      % перша похідна
f2_3 = diff(f2, x, 3);   % третя похідна

disp('Перша похідна f2 =');
pretty(f2_1)

disp('Третя похідна f2 =');
pretty(f2_3)




%% Завдання 3
syms x

% 1)
I1_pos = simplify((2/3)*x^(3/2)*log(x) - (4/9)*x^(3/2));
I1_neg = simplify(-(2/3)*x^(3/2)*log(x) + (4/9)*x^(3/2));

disp('Антипохідна для x>1:');
pretty(I1_pos)
disp('Антипохідна для 0<x<1:');
pretty(I1_neg)

% 2)
f = (3*x^2 + 5)*cos(2*x);
I2 = int(f, x, 0, pi);
disp('Значення визначеного інтегралу:');
pretty(simplify(I2))

%% Завдання 4
syms x

f = sin(x);

T = taylor(f, x, 0, 'Order', 10);
disp('Ряд Тейлора sin(x) біля 0 до 5-го члена:')
pretty(T)


