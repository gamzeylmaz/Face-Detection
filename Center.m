function [xmean, ymean] = center(bw)
bw=bwfill(bw,'holes');
area = bwarea(bw);
[m n] =size(bw);
bw=double(bw);

xmean =0; ymean = 0;
for i=1:m,
    for j=1:n,
        xmean = xmean + j*bw(i,j);
        ymean = ymean + i*bw(i,j);
    end;
end;

xmean = xmean/area;
ymean = ymean/area;

xmean = round(xmean);
ymean = round(ymean);
end
