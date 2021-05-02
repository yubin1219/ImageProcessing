function kernel = boxFilter(k)
kernel = ones(k,k) ./ (k^2);
end


function dst = imFilter(image, kernel, pad_type)
M = size(image,1);
N = size(image,2);
k = size(kernel,1);
pad_i = zeros(M+k-1,N+k-1);
newi = zeros(M,N);
K = (k-1)/2 + 1;
%% padding
if pad_type == "zero"
    for i = K:1:K+M-1
        for j = K:1:K+N-1
            pad_i(i,j)=image(i-K+1,j-K+1);
        end
    end
elseif pad_type == "mirror"
    for i = K:1:K+M-1
        for j = K:1:K+N-1
            pad_i(i,j)=image(i-K+1,j-K+1);
        end
    end
    for i= 1:1:(k-1)/2
        for j=1:1:N+k-1
            if j < K
                pad_i(K-i,j) = pad_i(K+(k-1)/2-j,K+i-1);
            elseif j > (K+N-1)
                pad_i(K-i,j) = pad_i(j-N,K+N-i);
            else
                pad_i(K-i,j) = pad_i(K+i-1,j);
            end
        end
    end
    for i=K+M:1:M+k-1
        for j=1:1:N+k-1
            if j < K
                pad_i(i,j) = pad_i(M+j,i-M);
            elseif j > (K+N-1)
                pad_i(i,j) = pad_i(2*K+M+N-j-1,2*K+M+N-i-1);
            else
                pad_i(i,j) = pad_i(2*(K+M-1)-i+1,j);
            end
        end
    end
    for j=1:1:(k-1)/2
        for i=K:1:K+M-1
            pad_i(i,K-j) = pad_i(i,K+j-1);
        end
    end
    for j=K+N:1:N+k-1
        for i=K:1:K+M-1
            pad_i(i,j) = pad_i(i,2*(K+N-1)-j+1);
        end
    end
end
%% convolution
for i=1:1:M
    for j=1:1:N
        temp = pad_i(i:i+k-1,j:j+k-1).* kernel;
        newi(i,j) = sum(temp(:));
    end
end
dst = uint8(newi);
end
