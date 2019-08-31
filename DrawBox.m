function kutu_ciz ( x, en, y, boy)
line ( [x-en : x+en], [y-boy : y-boy] ,'Color',[0 1 0]);
line ( [x-en : x+en], [y+boy : y+boy] ,'Color',[0 1 0]);
line ( [x-en : x-en], [y-boy : y+boy] ,'Color',[0 1 0]);
line ( [x+en : x+en], [y-boy : y+boy] ,'Color',[0 1 0]);
end