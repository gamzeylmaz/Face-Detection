clear all;clc;close all;
I=imread('breakbad.jpg');  %imge okunur
tic
I_hsv=RGB2hsv(I);       % Hsv uzayýna çeviren fonksiyonumuz
ten=ten(I_hsv);         %imge ten bulma fonksiyonuna gönderilir
ten_etiketle = bwlabel ( ten ); %ten imgesinde etiketleme yapýlýr
e = regionprops(ten_etiketle,'EulerNumber');
eulers=cat(1,e.EulerNumber);    %Etiketli bölgelerin euler numaralarý bulunur

Euler=zeros(size(ten));
for i=1:1:max(max(ten_etiketle))%imgedeki etiket sayýsý kadar döngüye girer
    if eulers(i,1) < 0  %Euler numarasý 0'ýn altýnda olanlar seçilir
        Euler=Euler+(ten_etiketle==i);
    end
end
Euler_etiket = bwlabel ( Euler );%Kalan imge tekrar etiketlenir.
max_yuz=0;
for i=1:1:max(max(Euler_etiket))
    if (sum(sum(Euler_etiket==i)))>max_yuz
        max_yuz=sum(sum(Euler_etiket==i));
        %imgedeki en büyük alanlý piksel grubu ve alaný bulunur.
    end
end
yuz=zeros(size(Euler_etiket));
for i=1:1:max(max(Euler_etiket))
    if sum(sum(Euler_etiket==i)) > max_yuz*0.25
        yuz=yuz + (Euler_etiket==i); 
        %imgede boyuta göre bir eþik uygulanmýþtýr
    end  
end
figure();imshow(I);
hold on
yuz_etiket = bwlabel ( yuz );
for i=1:1:max(max(yuz_etiket))
    [x(i), y(i)] = center(yuz_etiket==i);
    kutu_ciz(x(i),max_yuz/500,y(i),max_yuz/500);
    %yüzlerin orta noktalarý bulunup etrafýna kutu çizilmiþtir
end
toc