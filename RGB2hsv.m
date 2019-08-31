function [hsv]=RGB2hsv(A)

    I = double(A)/255;
    
    r = I(:,:,1);
    g = I(:,:,2);
    b = I(:,:,3);
    
    v = max (max (r, g), b);
    h = zeros (size (v));
    s = (v - min (min (r, g), b));
    z = ~s;
    s = s + z;
    k = find (r == v);
    h (k) = (g (k) - b (k))./s (k);
    k = find (g == v);
    h (k) = 2 + (b (k) - r (k))./s (k);
    k = find (b == v);
    h (k) = 4 + (r (k) - g (k))./s (k);
    h = h/6;
    k = find (h < 0);
    h (k) = h (k) + 1;
    h= (~z).*h;
    k = find (v);
    s (k) = (~z (k)).*s (k)./v (k);
    s (~v) = 0;

    hsv(:,:,1)=h;
    hsv(:,:,2)=s;
    hsv(:,:,3)=v;
        
end