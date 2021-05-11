function dst = freqGaussFilter(src,kernel_size)
% Frequency domain Filtering - Gaussian kernel % 
% Generate Gaussian kernel
if kernel_size == 31
    sig = 5;
elseif kernel_size == 55
    sig = 9;
end
h = zeros(kernel_size, kernel_size);
for i = -(kernel_size - 1)/2 : floor(kernel_size/2)
    for j = -(kernel_size - 1)/2 : floor(kernel_size/2)
        h(i+1+(kernel_size - 1)/2, j+1+(kernel_size - 1)/2) = exp(-0.5 * (i * i + j * j)/(sig^2));
    end
end
n = sum(h(:));
h = h./n;                              % h(x,y)

% kernel padding
M = size(src,1);
N = size(src, 2);
hp = zeros(2*M, 2*N);
hp(M - (kernel_size-1)/2 : M + (kernel_size-1)/2, N - (kernel_size-1)/2 : N + (kernel_size-1)/2) = h(:,:);   % hp(x,y)

H = fftshift(fft2(hp));
logf_b=log(1+abs(H));
fmax_b=max(logf_b(:));
H_show = uint8(255*(logf_b/fmax_b));    % H(u,v)
figure();imshow(H_show);

% src padding
img_p = zeros(2*M, 2*N);
img_p(1:M,1:N) = src(:,:);
F = fftshift(fft2(img_p));
logf=log(1+abs(F));
fmax=max(logf(:));
F_show = uint8(255*(logf/fmax));        % F(u,v)
figure();imshow(F_show);

G = H.*F;                               % G(u,v)
logfG=log(1+abs(G));
fmaxG=max(logfG(:));
G_show = uint8(255*(logfG/fmaxG));
figure();imshow(G_show);

G_ifft = ifft2(G);
gp = ifftshift(G_ifft);                 % gp(x,y)
fp=abs(gp);
fpmax=max(fp(:));
g_p = uint8(255*(fp/fpmax));
figure();imshow(g_p)

g = g_p(1:M,1:N);                       % g(x,y)
figure();imshow(g)

dst = g;
end
