%Q1-c

function img = scaling(image)
image_size = size(image);
img = zeros(round((image_size)./3),'uint8');
image_size = round((image_size)./3);
 for row = 1:image_size(1)
  for column = 1:image_size(2)  
  img(row,column) = image(3*row-1,3*column-1); 
  end
 end
end