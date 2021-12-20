image = imread('1.jpg');
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);
imshow (image)

imshow(blue)
imshow(green)
imshow(red)