%Q2

input=imread('4.JPG');
%figure(1);
%imshow(input);

%scaled_img=scaling(input);
%figure(2);
%imshow(scaled_img);

%graylvl_decomposition=decomp_img(scaled_img);
%figure(3);
%imshow(graylvl_decomposition);

I=halftone_color(input);
figure(4);
imshow(I);