%%  Wiener Filtering %%

function dst = wienerFilter(src, K, k)
[M,N] = size(src);
G = fftshift(fft2(src));                          % G(u,v)

% H(u,v)
H = zeros(M,N);
for u = -M/2 + 1 : M/2
    for  v = -N/2 + 1 : N/2
        H(u + M/2, v + N/2) = exp(-k * (u^2 + v^2)^(5/6));
    end
end

% Wiener filter
H_abs = abs(H);
H_func = ((H_abs.^2)./(((H_abs.^2) + K) .* H));
F_hat = H_func .* G;                              % F_hat(u,v)
F_ifft = ifft2(F_hat);                            % f_hat(x,y)
f_hat = abs(F_ifft);
f_rescale = rescale(f_hat,0,255);
dst = uint8(f_rescale);

end
