% =====================================================
% Практична робота №5, Варіант 12
% Завдання 1: Побудова інтерполянти за звичайним многочленом
% та многочленом Маклорена
% =====================================================

clear all;
clc;

% Вхідні дані для варіанту 12
x = [0.6, 0.7, 0.8, 0.9, 1.0, 1.1];
y = [0.5, 0.8, 1.2, 1.1, 1.0, 0.9];

% =====================================================
% ЧАСТИНА 1: Інтерполяція звичайним многочленом
% =====================================================

disp('========================================');
disp('ЗАВДАННЯ 1: ІНТЕРПОЛЯЦІЯ ЗВИЧАЙНИМ МНОГОЧЛЕНОМ');
disp('========================================');
disp('Вузли інтерполяції:');
disp('xi:');
disp(x);
disp('yi:');
disp(y);

% Кількість вузлів
n = length(x);

% Формування матриці системи для звичайного многочлена степеня (n-1)
A = zeros(n, n);
for i = 1:n
    for j = 1:n
        A(i, j) = x(i)^(j-1);
    end
end

disp(' ');
disp('Матриця системи A:');
disp(A);

% Стовпець вільних членів
B = y';

disp('Стовпець вільних членів B:');
disp(B);

% Розв'язок системи - знаходження коефіцієнтів інтерполянти
coeffs = A\B;

disp(' ');
disp('Коефіцієнти звичайного многочлена (a0, a1, a2, ..., an-1):');
disp(coeffs');

% Формування рівняння многочлена
fprintf('\nРівняння інтерполянти:\n');
fprintf('g(x) = ');
for i = 1:n
    if i == 1
        fprintf('%.4f', coeffs(i));
    elseif i == 2
        if coeffs(i) >= 0
            fprintf(' + %.4f*x', coeffs(i));
        else
            fprintf(' - %.4f*x', abs(coeffs(i)));
        end
    else
        if coeffs(i) >= 0
            fprintf(' + %.4f*x^%d', coeffs(i), i-1);
        else
            fprintf(' - %.4f*x^%d', abs(coeffs(i)), i-1);
        end
    end
end
fprintf('\n\n');

% Табулювання інтерполянти
x_interp = linspace(min(x)-0.1, max(x)+0.1, 100);
y_interp = zeros(size(x_interp));

% Обчислення значень многочлена
for i = 1:n
    y_interp = y_interp + coeffs(i) * x_interp.^(i-1);
end

% Побудова графіка звичайного многочлена
figure('Position', [100, 100, 1000, 800]);

subplot(2,1,1);
plot(x_interp, y_interp, 'b-', 'LineWidth', 2);
hold on;
plot(x, y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
grid on;
title('Графік інтерполянти за звичайним многочленом (Варіант 12)', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
legend('Інтерполянта g(x)', 'Вузли інтерполяції', 'Location', 'best');
hold off;

% =====================================================
% ЧАСТИНА 2: Інтерполяція многочленом Маклорена (Тейлора)
% =====================================================

disp('========================================');
disp('ІНТЕРПОЛЯЦІЯ МНОГОЧЛЕНОМ МАКЛОРЕНА (ТЕЙЛОРА)');
disp('========================================');

% Для многочлена Маклорена потрібно зсунути дані до точки x=0
% Зсув: x0 = середнє значення x
x0 = mean(x);
disp(['Точка розкладу x0 = ', num2str(x0)]);

% Зсунуті значення
x_shifted = x - x0;

% Формування матриці для многочлена Маклорена
A_maclaurin = zeros(n, n);
for i = 1:n
    for j = 1:n
        A_maclaurin(i, j) = x_shifted(i)^(j-1);
    end
end

disp(' ');
disp('Матриця системи для многочлена Маклорена:');
disp(A_maclaurin);

% Розв'язок системи
coeffs_maclaurin = A_maclaurin\B;

disp(' ');
disp('Коефіцієнти многочлена Маклорена:');
disp(coeffs_maclaurin');

% Формування рівняння многочлена Маклорена
fprintf('\nРівняння інтерполянти (многочлен Маклорена навколо x0 = %.3f):\n', x0);
fprintf('g(x) = ');
for i = 1:n
    if i == 1
        fprintf('%.4f', coeffs_maclaurin(i));
    elseif i == 2
        if coeffs_maclaurin(i) >= 0
            fprintf(' + %.4f*(x-%.3f)', coeffs_maclaurin(i), x0);
        else
            fprintf(' - %.4f*(x-%.3f)', abs(coeffs_maclaurin(i)), x0);
        end
    else
        if coeffs_maclaurin(i) >= 0
            fprintf(' + %.4f*(x-%.3f)^%d', coeffs_maclaurin(i), x0, i-1);
        else
            fprintf(' - %.4f*(x-%.3f)^%d', abs(coeffs_maclaurin(i)), x0, i-1);
        end
    end
end
fprintf('\n\n');

% Табулювання многочлена Маклорена
x_maclaurin = linspace(min(x)-0.1, max(x)+0.1, 100);
y_maclaurin = zeros(size(x_maclaurin));

% Обчислення значень многочлена Маклорена
for i = 1:n
    y_maclaurin = y_maclaurin + coeffs_maclaurin(i) * (x_maclaurin - x0).^(i-1);
end

% Побудова графіка многочлена Маклорена
subplot(2,1,2);
plot(x_maclaurin, y_maclaurin, 'g-', 'LineWidth', 2);
hold on;
plot(x, y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(x0, interp1(x, y, x0, 'linear'), 'bs', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
grid on;
title('Графік інтерполянти за многочленом Маклорена (Варіант 12)', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
legend('Інтерполянта g(x)', 'Вузли інтерполяції', sprintf('Точка розкладу x0=%.2f', x0), 'Location', 'best');
hold off;

% Збереження графіка
saveas(gcf, 'variant_12_interpolation.png');
disp(' ');
disp('========================================');
disp('Графік збережено як variant_12_interpolation.png');
disp('========================================');

% =====================================================
% Перевірка точності інтерполяції
% =====================================================
disp(' ');
disp('========================================');
disp('ПЕРЕВІРКА ТОЧНОСТІ ІНТЕРПОЛЯЦІЇ');
disp('========================================');

% Перевірка звичайного многочлена
y_check = zeros(size(x));
for i = 1:n
    y_check = y_check + coeffs(i) * x.^(i-1);
end

disp('Звичайний многочлен:');
disp('   xi      yi (вихідне)   yi (обчислене)   Похибка');
for i = 1:n
    fprintf('  %.1f      %.1f           %.4f          %.2e\n', x(i), y(i), y_check(i), abs(y(i) - y_check(i)));
end

% Перевірка многочлена Маклорена
y_check_mac = zeros(size(x));
for i = 1:n
    y_check_mac = y_check_mac + coeffs_maclaurin(i) * (x - x0).^(i-1);
end

disp(' ');
disp('Многочлен Маклорена:');
disp('   xi      yi (вихідне)   yi (обчислене)   Похибка');
for i = 1:n
    fprintf('  %.1f      %.1f           %.4f          %.2e\n', x(i), y(i), y_check_mac(i), abs(y(i) - y_check_mac(i)));
end
