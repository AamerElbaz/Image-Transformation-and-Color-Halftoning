%Q1-a

function outt=decomp_img(inn)
%gray=rgb2gray(inn);
[row,col]=size(inn);
threshold=round(255/10);
l0=[0,0,0;0,0,0;0,0,0]; l1=[0,1,0;0,0,0;0,0,0]; l2=[0,1,0;0,0,0;0,0,1]; l3=[1,1,0;0,0,0;0,0,1];
l4=[1,1,0;0,0,0;1,0,1]; l5=[1,1,1;0,0,0;1,0,1]; l6=[1,1,1;0,0,1;1,0,1]; l7=[1,1,1;0,0,1;1,1,1];
l8=[1,1,1;1,0,1;1,1,1]; l9=[1,1,1;1,1,1;1,1,1];
outt=ones(3*row,3*col);
for r=1:row
    rowindx=3*row-1;
    for c=1:col
        colindx=3*col-1;
        
        if  0<=inn(r,c)<threshold
            outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l0;
        elseif  threshold<=inn(r,c)<2*threshold
            outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l1;
        elseif  2*threshold<=inn(r,c)<3*threshold
            outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l2;
        elseif  3*threshold<=inn(r,c)<4*threshold
             outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l3;
        elseif  4*threshold<=inn(r,c)<5*threshold
             outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l4;
        elseif  5*threshold<=inn(r,c)<6*threshold
            outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l5;
        elseif  6*threshold<=inn(r,c)<7*threshold
            outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l6;
        elseif  7*threshold<=inn(r,c)<8*threshold
            outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l7;
        elseif  8*threshold<=inn(r,c)<9*threshold
            outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l8;
        else 
            outt(rowindx-1:rowindx+1,colindx-1:colindx+1) = l9;
        end
    end
end
end
