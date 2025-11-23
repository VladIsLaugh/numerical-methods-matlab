% Практична робота №3 - Варіант 12
% Завдання 3: Побудова графіка в полярних координатах

% Очищення робочого простору
clear all;
close all;
clc;

% Ввід вектора значень кута φ (fi)
fi = 0:pi/100:2*pi;

% Обчислення радіус-вектора r
r = 30*(2 + cos(2*fi));

% Створення графічного вікна
figure('Name', 'Завдання 3 - Графік у полярних координатах', 'NumberTitle', 'off');

% Побудова графіка в полярних координатах
polar(fi, r, 'b-');
hold on;
polar(fi, r, 'ro', 'MarkerSize', 3);

% Додамо назву
title('Графік функції r = 30(2 + cos(2\phi)) у полярних координатах', 'FontSize', 13);

% Побудуємо сітку
grid on;

% Встановимо розмір шрифту
set(gca, 'FontSize', 11);

hold off;

% Альтернативний спосіб з використанням ezpolar
figure('Name', 'Завдання 3 - ezpolar', 'NumberTitle', 'off');
ezpolar('30*(2 + cos(2*x))', [0, 2*pi]);
title('Графік функції r = 30(2 + cos(2\phi)) - ezpolar', 'FontSize', 13);
grid on;
set(gca, 'FontSize', 11);
