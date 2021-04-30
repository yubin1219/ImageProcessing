function dst = gammaTransform(image,gamma)
M = size(image,1);
N = size(image,2);
max = 255^gamma;
newi = zeros(M,N);
for i = 1:1:M
    for j = 1:1:N
        r = cast(image(i,j),'double');
        r_= r^gamma;
        newi(i,j) = round(r_ * 255 / max);
    end
end
dst = uint8(newi);
end
