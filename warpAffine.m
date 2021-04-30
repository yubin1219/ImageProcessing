function new_image = warpAffine(image, affine, flags) 
% Forward mapping
for i=1:1:size(image,1)
    for j=1:1:size(image,2)
        current_v=[i;j;1];
        new_v = affine*current_v;
        x=round(new_v(1,1));
        y=round(new_v(2,1));
        if x>=1 && y>=1
            new_i(x,y) = image(i,j);
        end
    end
end
% Inverse Mapping & Interpolation
if flags=="nearest"
    for i=1:1:size(new_i,1)
        for j=1:1:size(new_i,2)
            curr_v=[i;j;1];
            new_v = affine\curr_v;
            % interpolation
            if new_v(1) > 0.5 && new_v(1)<1
                new_v(1)=1;
            end
            if new_v(2) > 0.5 && new_v(2)<1
                new_v(2)=1;
            end
            if new_v(1) > size(image,1) && new_v(1) < (size(image,1)+0.5)
                new_v(1) = size(image,1);
            end
            if new_v(2) > size(image,2) && new_v(2)< (size(image,2)+0.5)
                new_v(2) = size(image,2);
            end
            % interpolation
            if new_v(1)>= 1 && new_v(2)>= 1 && new_v(1)<= size(image,1) && new_v(2)<= size(image,2)
                new_i(i,j) = image(round(new_v(1,1)),round(new_v(2,1)));
            end
        end
    end

elseif flags=="bilinear"
    for i=1:1:size(new_i,1)
        for j=1:1:size(new_i,2)
            curr_v=[i;j;1];
            new_v = affine\curr_v;
            if floor(new_v(1,1)) < 1
                new_v(1,1)=1;
            end
            if floor(new_v(2,1)) < 1
                new_v(2,1)=1;
            end
            if floor(new_v(1,1))>(size(image,1)-1)
                new_v(1,1)=size(image,1)-1;
            end
            if floor(new_v(2,1))>(size(image,2)-1)
                new_v(2,1)=size(image,2)-1;
            end
            x1=floor(new_v(1,1));
            y1=floor(new_v(2,1));
            x2=x1+1;
            y2=y1+1;
            NP1=image(x1,y1);
            NP2=image(x1,y2);
            NP3=image(x2,y1);
            NP4=image(x2,y2);
            dx=new_v(1,1)-x1;
            dy=new_v(2,1)-y1;
            new_i(i,j) = NP1*(1-dx)*(1-dy)+NP2*(1-dx)*dy+NP3*dx*(1-dy)+NP4*dx*dy;
        end
    end
end
new_image = new_i;
end
