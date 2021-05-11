function dst = freqBoxFilter(src,kernel_size)
  
% Frequency domain Filtering %
  
h = ones(kernel_size,kernel_size) ./ (kernel_size^2);
M = size(src,1);
N = size(src, 2);
hp = zeros(2*M, 2*N);
hp(M - (kernel_size-1)/2 : M + (kernel_size-1)/2, N - (kernel_size-1)/2 : N + (kernel_size-1)/2) = h(:,:);
H = fftshift(fft2(hp));
logf_b = log(1+abs(H));
fmax_b = max(logf_b(:));
H_show = uint8(255*(logf_b/fmax_b)); % H(u,v)
figure();imshow(H_show);

img_p = zeros(2*M, 2*N);
% padding
img_p(1:M,1:N) = src(:,:);
F = fftshift(fft2(img_p));
logf = log(1+abs(F));
fmax = max(logf(:));
F_show = uint8(255*(logf/fmax));     % F(u,v)
figure();imshow(F_show);

G = H.*F;                            % G(u,v)
logfG = log(1+abs(G));
fmaxG = max(logfG(:));
G_show = uint8(255*(logfG/fmaxG));
figure();imshow(G_show);

G_ifft = ifft2(G);
gp = ifftshift(G_ifft);              % gp(x,y)
fp = abs(gp);
fpmax = max(fp(:));
g_p = uint8(255*(fp/fpmax));
figure(); imshow(g_p)

g = g_p(1:M,1:N);                    % g(x,y)
figure(); imshow(g)

dst = g;
end
