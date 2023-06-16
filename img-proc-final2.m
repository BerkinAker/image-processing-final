pkg load image
Asrc = imread('C:\Users\Berkin\Desktop\meyvesuyukutusu (3).jpg');

Agray = rgb2gray(Asrc);

Abin = Agray > 80;

Abin = not(Abin);

%imshow(Abin);

[sat, sut] = size(Abin);

X = [0: sut-1];

Yfrm = ones(sat, sut).*[sat-1:-1:0]';

Y = max(Abin .* Yfrm);

% X'e karşılık gelen Y değeri 0 olan noktaları filtrele
X_filtered = X(Y != 0);
Y_filtered = Y(Y != 0);

% İlk 380 elemanı al
X_filtered = X_filtered(1:380);
Y_filtered = Y_filtered(1:380);

% Sonucu çizdir
%plot(X_filtered, Y_filtered);

M = 1;

A = polyfit(X_filtered, Y_filtered, M);
Yt = polyval(A, X_filtered);
%figure
%plot(X_filtered, Yt);

x1 = (1024 - 1.5439e+03)/ 3.7884e-01
x1

aci = atan(3.7884e-01);
aci

mesafe = (abs(x1) + 768) * sin(aci);
mesafe


% 90 derece sola çevir
Abin2 = imrotate(Abin, 90);
%imshow(Abin2);
[sat2, sut2] = size(Abin2);
X2 = [0: sut2-1];
Yfrm2 = ones(sat2, sut2).*[sat2-1:-1:0]';
Y2 = max(Abin2 .* Yfrm2);
% X'e karşılık gelen Y değeri 0 olan noktaları filtrele
X_filtered2 = X2(Y2 != 0);
Y_filtered2 = Y2(Y2 != 0);

% İlk 500 elemanı al
X_filtered2 = X_filtered2(1:380);
Y_filtered2 = Y_filtered2(1:380);

% Sonucu çizdir
%hold on
%plot(X_filtered2, Y_filtered2);

A2 = polyfit(X_filtered2, Y_filtered2, M);
Yt2 = polyval(A2, X_filtered2);
%figure
%plot(X_filtered2, Yt2);

A2

x2 = (768 - 502.8743) / 0.4603
x2

aci2 = atan(0.4603);
aci2

mesafe2 = (1024 - x2) * sin(aci2);
mesafe2

% 90 derece daha sola çevir
Abin3 = imrotate(Abin2, 90);

%imshow(Abin3);

[sat3, sut3] = size(Abin3);
X3 = [0: sut3-1];
Yfrm3 = ones(sat3, sut3).*[sat3-1:-1:0]';
Y3 = max(Abin3 .* Yfrm3);
% X'e karşılık gelen Y değeri 0 olan noktaları filtrele
X_filtered3 = X3(Y3 != 0);
Y_filtered3 = Y3(Y3 != 0);

% İlk 500 elemanı al
X_filtered3 = X_filtered3(1:380);
Y_filtered3 = Y_filtered3(1:380);

% Sonucu çizdir
%hold on
%plot(X_filtered2, Y_filtered2);

A3 = polyfit(X_filtered3, Y_filtered3, M);
Yt3 = polyval(A3, X_filtered3);
%figure
%plot(X_filtered3, Yt3);

A3

x3 = (1024 - 1.0681e+03) / 3.8239e-01
x3

aci3 = atan(3.8239e-01);
aci3

mesafe = (abs(x3) + 768) * sin(aci3);
mesafe

% 90 derece daha da sola çevir
Abin4 = imrotate(Abin3, 90);

imshow(Abin4);
[sat4, sut4] = size(Abin4);
X4 = [0: sut4-1];
Yfrm4 = ones(sat4, sut4).*[sat4-1:-1:0]';
Y4 = max(Abin4 .* Yfrm4);

% X'e karşılık gelen Y değeri 0 olan noktaları filtrele
X_filtered4 = X4(Y4 != 0);
Y_filtered4 = Y4(Y4 != 0);

% İlk 500 elemanı al
X_filtered4 = X_filtered4(1:380);
Y_filtered4 = Y_filtered4(1:380);

% Sonucu çizdir
%hold on
%plot(X_filtered4, Y_filtered4);

A4 = polyfit(X_filtered4, Y_filtered4, M);
Yt4 = polyval(A4, X_filtered4);
figure
plot(X_filtered4, Yt4);
A4

x4 = (768 - 698.4078) / 0.3954
x4

aci4 = atan(0.3954);
aci4

mesafe4 = (768 - x4) * sin(aci4);
mesafe4
