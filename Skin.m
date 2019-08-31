function [ten]=ten(hsv)
H=hsv(:,:,1);
S=hsv(:,:,2);                  
V=hsv(:,:,3);

H_ten= (H < 0.085) | (H > 0.9);
S_ten= (S > 0.16) & (S < 0.6);    
V_ten= (V > 0.25);

ten = H_ten & S_ten & V_ten;
ten1=ten;

SE=strel('disk',1);
SE2=strel('disk',6);
ten = imopen(ten,SE);
ten = imfill(ten,'holes');
ten =  imopen(ten,SE2);

ten = immultiply(ten,ten1);
end