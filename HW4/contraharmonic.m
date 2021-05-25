function dst = contraharmonic(src,kernel_size, Q)
% Contraharmonic mean filtering %
  
[M,N] = size(src);
pad_i = zeros(M + kernel_size - 1, N + kernel_size - 1);
new_img = zeros(M,N);
k1 = floor(kernel_size/2);

% Input image Zero padding
for i = k1 + 1 : k1 + M
    for j = k1 + 1 : k1 + N
        pad_i(i,j) = src(i - k1, j - k1);
    end
end

% Filtering
for i = k1 + 1 : M + k1
    for j = k1 + 1 : N + k1
        filter = pad_i(i - k1 : i + k1, j - k1 : j + k1);
        f1 = filter.^(Q+1);
        f2 = filter.^Q;
        f1_sum = sum(f1(:));
        f2_sum = sum(f2(:));
        new_img(i - k1, j - k1) = f1_sum./f2_sum;
    end
end
dst = uint8(new_img);
end
