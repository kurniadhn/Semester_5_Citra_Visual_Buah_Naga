% 
% Author    : Alif Irhasshoufi Nasihul  Umam
% NIM       : E41190530
% TIF 19 A
% 

fitur_post = [];    % Tempat menyimmpan data hasil

for g = 1:10
    %gambar1 = imread(['img\datalatih (',num2str(g),').JPG']);
    gambar1 = imread('1.jpg');
    gambar = imresize(gambar1, [400,400]);
    [BW, Img] = remove_bg(gambar);
    red = Img(:,:,1);
    green = Img(:,:,2);
    blue = Img(:,:,3);

    gray = rgb2gray(Img);
    [M,N] = size(blue);
    IFeature = zeros(M,N);

    warna_red = mean(mean(red));
    warna_green = mean(mean(green));
    warna_blue = mean(mean(blue));

    I = Img;
    [tinggi, lebar] = size(I);

    % Bentuk GLCM
    GLCM0 = zeros(256, 256);
    total_piksel0 = 0;

    GLCM45 = zeros(256, 256);
    total_piksel45 = 0;

    GLCM90 = zeros(256, 256);
    total_piksel90 = 0;

    GLCM135 = zeros(256, 256);
    total_piksel135 = 0;

    for y=2: tinggi-1
        for x=22: lebar-1
            % Untuk sudut 0
            a = I(y,x);
            b = I(y,x+1);
            GLCM0(a+1, b+1) = GLCM0(a+1, b+1) + 1;
            total_piksel0 = total_piksel0 + 1;

            % Untuk sudut 45
            a = I(y,x);
            b = I(y,x+1);
            GLCM45(a+1, b+1) = GLCM45(a+1, b+1) + 1;
            total_piksel45 = total_piksel45 + 1;

            % Untuk sudut 90
            a = I(y,x);
            b = I(y,x+1);
            GLCM90(a+1, b+1) = GLCM90(a+1, b+1) + 1;
            total_piksel90 = total_piksel90 + 1;

            % Untuk sudut 135
            a = I(y,x);
            b = I(y,x+1);
            GLCM135(a+1, b+1) = GLCM135(a+1, b+1) + 1;
            total_piksel135 = total_piksel135 + 1;
        end
    end

    GLCM0 = GLCM0 / total_piksel0;
    GLCM45 = GLCM45 / total_piksel45;
    GLCM90 = GLCM90 / total_piksel90;
    GLCM135 = GLCM135 / total_piksel135;

    % Hitung ASM
    asm0 = 0.0;
    asm45 = 0.0;
    asm90 = 0.0;
    asm135 = 0.0;

    for a=0 : 255
        for b=0 : 255
            asm0 = asm0 + (GLCM0(a+1, b+1) * GLCM0(a+1, b+1));
            asm45 = asm45 + (GLCM45(a+1, b+1) * GLCM45(a+1, b+1));
            asm90 = asm90 + (GLCM90(a+1, b+1) * GLCM90(a+1, b+1));
            asm135 = asm135 + (GLCM135(a+1, b+1) * GLCM135(a+1, b+1));
        end
    end

    % Mengitung IDM
    idm0 = 0.0;
    idm45 = 0.0;
    idm90 = 0.0;
    idm135 = 0.0;

    for a=0 : 255
        for b=0 : 255
            idm0 = idm0 + (GLCM0(a+1, b+1) / (1+(a-b)*(a-b)));
            idm45 = idm45 + (GLCM45(a+1, b+1) / (1+(a-b)*(a-b)));
            idm90 = idm90 + (GLCM90(a+1, b+1) / (1+(a-b)*(a-b)));
            idm135 = idm135 + (GLCM135(a+1, b+1) / (1+(a-b)*(a-b)));
        end
    end

    % Menghitung Kontras
    kontras0 = 0.0;
    kontras45 = 0.0;
    kontras90 = 0.0;
    kontras135 = 0.0;

    for a=0 : 255
        for b=0 : 255
            kontras0 = kontras0 + (a-b)*(a-b)* GLCM0(a+1, b+1);
            kontras45 = kontras45 + (a-b)*(a-b)* GLCM45(a+1, b+1);
            kontras90 = kontras90 + (a-b)*(a-b)* GLCM90(a+1, b+1);
            kontras135 = kontras135 + (a-b)*(a-b)* GLCM135(a+1, b+1);
        end
    end

    % Menghitung Kovoarian 
    % Hitung px [] dan py [] dulu
    korelasi0 = 0.0;
    px0 = 0;
    py0 = 0;
    meanx0 = 0.0;
    meany0 = 0.0;
    stdevx0 = 0.0;
    stdevy0 = 0.0;

    korelasi45 = 0.0;
    px45 = 0;
    py45 = 0;
    meanx45 = 0.0;
    meany45 = 0.0;
    stdevx45 = 0.0;
    stdevy45 = 0.0;

    korelasi90 = 0.0;
    px90 = 0;
    py90 = 0;
    meanx90 = 0.0;
    meany90 = 0.0;
    stdevx90 = 0.0;
    stdevy90 = 0.0;

    korelasi135 = 0.0;
    px135 = 0;
    py135 = 0;
    meanx135 = 0.0;
    meany135 = 0.0;
    stdevx135 = 0.0;
    stdevy135 = 0.0;

    for a=0 : 255
        for b=0 : 255
            px0 = px0 + a * GLCM0 (a+1, b+1);
            py0 = py0 + b * GLCM0 (a+1, b+1);

            px45 = px45 + a * GLCM45 (a+1, b+1);
            py45 = py45 + b * GLCM45 (a+1, b+1);

            px90 = px90 + a * GLCM90 (a+1, b+1);
            py90 = py90 + b * GLCM90 (a+1, b+1);

            px135 = px135 + a * GLCM135 (a+1, b+1);
            py135 = py135 + b * GLCM135 (a+1, b+1);
        end
    end

    % Menghitung Deviasi Standar
    for a=0 : 255
        for b=0 : 255
            stdevx0 = stdevx0 + (a-px0) * (a-px0) * GLCM0(a+1, b+1);
            stdevy0 = stdevy0 + (b-py0) * (b-py0) * GLCM0(a+1, b+1);

            stdevx45 = stdevx45 + (a-px45) * (a-px45) * GLCM45(a+1, b+1);
            stdevy45 = stdevy45 + (b-py45) * (b-py45) * GLCM45(a+1, b+1);

            stdevx90 = stdevx90 + (a-px90) * (a-px90) * GLCM90(a+1, b+1);
            stdevy90 = stdevy90 + (b-py90) * (b-py90) * GLCM90(a+1, b+1);

            stdevx135 = stdevx135 + (a-px135) * (a-px135) * GLCM135(a+1, b+1);
            stdevy135 = stdevy135 + (b-py135) * (b-py135) * GLCM135(a+1, b+1);
        end
    end

    % Hitung Korelasi
    for a=0 : 255
        for b=0 : 255
            korelasi0 = korelasi0 + ((a-px0)*(b-py0) * GLCM0(a+1, b+1) / (stdevx0 * stdevy0));
            korelasi45 = korelasi45 + ((a-px45)*(b-py45) * GLCM45(a+1, b+1) / (stdevx45 * stdevy45));
            korelasi90 = korelasi90 + ((a-px90)*(b-py90) * GLCM90(a+1, b+1) / (stdevx90 * stdevy90));
            korelasi135 = korelasi135 + ((a-px135)*(b-py135) * GLCM135(a+1, b+1) / (stdevx135 * stdevy135));
        end
    end

    % Hasil ekstraski fitur
    Warna_red = warna_red;
    Warna_green = warna_green;
    Warna_blue = warna_blue;

    G0asm = asm0;
    G0idm = idm0;
    G0kontras = kontras0;
    G0korelasi = korelasi0;

    G45asm = asm45;
    G45idm = idm45;
    G45kontras = kontras45;
    G45korelasi = korelasi45;

    G90asm = asm90;
    G90idm = idm90;
    G90kontras = kontras90;
    G90korelasi = korelasi90;

    G135asm = asm135;
    G135idm = idm135;
    G135kontras = kontras135;
    G135korelasi = korelasi135;

    % Penuliasn fitur
    fitur = [Warna_red; Warna_green; Warna_blue;
        G0asm; G0idm; G0kontras; G0korelasi;
        G45asm; G45idm; G45kontras; G45korelasi;
        G90asm; G90idm; G90kontras; G90korelasi;
        G135asm; G135idm; G135kontras; G135korelasi];
    
    % Concatenate matrix di kolom
    fitur_post = [fitur_post fitur];

    % ================================================
    % Cek status matrix
    % cooment kalau tidak mau dicek
    % 
    % fitur
    % fprintf('size(A) is [%s]\n', int2str(size(fitur)))
    % fitur_post
    % fprintf('size(B) is [%s]\n', int2str(size(fitur_post(g:19,:))))
    % g
    % ================================================

end

xlswrite('data_latih.xlsx', fitur_post);      
        
        
        
        
        
        
        
        
        
        