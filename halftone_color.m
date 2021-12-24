%Q2

function im_hc = halftone_color(im,maxheight,a,b)
if nargin < 4
    b = 3; 
    if nargin < 3
        a = 2;
        if nargin < 2
            maxheight = 64;
        end
    end
end
im_h1 = myHalftone2(im(:,:,1),maxheight,b-a);
im_h2 = myHalftone2(im(:,:,2),maxheight,b+0);
im_h3 = myHalftone2(im(:,:,3),maxheight,b+a);
im_hc = cat(3,im_h1,im_h2,im_h3);
im_hc = uint8(im_hc);