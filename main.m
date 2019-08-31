clear all;clc;close all;
I=imread('breakbad.jpg');  %imge okunur
tic
I_hsv=RGB2hsv(I);       % Hsv uzay�na �eviren fonksiyonumuz
ten=ten(I_hsv);         %imge ten bulma fonksiyonuna g�nderilir
ten_etiketle = bwlabel ( ten ); %ten imgesinde etiketleme yap�l�r
e = regionprops(ten_etiketle,'EulerNumber');
eulers=cat(1,e.EulerNumber);    %Etiketli b�lgelerin euler numaralar� bulunur

Euler=zeros(size(ten));
for i=1:1:max(max(ten_etiketle))%imgedeki etiket say�s� kadar d�ng�ye girer
    if eulers(i,1) < 0  %Euler numaras� 0'�n alt�nda olanlar se�ilir
        Euler=Euler+(ten_etiketle==i);
    end
end
Euler_etiket = bwlabel ( Euler );%Kalan imge tekrar etiketlenir.
max_yuz=0;
for i=1:1:max(max(Euler_etiket))
    if (sum(sum(Euler_etiket==i)))>max_yuz
        max_yuz=sum(sum(Euler_etiket==i));
        %imgedeki en b�y�k alanl� piksel grubu ve alan� bulunur.
    end
end
yuz=zeros(size(Euler_etiket));
for i=1:1:max(max(Euler_etiket))
    if sum(sum(Euler_etiket==i)) > max_yuz*0.25
        yuz=yuz + (Euler_etiket==i); 
        %imgede boyuta g�re bir e�ik uygulanm��t�r
    end  
end
figure();imshow(I);
hold on
yuz_etiket = bwlabel ( yuz );
for i=1:1:max(max(yuz_etiket))
    [x(i), y(i)] = center(yuz_etiket==i);
    kutu_ciz(x(i),max_yuz/500,y(i),max_yuz/500);
    %y�zlerin orta noktalar� bulunup etraf�na kutu �izilmi�tir
end
toc