### Convert RGB to HSI color space ###
function dst = cvtRGB2HSI(src)
R = src(:,:,1);
G = src(:,:,2);
B = src(:,:,3);

P = ((R-G)+(R-B))./2;
Q = sqrt((R-G).^2 + (R-B).*(G-B));
theta = acos(P./Q);
[m, n, c] = size(src);
H = zeros(m,n);
for i = 1: m
    for j = 1:n
        if B(i,j) > G(i,j)
            H(i,j) = 2*pi() - theta(i,j);
        else
            H(i,j) = theta(i,j);
        end
    end
end
H = H./(2*pi());

min_rgb = min(min(R,G),B);
S = 1 - 3.*min_rgb./(R+G+B);

I = (R+G+B)./3;
dst= cat(3,H,S,I);
end
