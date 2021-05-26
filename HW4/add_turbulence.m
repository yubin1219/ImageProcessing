%% Add atmospheric turbulence %%

function dst = add_turbulence(src, k)
[M,N] = size(src);
F = fftshift(fft2(src));    % F(u,v)

% H(u,v)
H = zeros(M,N);
for u = -M/2 + 1 : M/2
    for  v = -N/2 + 1 : N/2
        H(u+M/2,v+N/2) = exp(-k * (u^2 + v^2)^(5/6));
    end
end

G = F.*H;                   % G(u,v)
G_ifft = ifft2(G);          % g(x,y)
g = abs(G_ifft);
g_rescale = rescale(g,0,255);
dst = uint8(g_rescale);

end
