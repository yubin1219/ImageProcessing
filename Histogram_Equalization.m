function Histogram_list = getHist(image)
M = size(image,1);
N = size(image,2);
h = zeros(1,256);
p = zeros(1,256);
for i=1:1:M
    for j=1:1:N
        rk = uint16(image(i,j))+1;
        h(rk) = h(rk) + 1;
    end
end
p = h./(M*N);
Histogram_list = p;
end


function dst = histEqualization(image)
pr = getHist(image);
s = zeros(1,256);
for k = 1:1:256
    pr_sum=0;
    for i = 1:1:k
        pr_sum = pr_sum + pr(i)*255;
    end
    s(k) = pr_sum;
end
s = round(s);
%% Equalized histogram
ps = zeros(1,256);
for j=1:1:256
    sk = s(j)+1;
    ps(sk) = ps(sk) + pr(j);
end
%% Histogram-equalized image
M = size(image,1);
N = size(image,2);
newi = zeros(M,N);
for i=1:1:M
    for j=1:1:N
        r = uint16(image(i,j)) + 1;
        newi(i,j)=s(r);
    end
end
dst = uint8(newi);
end
