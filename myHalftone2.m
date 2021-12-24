function im_h = myHalftone2(im,maxheight,a)
if nargin < 3
    a = 3;
    if nargin < 2
        maxheight = 128;
    end
end
n_g = 18; %gray scale, radius
n_d = 12*2+1; %discernable scale, diameter
aa = a/180*pi;
offset = [zeros(1,fix(n_g/2)) ones(1,n_g-fix(n_g/2))];
[height, ~, c] = size(im);
if c > 1
    im = rgb2gray(im);
end
if height > maxheight
    im_n = imresize(im,maxheight/height);
    im_n = double(im_n)/255*(n_g-1);
else
    im_n = double(im)/255*(n_g-1);
end
im_n = (im_n/n_g).^0.75*n_g;
[height, width] = size(im_n);
im_r = imrotate(im_n,a);
[height_r, width_r] = size(im_r);
width_h = n_d*width_r+((n_g-1)*2+1-n_d);
height_h = n_d*height_r+((n_g-1)*2+1-n_d);
im_h = 255*ones(height_h,width_h);
[x, y] = meshgrid(1:(n_g-1)*2+1);
X = cell(1,n_g);
Y = cell(1,n_g);
len = zeros(1,n_g);
for k = 1:n_g
    [X{k}, Y{k}] = find(((x-n_g).^2+(y-n_g).^2) <= (k-1)^2-offset(k));
    len(k) = length(X{k});
    %image(((x-n_g).^2+(y-n_g).^2) <= (k-1)^2-offset(k))%#
end
for x = 1:width_r
    for y = 1:height_r
        xx = x-width_r/2;
        yy = y-height_r/2;
        xr = xx*cos(aa)-yy*sin(aa);
        yr = xx*sin(aa)+yy*cos(aa);
        if (abs(xr) > width/2) || (abs(yr) > height/2)
            continue
        end
        r = fix(sqrt((n_g-im_r(y,x))*n_g));
        %r = fix((n_g-im_r(y,x)));
        for k = 1:len(r)
            im_h(Y{r}(k)+(y-1)*n_d,X{r}(k)+(x-1)*n_d) = 0;
        end
        %image(im_h)%#
    end
end
im_h = imrotate(im_h,-a);
%Crop to original size
[height_r, width_r] = size(im_h);
width = width*n_d;
height = height*n_d;
xc = ceil((width_r-width)/2);
yc = ceil((height_r-height)/2);
im_h = im_h((yc+1):(yc+height),(xc+1):(xc+width));
% figure
% imshow(imresize(im,[width height]))
% figure
% imshow(uint8(im_h))
