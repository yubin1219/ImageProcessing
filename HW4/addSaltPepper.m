function dst = addSaltPepper(src, ps, pp)
% Add Salt and Pepper Noise %
  
salt_val = 255;
pepp_val = 0;

[M, N] = size(src);
noise_img = src;
p = ps + pp;
Pp = round(M * N * pp);
num = round(M * N * p);

rx=randi([1,M],1,round(M*N*p),'uint16');
ry=randi([1,N],1,round(M*N*p),'uint16');

for i = 1:num
    x = rx(i);
    y = ry(i);
    if i <= Pp
        noise_img(x,y) = pepp_val;
    else
        noise_img(x,y) = salt_val;
    end
end
dst = noise_img;
end
