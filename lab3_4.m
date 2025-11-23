% Практична робота №3 - Варіант 12
% Завдання 4: Побудова графіків функцій, заданих неявно та параметрично

% Очищення робочого простору
clear all;
close all;
clc;

%% Завдання 4а: Неявно задана функція
% xy + (2 + cos(2(x + y))) = 0

figure('Name', 'Завдання 4а - Неявно задана функція', 'NumberTitle', 'off');

% Використовуємо ezplot для неявно заданої функції
ezplot('x*y + (2 + cos(2*(x + y)))', [-2*pi, 2*pi, -2*pi, 2*pi]);
title('Неявно задана функція: xy + (2 + cos(2(x + y))) = 0', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 11);

%% Завдання 4б: Параметрично задана функція
% x = 7*cos(t - cos(t))
% y = 7*sin(t - cos(t))

figure('Name', 'Завдання 4б - Параметрично задана функція', 'NumberTitle', 'off');

% Спосіб 1: Використання ezplot
ezplot('7*cos(t - cos(t))', '7*sin(t - cos(t))', [-2*pi, 2*pi]);
title('Параметрична функція: x = 7cos(t-cos(t)), y = 7sin(t-cos(t))', 'FontSize', 12);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 11);

% Спосіб 2: Використання векторів
figure('Name', 'Завдання 4б - Параметрична (спосіб 2)', 'NumberTitle', 'off');

t = -2*pi:pi/20:2*pi;
x = 7*cos(t - cos(t));
y = 7*sin(t - cos(t));

plot(x, y, 'b-', 'LineWidth', 2);
title('Параметрична функція: x = 7cos(t-cos(t)), y = 7sin(t-cos(t))', 'FontSize', 12);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 11);
axis equal;
