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
%hold on
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

mesafe3 = (abs(x3) + 768) * sin(aci3);
mesafe3

% 90 derece daha da sola çevir
Abin4 = imrotate(Abin3, 90);

%imshow(Abin4);
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
%figure
%plot(X_filtered4, Yt4);
A4

x4 = (768 - 698.4078) / 0.3954
x4

aci4 = atan(0.3954);
aci4

mesafe4 = (768 - x4) * sin(aci4);
mesafe4

Abin = imrotate(Abin4, 90);

output_width = 206;
output_height = 906;

scale_factor_width = output_width / sut;
scale_factor_height = output_height / sat;

new_mesafe = mesafe * scale_factor_height;

% Her bir kenar için yeni mesafe değerlerini hesaplayın
new_mesafe2 = mesafe2 * scale_factor_width;
new_mesafe3 = mesafe3 * scale_factor_height;
new_mesafe4 = mesafe4 * scale_factor_width;
new_mesafe, new_mesafe2, new_mesafe3, new_mesafe4


stats = regionprops(CC, 'BoundingBox');

% Find the bounding box with the largest area
max_area = 0;
max_idx = 0;
for i = 1:length(stats)
    area = stats(i).BoundingBox(3) * stats(i).BoundingBox(4);
    if area > max_area
        max_area = area;
        max_idx = i;
    end
end

% Get the bounding box coordinates
bounding_box = stats(max_idx).BoundingBox;
top_row = floor(bounding_box(2));
bottom_row = top_row + bounding_box(4);
left_col = floor(bounding_box(1));
right_col = left_col + bounding_box(3);

% Adjust the cropping coordinates
top_row = max(1, top_row - 10);  % Adding some padding to the top
bottom_row = min(size(A, 1), bottom_row + 10);  % Adding some padding to the bottom
left_col = max(1, left_col - 10);  % Adding some padding to the left
right_col = min(size(A, 2), right_col + 10);  % Adding some padding to the right

% Crop the image and clip the black parts
cropped_image = result(top_row:bottom_row, left_col:right_col, :);

% Display the cropped image
imshow(cropped_image);

%shiftY = round(mesafe / (mesafe + mesafe3));
%shiftX = round(mesafe2 / (mesafe2 + mesafe4));

% Kaydırma işlemi için boş bir matris oluştur
%shifted = zeros(size(Abin));

% Kaydırma işlemi
%shifted(1+shiftY:end-shiftY, 1+shiftX:end-shiftX) = Abin(1+shiftY:end-shiftY, 1+shiftX:end-shiftX);
%figure
%imshow(shifted);

%imshow(Abin)
%shifted = zeros(size(Abin));
%shift_amount = round((mesafe + mesafe2 + mesafe3 + mesafe4) / 4);
%shifted(:, shift_amount + 1 : shift_amount + sut) = Abin(:, 1 : sut);
%figure
%imshow(shifted);

%output_width = 206
%output_height = 906

%output_image = zeros(output_height, output_width);

%for y=1:output_height
 % for x=1:output_width
  %  ratio_y = y / (output_height - 1);
   % ratio_x = x / (output_width - 1);

    %distance_y = mesafe * (1 - ratio_y) + mesafe3 * ratio_y;
    %distance_x = mesafe4 * (1 - ratio_x) + mesafe2 * ratio_x;

    %src_x = round(x - distance_x);
    %src_y = round(y - distance_y);

    %src_x = max(1, min(src_x, output_width - 1));
    %src_y = max(1, min(src_y, output_height - 1));
    %disp(src_x), disp(src_y)

    %output_image(y, x) = Abin(src_y, src_x);
  %endfor
%endfor

%imwrite(output_image, 'tasima_islemi.jpg');
