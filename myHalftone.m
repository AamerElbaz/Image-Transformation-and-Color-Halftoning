function ha = myHalftone(im)
[height, width, c] = size(im);
if c > 1
    im = rgb2gray(im);
end
hf = figure;
ha = axes('parent',hf,'dataaspectratio',[1 1 1],...
    'ydir','reverse',...
    'xlim',[0 width+1],'ylim',[0 height+1]);
% Scale on the halftone image:
% discernable scale equals 1
% gray scale equals 2
g = 1.36;
im = double(im)/255*g;

for x = 1:width
    for y = 1:height
        r = (g-im(y,x))+0.02;
        %r = sqrt((g-im(y,x)+0.02)*g);
        rectangle('parent',ha,'curvature',[1,1],...
            'facecolor','k','edgecolor','none',...
            'position',[x-r/2 y-r/2 r r])
    end
end
