% Практична робота №3 - Варіант 12
% Завдання 5: Побудова графіків функції двох змінних
% z = xy + (2 + cos(2(x + y)))

% Очищення робочого простору
clear all;
close all;
clc;

%% Спосіб 1: Використання ezmesh

figure('Name', 'Завдання 5 - Спосіб 1 (ezmesh)', 'NumberTitle', 'off');

% Побудова поверхні за допомогою ezmesh
ezmesh('x*y + (2 + cos(2*(x + y)))', [-8, 8, -8, 8]);
title('Спосіб 1: z = xy + (2 + cos(2(x + y))) - ezmesh', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
zlabel('Z', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 10);
colorbar;

%% Спосіб 2: Використання ezmesh з явно заданими межами

figure('Name', 'Завдання 5 - Спосіб 2 (ezmesh з межами)', 'NumberTitle', 'off');

ezmesh('x*y + (2 + cos(2*(x + y)))', [-8, 8, -8, 8]);
title('Спосіб 2: z = xy + (2 + cos(2(x + y))) - ezmesh', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
zlabel('Z', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 10);
view(45, 30); % Змінюємо кут огляду
colorbar;

%% Спосіб 3: Використання surf з генерацією матриць

figure('Name', 'Завдання 5 - Спосіб 3 (surf)', 'NumberTitle', 'off');

% Крок 1: Згенерувати вектори значень змінних
x = -8:0.2:8;
y = -8:0.2:8;

% Крок 2: Згенерувати матриці значень змінних
[X, Y] = meshgrid(x, y);

% Крок 3: Обчислити z - функцію матричних аргументів X, Y
Z = X.*Y + (2 + cos(2*(X + Y)));

% Крок 4: Побудова поверхні у вигляді сітки при кольоровому зображенні
surf(X, Y, Z);
title('Спосіб 3: z = xy + (2 + cos(2(x + y))) - surf', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
zlabel('Z', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 10);
colorbar;
shading interp; % Згладжене зафарбування

%% Побудова контурних графіків (ліній рівня)

% Контурний графік (2D)
figure('Name', 'Завдання 5 - Контурний графік (2D)', 'NumberTitle', 'off');

contour(X, Y, Z, 20); % 20 ліній рівня
title('Контурний графік: z = xy + (2 + cos(2(x + y)))', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 10);
colorbar;

% Заповнений контурний графік
figure('Name', 'Завдання 5 - Заповнений контурний графік', 'NumberTitle', 'off');

contourf(X, Y, Z, 20);
title('Заповнений контурний графік: z = xy + (2 + cos(2(x + y)))', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 10);
colorbar;

% 3D контурний графік
figure('Name', 'Завдання 5 - 3D контурний графік', 'NumberTitle', 'off');

contour3(X, Y, Z, 20);
title('3D контурний графік: z = xy + (2 + cos(2(x + y)))', 'FontSize', 13);
xlabel('X', 'FontSize', 11);
ylabel('Y', 'FontSize', 11);
zlabel('Z', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 10);
view(45, 30);
colorbar;
