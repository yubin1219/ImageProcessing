function dst = freqBoxFilter(src,kernel_size)
  
% Frequency domain Filtering - Using Box kernel %
  
h = ones(kernel_size,kernel_size) ./ (kernel_size^2);  % h(x,y)

M = size(src,1);
N = size(src, 2);
hp = zeros(2*M, 2*N);
hp(M - (kernel_size-1)/2 : M + (kernel_size-1)/2, N - (kernel_size-1)/2 : N + (kernel_size-1)/2) = h(:,:);  % hp(x,y)

H = fftshift(fft2(hp));                                % H(u,v)

logf_b = log(1+abs(H));
fm = logf_b - min(logf_b(:));
fmax_b = max(fm(:));
H_show = uint8(255*(fm/fmax_b));
figure();imshow(H_show);                % kernel Fourier spectrum 출력

ph = angle(H);
phm = ph-min(ph(:));
phmax = max(phm(:));
ps = uint8(255*(phm/phmax));
figure();imshow(ps)                     % kernel phase 출력

% padding
img_p = zeros(2*M, 2*N);
img_p(1:M,1:N) = src(:,:);
F = fftshift(fft2(img_p));              % F(u,v)

logf = log(1+abs(F));
fm = logf - min(logf(:));
fmax = max(fm(:));
F_show = uint8(255*(fm/fmax));
figure();imshow(F_show);                % Input image Fourier spectrum 출력

pf = angle(F);
pfm = pf-min(pf(:));
pfmax = max(pfm(:));
pfs = uint8(255*(pfm/pfmax));
figure();imshow(pfs)                    % input image phase 출력

G = H.*F;                               % G(u,v)

logfG = log(1+abs(G));
fm = logfG - min(logfG(:));
fmaxG = max(fm(:));
G_show = uint8(255*(fm/fmaxG));
figure();imshow(G_show);

G_ifft = ifft2(G);
gp = ifftshift(G_ifft);                 % gp(x,y)

fp = abs(gp);
fpm = fp - min(fp(:));
fpmax = max(fpm(:));
g_p = uint8(255*(fpm/fpmax));
figure(); imshow(g_p)

g = g_p(1:M,1:N);                       % g(x,y)
figure(); imshow(g)

dst = g;
end
