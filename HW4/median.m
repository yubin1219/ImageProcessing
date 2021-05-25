function dst = median(src, kernel_size)
% Median Filtering %
  
[M,N] = size(src);
new_img = zeros(M,N);
pad_i = zeros(M + kernel_size - 1, N + kernel_size - 1);
k1 = floor(kernel_size/2);
k2 = floor(kernel_size * kernel_size / 2);

% Input Zero padding
for i = k1 + 1 : k1 + M
    for j = k1 + 1 : k1 + N
        pad_i(i,j) = src(i - k1, j - k1);
    end
end

% Filtering
for i = k1 + 1 : M + k1
    for j = k1 + 1 : N + k1
        filter = pad_i(i - k1 : i + k1, j - k1 : j + k1);
        filter_flat = reshape(filter, 1, kernel_size * kernel_size);
        med = sort(filter_flat);
        new_img(i - k1, j - k1) = med(k2 + 1);
    end
end
dst = uint8(new_img);
end
