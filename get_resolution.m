%Q1-b

function [W,H] = get_resolution(Size_Inch,dpi)
W=Size_Inch*dpi;
H=Size_Inch*dpi;
W=3*round(W/3);
H=3*round(H/3);
end