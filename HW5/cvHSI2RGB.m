### Convert HSI to RGB ###
function dst = cvtHSI2RGB(src)
H = src(:,:,1);
S = src(:,:,2);
I = src(:,:,3);
[m,n,c] =size(src); 
R = zeros(m,n);
G = zeros(m,n);
B = zeros(m,n);
H = H.* 2.*pi();
H2 = H - (2*pi()/3);
H3 = H - (4*pi()/3);
for i = 1:m
    for j = 1:n
        if 0 <= H(i,j) && H(i,j) < (2*pi()/3)
            B(i,j) = I(i,j).*(1-S(i,j));
            R(i,j) = I(i,j).*(1+(S(i,j).*cos(H(i,j)))./(cos((pi()/3) - H(i,j))));
            G(i,j) = 3.*I(i,j) - (R(i,j)+B(i,j));
        elseif (2*pi()/3) <= H(i,j) && H(i,j) <= (4*pi()/3)
            R(i,j) = I(i,j).*(1-S(i,j));
            G(i,j) = I(i,j).*(1+(S(i,j).*cos(H2(i,j)))./(cos((pi()/3) - H2(i,j))));
            B(i,j) = 3.*I(i,j) - (R(i,j)+G(i,j));
        else
            G(i,j) = I(i,j).*(1-S(i,j));
            B(i,j) = I(i,j).*(1+(S(i,j).*cos(H3(i,j)))./(cos((pi()/3) - H3(i,j))));
            R(i,j) = 3.*I(i,j) - (G(i,j)+B(i,j));
        end
    end
end
dst = cat(3,R,G,B);
end
