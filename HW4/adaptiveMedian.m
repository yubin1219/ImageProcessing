function dst = adaptiveMedian(src, kernel_size)
% Adaptive Median Filtering %
  
[M,N] = size(src);
new_img = zeros(M,N);
pad_i = zeros(M + kernel_size - 1, N + kernel_size - 1);
k1 = floor(kernel_size/2);

% Input Mirror padding
for i = k1 + 1 : k1 + M
    for j = k1 + 1 : k1 + N
        pad_i(i, j) = src(i - k1, j - k1);
    end
end
K = k1 + 1;
for i = 1 : k1
    for j = 1 : N + kernel_size - 1
        if j < K
            pad_i(K - i, j) = pad_i(K + (kernel_size - 1) / 2 - j, K + i - 1);
        elseif j > (K + N - 1)
            pad_i(K - i, j) = pad_i(j - N, K + N - i);
        else
            pad_i(K - i, j) = pad_i(K + i - 1, j);
        end
    end
end
for i = K + M : M + kernel_size - 1
    for j = 1 : N + kernel_size - 1
        if j < K
            pad_i(i, j) = pad_i(M + j, i - M);
        elseif j > (K + N - 1)
            pad_i(i, j) = pad_i(2 * K + M + N - j - 1, 2 * K + M + N - i - 1);
        else
            pad_i(i, j) = pad_i(2 * (K + M - 1) - i + 1, j);
        end
    end
end
for j = 1 : k1
    for i = K : K + M - 1
        pad_i(i, K - j) = pad_i(i, K + j - 1);
    end
end
for j = K + N : N + kernel_size - 1
    for i = K : K + M - 1
        pad_i(i, j) = pad_i(i, 2 * (K + N - 1) - j + 1);
    end
end

% Adaptive median filtering
for i = k1 + 1 : M + k1
    for j = k1 + 1 : N + k1
        zxy = pad_i(i, j);
        filter = pad_i(i - k1 : i + k1 , j - k1 : j + k1);
        for s = 3 : 2 : kernel_size
            s1 = floor(s/2);
            s2 = floor(s*s/2);
            filter2 = filter(k1 + 1 - s1 : k1 + 1 + s1, k1 + 1 - s1 : k1 + 1 + s1);
            zmin = min(filter2(:));
            zmax = max(filter2(:));
            filter_flat = reshape(filter2, 1, s * s);
            med = sort(filter_flat);
            zmed = med(s2 + 1);
            if (zmin < zmed) && (zmed < zmax)
                if (zmin < zxy) && (zxy < zmax)
                    new_img(i - k1, j - k1) = zxy;
                    break;
                else
                    new_img(i - k1, j - k1) = zmed;
                    break;
                end
            end
            
            if s == kernel_size
                new_img(i - k1, j - k1) = zmed;
            end
        end        
    end
end
dst = uint8(new_img);
end
