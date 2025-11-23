% =====================================================
% Практична робота №5, Варіант 12
% Завдання 2: Побудова апроксиманти методом найменших квадратів
% Розподіл кількості стовбурів в лісових культурах
% за природними ступенями товщини
% =====================================================

clear all;
clc;

% Вхідні дані для варіанту 12
% Діаметр кор. шийки (см)
x = [0.6, 0.7, 0.8, 0.9, 1.0, 1.1];
% Кількість дерев (шт)
y = [15000, 1400, 1300, 1200, 1100, 1000];

disp('========================================');
disp('ЗАВДАННЯ 2: АПРОКСИМАЦІЯ МЕТОДОМ НАЙМЕНШИХ КВАДРАТІВ');
disp('========================================');
disp('Вхідні дані:');
disp('Діаметр кор. шийки (xi, см):');
disp(x);
disp('Кількість дерев (yi, шт):');
disp(y);

% =====================================================
% Побудова графіка експериментальних даних
% =====================================================
figure('Position', [100, 100, 1400, 800]);

subplot(2,3,1);
plot(x, y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
grid on;
title('Експериментальні дані', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Діаметр, см', 'FontSize', 10);
ylabel('Кількість дерев, шт', 'FontSize', 10);

% =====================================================
% 1. ЛІНІЙНА АПРОКСИМАЦІЯ: y = ax + b
% =====================================================
disp(' ');
disp('========================================');
disp('1. ЛІНІЙНА АПРОКСИМАЦІЯ: y = ax + b');
disp('========================================');

n = length(x);
Sx = sum(x);
Sy = sum(y);
Sxx = sum(x.^2);
Sxy = sum(x.*y);

% Матриця системи для лінійної апроксимації
A_lin = [Sxx, Sx; Sx, n];
B_lin = [Sxy; Sy];

% Розв'язок системи
coeffs_lin = A_lin\B_lin;
a_lin = coeffs_lin(1);
b_lin = coeffs_lin(2);

fprintf('Коефіцієнти: a = %.2f, b = %.2f\n', a_lin, b_lin);
fprintf('Рівняння: y = %.2f*x + %.2f\n', a_lin, b_lin);

% Обчислення апроксимованих значень
y_lin = a_lin*x + b_lin;

% Обчислення суми квадратів відхилень
S_lin = sum((y - y_lin).^2);
fprintf('Сума квадратів відхилень S = %.2f\n', S_lin);

% Графік лінійної апроксимації
x_plot = linspace(min(x)-0.05, max(x)+0.05, 100);
y_lin_plot = a_lin*x_plot + b_lin;

subplot(2,3,2);
plot(x, y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
hold on;
plot(x_plot, y_lin_plot, 'b-', 'LineWidth', 2);
grid on;
title('Лінійна апроксимація', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Діаметр, см', 'FontSize', 10);
ylabel('Кількість дерев, шт', 'FontSize', 10);
legend('Дані', sprintf('y=%.1fx+%.1f', a_lin, b_lin), 'Location', 'best');
hold off;

% =====================================================
% 2. КВАДРАТИЧНА АПРОКСИМАЦІЯ: y = ax^2 + bx + c
% =====================================================
disp(' ');
disp('========================================');
disp('2. КВАДРАТИЧНА АПРОКСИМАЦІЯ: y = ax^2 + bx + c');
disp('========================================');

Sx2 = sum(x.^2);
Sx3 = sum(x.^3);
Sx4 = sum(x.^4);
Syx = sum(y.*x);
Syx2 = sum(y.*x.^2);

% Матриця системи для квадратичної апроксимації
A_quad = [Sx4, Sx3, Sx2; 
          Sx3, Sx2, Sx; 
          Sx2, Sx, n];
B_quad = [Syx2; Syx; Sy];

% Розв'язок системи
coeffs_quad = A_quad\B_quad;
a_quad = coeffs_quad(1);
b_quad = coeffs_quad(2);
c_quad = coeffs_quad(3);

fprintf('Коефіцієнти: a = %.2f, b = %.2f, c = %.2f\n', a_quad, b_quad, c_quad);
fprintf('Рівняння: y = %.2f*x^2 + %.2f*x + %.2f\n', a_quad, b_quad, c_quad);

% Обчислення апроксимованих значень
y_quad = a_quad*x.^2 + b_quad*x + c_quad;

% Обчислення суми квадратів відхилень
S_quad = sum((y - y_quad).^2);
fprintf('Сума квадратів відхилень S = %.2f\n', S_quad);

% Графік квадратичної апроксимації
y_quad_plot = a_quad*x_plot.^2 + b_quad*x_plot + c_quad;

subplot(2,3,3);
plot(x, y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
hold on;
plot(x_plot, y_quad_plot, 'g-', 'LineWidth', 2);
grid on;
title('Квадратична апроксимація', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Діаметр, см', 'FontSize', 10);
ylabel('Кількість дерев, шт', 'FontSize', 10);
legend('Дані', sprintf('y=%.1fx^2+%.1fx+%.1f', a_quad, b_quad, c_quad), 'Location', 'best');
hold off;

% =====================================================
% 3. ЕКСПОНЕНЦІАЛЬНА АПРОКСИМАЦІЯ: y = b*e^(ax)
% =====================================================
disp(' ');
disp('========================================');
disp('3. ЕКСПОНЕНЦІАЛЬНА АПРОКСИМАЦІЯ: y = b*e^(ax)');
disp('========================================');

% Перетворення: ln(y) = ln(b) + ax
Y = log(y);  % натуральний логарифм

SY = sum(Y);
SxY = sum(x.*Y);

% Матриця системи
A_exp = [Sxx, Sx; Sx, n];
B_exp = [SxY; SY];

% Розв'язок системи
coeffs_exp = A_exp\B_exp;
a_exp = coeffs_exp(1);
B_exp_coef = coeffs_exp(2);
b_exp = exp(B_exp_coef);

fprintf('Коефіцієнти: a = %.4f, b = %.2f\n', a_exp, b_exp);
fprintf('Рівняння: y = %.2f * e^(%.4f*x)\n', b_exp, a_exp);

% Обчислення апроксимованих значень
y_exp = b_exp * exp(a_exp*x);

% Обчислення суми квадратів відхилень
S_exp = sum((y - y_exp).^2);
fprintf('Сума квадратів відхилень S = %.2f\n', S_exp);

% Графік експоненціальної апроксимації
y_exp_plot = b_exp * exp(a_exp*x_plot);

subplot(2,3,4);
plot(x, y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
hold on;
plot(x_plot, y_exp_plot, 'm-', 'LineWidth', 2);
grid on;
title('Експоненціальна апроксимація', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Діаметр, см', 'FontSize', 10);
ylabel('Кількість дерев, шт', 'FontSize', 10);
legend('Дані', sprintf('y=%.1f*e^{%.3fx}', b_exp, a_exp), 'Location', 'best');
hold off;

% =====================================================
% 4. СТЕПЕНЕВА АПРОКСИМАЦІЯ: y = b*x^a
% =====================================================
disp(' ');
disp('========================================');
disp('4. СТЕПЕНЕВА АПРОКСИМАЦІЯ: y = b*x^a');
disp('========================================');

% Перетворення: ln(y) = ln(b) + a*ln(x)
X = log(x);
Y = log(y);

SX = sum(X);
SY = sum(Y);
SXX = sum(X.^2);
SXY = sum(X.*Y);

% Матриця системи
A_pow = [SXX, SX; SX, n];
B_pow = [SXY; SY];

% Розв'язок системи
coeffs_pow = A_pow\B_pow;
a_pow = coeffs_pow(1);
B_pow_coef = coeffs_pow(2);
b_pow = exp(B_pow_coef);

fprintf('Коефіцієнти: a = %.4f, b = %.2f\n', a_pow, b_pow);
fprintf('Рівняння: y = %.2f * x^(%.4f)\n', b_pow, a_pow);

% Обчислення апроксимованих значень
y_pow = b_pow * x.^a_pow;

% Обчислення суми квадратів відхилень
S_pow = sum((y - y_pow).^2);
fprintf('Сума квадратів відхилень S = %.2f\n', S_pow);

% Графік степеневої апроксимації
y_pow_plot = b_pow * x_plot.^a_pow;

subplot(2,3,5);
plot(x, y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
hold on;
plot(x_plot, y_pow_plot, 'c-', 'LineWidth', 2);
grid on;
title('Степенева апроксимація', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Діаметр, см', 'FontSize', 10);
ylabel('Кількість дерев, шт', 'FontSize', 10);
legend('Дані', sprintf('y=%.1f*x^{%.2f}', b_pow, a_pow), 'Location', 'best');
hold off;

% =====================================================
% 5. ПОРІВНЯННЯ ВСІХ АПРОКСИМАЦІЙ
% =====================================================
disp(' ');
disp('========================================');
disp('ПОРІВНЯННЯ АПРОКСИМАЦІЙ');
disp('========================================');

subplot(2,3,6);
plot(x, y, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
hold on;
plot(x_plot, y_lin_plot, 'b-', 'LineWidth', 1.5);
plot(x_plot, y_quad_plot, 'g-', 'LineWidth', 1.5);
plot(x_plot, y_exp_plot, 'm-', 'LineWidth', 1.5);
plot(x_plot, y_pow_plot, 'c-', 'LineWidth', 1.5);
grid on;
title('Порівняння всіх апроксимацій', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Діаметр, см', 'FontSize', 10);
ylabel('Кількість дерев, шт', 'FontSize', 10);
legend('Дані', 'Лінійна', 'Квадратична', 'Експоненціальна', 'Степенева', 'Location', 'best');
hold off;

% Збереження графіка
saveas(gcf, 'variant_12_approximation.png');

% =====================================================
% ПІДСУМКОВА ТАБЛИЦЯ
% =====================================================
disp(' ');
disp('========================================');
disp('ПІДСУМКОВА ТАБЛИЦЯ');
disp('========================================');
fprintf('%-25s | %-15s\n', 'Тип апроксимації', 'Сума кв. відхилень');
fprintf('%-25s-+-%-15s\n', repmat('-',1,25), repmat('-',1,15));
fprintf('%-25s | %15.2f\n', 'Лінійна', S_lin);
fprintf('%-25s | %15.2f\n', 'Квадратична', S_quad);
fprintf('%-25s | %15.2f\n', 'Експоненціальна', S_exp);
fprintf('%-25s | %15.2f\n', 'Степенева', S_pow);

% Визначення найкращої апроксимації
[S_min, idx] = min([S_lin, S_quad, S_exp, S_pow]);
names = {'Лінійна', 'Квадратична', 'Експоненціальна', 'Степенева'};
disp(' ');
fprintf('НАЙКРАЩА АПРОКСИМАЦІЯ: %s (S = %.2f)\n', names{idx}, S_min);

