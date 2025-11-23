% Практична робота №3 - Варіант 12
% Завдання 2: Побудова графіків у різних підобластях одного вікна

% Очищення робочого простору
clear all;
close all;
clc;

% Ввід вектора значень аргументу X
X = -5:1:5;

% Обчислення векторів значень функцій Y та Z
Y = 3*sin(X);
Z = 0.015*X.^3;

% Створення нового графічного вікна
figure('Name', 'Завдання 2 - Графіки у різних підобластях', 'NumberTitle', 'off');

% Розкриємо побудоване вікно на два підвікна по вертикалі
% Вводимо графік функції Y із її параметрами
subplot(2, 1, 1);
plot(X, Y, 'y*-', 'LineWidth', 2, 'MarkerSize', 10);
title('Y = 3sin(X)', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
grid on;
legend('y = 3sin(x)', 'Location', 'best');
set(gca, 'FontSize', 10);
% Пояснювальний напис
text(-4, 2, 'Жовта лінія, зірочки', 'FontSize', 9);

% Розкриємо побудоване вікно на два підвікна по вертикалі
% Вводимо графік функції Z із її параметрами
subplot(2, 1, 2);
plot(X, Z, 'rs-', 'LineWidth', 2, 'MarkerSize', 8);
title('Z = 0.015X^3', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Z', 'FontSize', 11);
grid on;
legend('z = 0.015x^3', 'Location', 'best');
set(gca, 'FontSize', 10);
% Пояснювальний напис
text(-4, 1, 'Червона лінія, квадрати', 'FontSize', 9);
