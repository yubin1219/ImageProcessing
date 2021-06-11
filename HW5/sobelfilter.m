function dst = sobelFilter(src,direction)
filter0 = [-1,-2,-1;0,0,0;1,2,1];
filter1 = [-1,0,1;-2,0,2;-1,0,1];

[m,n] = size(src);
new_img = zeros(m,n);
pad_i = zeros(m,n);

if direction==0
    filter = filter0;
elseif direction==1
    filter = filter1;
end

% mirror padding %
for i = 2 : m+1
    for j = 2 : n+1
        pad_i(i,j) = src(i-1,j-1);
    end
end

for j = 1 : (n+2)
    if j < 2
        pad_i(1,j) = pad_i(3-j,2);
    elseif j > (n+1)
        pad_i(1,j) = pad_i(j-n,n+1);
    else
        pad_i(1,j) = pad_i(2,j);
    end
end

for j = 1: (n+2)
    if j < 2
        pad_i(m+2,j) = pad_i(m+j,2);
    elseif j > (n+1)
        pad_i(m+2,j) = pad_i(3+m+n-j, n+1);
    else
        pad_i(m+2,j) = pad_i(m+1,j);
    end
end

for i = 2 : (m+1)
    pad_i(i,1) = pad_i(i,2);
end

for i = 2 : (m+1)
    pad_i(i,n+2) = pad_i(i,n+1);
end

% filtering %
for i = 1 : m
    for j = 1 : n
        temp = pad_i(i:i+2,j:j+2).* filter;
        new_img(i,j) = sum(temp(:));
    end
end
dst = new_img;
end
