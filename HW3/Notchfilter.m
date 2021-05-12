function dst = Notchfilter(src)
%% Vertical Notch Filter %%
  
M = size(src,1);
N = size(src,2);
F = fftshift(fft2(src));
vk = 32;
u = (0:M-1);
v = (0:N-1);
[V,U] = meshgrid(v,u);

% n , D0 조절에 따라 Notch Filter 형태 변형
n = 6;                  
D0 = 3;                 
n_ = N/2;

% Butterworth Notch Filter - Vertical
% i 수정에 따라 Notch Filter 위치 변형 
HNR = ones(M,N);
for i = 0 : M
    D = sqrt((U - i).^2 + (V-n_-vk).^2);
    D_ = sqrt((U - M + i).^2 + (V-n_+vk).^2);
    B = (1./(1+(D0./D).^(2*n))).*(1./(1+(D0./D_).^(2*n)));  
    HNR = HNR .* B;
end

G = F.* HNR;
G_ifft = ifft2(G);
g = abs(G_ifft);
g_rescale = rescale(g, 0, 255);
dst = uint8(g_rescale);

end
