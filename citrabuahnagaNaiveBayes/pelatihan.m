clc; clear; close all; warning off all;

% buah naga merah
% membaca file citra
nama_folder = 'data latih/buah naga merah';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);

% menginisialisasi variabel ciri_merah dan target_merah
ciri_merah = zeros(jumlah_file,3);
target_merah = cell(jumlah_file,1);

% melakukan pengolahan citra terhadap seluruh file
for n = 1:jumlah_file
    % membaca file citra rgb
    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    Img_gray = rgb2gray(Img);
%     figure, imshow(Img)
%     figure, imshow(Img_gray)
    % mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(Img_gray,.9);
%     figure, imshow(bw)
    % melakukan operasi komplemen
    bw = imcomplement(bw);
%     figure, imshow(bw)
    % melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    % 1. filling holes
    bw = imfill(bw,'holes');
%     figure, imshow(bw)
    % 2. area opening
    bw = bwareaopen(bw, 100);
%     figure, imshow(bw)
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
%     RGB = cat(3,R,G,B);
%     figure, imshow(RGB)
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
    % mengisi variabel ciri_merah dengan ciri hasil ekstraksi
    ciri_merah(n,1) = Red;
    ciri_merah(n,2) = Green;
    ciri_merah(n,3) = Blue;
    % mengisi variabel target_merah dengan nama kelas buah naga merah
    target_merah(n) = {'buah naga merah'};
end

% buah naga merah kuning
% membaca file citra
nama_folder = 'data latih/buah naga merah kuning';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);

% menginisialisasi variabel ciri_merah_kuning dan target_merah_kuning
ciri_merah_kuning = zeros(jumlah_file,3);
target_merah_kuning = cell(jumlah_file,1);

% melakukan pengolahan citra terhadap seluruh file
for n = 1:jumlah_file
    % membaca file citra rgb
    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    Img_gray = rgb2gray(Img);
%     figure, imshow(Img)
%     figure, imshow(Img_gray)
    % mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(Img_gray,.9);
%     figure, imshow(bw)
    % melakukan operasi komplemen
    bw = imcomplement(bw);
%     figure, imshow(bw)
    % melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    % 1. filling holes
    bw = imfill(bw,'holes');
%     figure, imshow(bw)
    % 2. area opening
    bw = bwareaopen(bw, 100);
%     figure, imshow(bw)
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
%     RGB = cat(3,R,G,B);
%     figure, imshow(RGB)
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
    % mengisi variabel ciri_merah_kuning dengan ciri hasil ekstraksi
    ciri_merah_kuning(n,1) = Red;
    ciri_merah_kuning(n,2) = Green;
    ciri_merah_kuning(n,3) = Blue;
    % mengisi variabel target_merah_kuning dengan nama kelas buah naga
    % merah kuning
    target_merah_kuning(n) = {'buah naga merah kuning'};
end

% buah naga hijau
% membaca file citra
nama_folder = 'data latih/buah naga hijau';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);

% menginisialisasi variabel ciri_hijau dan target_hijau
ciri_hijau = zeros(jumlah_file,3);
target_hijau = cell(jumlah_file,1);

% melakukan pengolahan citra terhadap seluruh file
for n = 1:jumlah_file
    % membaca file citra rgb
    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    Img_gray = rgb2gray(Img);
%     figure, imshow(Img)
%     figure, imshow(Img_gray)
    % mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(Img_gray,.9);
%     figure, imshow(bw)
    % melakukan operasi komplemen
    bw = imcomplement(bw);
%     figure, imshow(bw)
    % melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    % 1. filling holes
    bw = imfill(bw,'holes');
%     figure, imshow(bw)
    % 2. area opening
    bw = bwareaopen(bw, 100);
%     figure, imshow(bw)
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
%     RGB = cat(3,R,G,B);
%     figure, imshow(RGB)
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
    % mengisi variabel ciri_hijau dengan ciri hasil ekstraksi
    ciri_hijau(n,1) = Red;
    ciri_hijau(n,2) = Green;
    ciri_hijau(n,3) = Blue;
    % mengisi variabel target_hijau dengan nama kelas buah naga hijau
    target_hijau(n) = {'buah naga hijau'};
end

% buah naga hijau merah
% membaca file citra
nama_folder = 'data latih/buah naga hijau merah';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);

% menginisialisasi variabel ciri_hijau_merah dan target_hijau_merah
ciri_hijau_merah = zeros(jumlah_file,3);
target_hijau_merah = cell(jumlah_file,1);

% melakukan pengolahan citra terhadap seluruh file
for n = 1:jumlah_file
    % membaca file citra rgb
    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    Img_gray = rgb2gray(Img);
%     figure, imshow(Img)
%     figure, imshow(Img_gray)
    % mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(Img_gray,.9);
%     figure, imshow(bw)
    % melakukan operasi komplemen
    bw = imcomplement(bw);
%     figure, imshow(bw)
    % melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    % 1. filling holes
    bw = imfill(bw,'holes');
%     figure, imshow(bw)
    % 2. area opening
    bw = bwareaopen(bw, 100);
%     figure, imshow(bw)
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
%     RGB = cat(3,R,G,B);
%     figure, imshow(RGB)
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
    % mengisi variabel ciri_hijau_merah dengan ciri hasil ekstraksi
    ciri_hijau_merah(n,1) = Red;
    ciri_hijau_merah(n,2) = Green;
    ciri_hijau_merah(n,3) = Blue;
    % mengisi variabel target_hijau_merah dengan nama kelas buah naga hijau
    % merah
    target_hijau_merah(n) = {'buah naga hijau merah'};
end

% menyusun variabel ciri_latih dan target_latih
ciri_latih = [ciri_merah;ciri_merah_kuning;ciri_hijau;ciri_hijau_merah];
target_latih = [target_merah;target_merah_kuning;target_hijau;target_hijau_merah];

% melakukan pelatihan menggunakan algoritma k-nn
Mdl = fitcnb(ciri_latih, target_latih);

% membaca kelas keluaran hasil pelatihan
hasil_latih = predict(Mdl, ciri_latih);

% menghitung akurasi pelatihan
jumlah_benar = 0;
jumlah_data = size(ciri_latih,1);
for k = 1:jumlah_data
    if isequal(hasil_latih{k},target_latih{k})
        jumlah_benar = jumlah_benar+1;
    end
end

akurasi_pelatihan = jumlah_benar/jumlah_data*100

% menyimpan variabel Mdl hasil pelatihan
save Mdl Mdl















