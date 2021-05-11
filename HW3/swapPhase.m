### Combination of the spectrum and phase angle to image formation ###
## dst_1 : img_1의 Fourier spectrum과 img_2의 phase angle을 이용하여 Imgae Reconstruct ##
## dst_2 : img_1의 phase angle과 img_2의 Fourier spectrum을 이용하여 Imgae Reconstruct ##

function [dst_1, dst_2] = swapPhase(img_1, img_2)

F1 = fftshift(fft2(img_1));      % F1(u,v)

logf1 = log(1+abs(F1));
fm1 = logf1 - min(logf1(:));
fmax1 = max(fm1(:));
F_show1 = uint8(255*(fm1/fmax1));    
%figure();imshow(F_show1);        % input image1 Fourier spectrum 출력

pf1 = angle(F1);
pfm1 = pf1-min(pf1(:));
pfmax1 = max(pfm1(:));
pfs1 = uint8(255*(pfm1/pfmax1));
%figure();imshow(pfs1)            % input image1 phase 출력

F2 = fftshift(fft2(img_2));      % F2(u,v)

logf2 = log(1+abs(F2));
fm2 = logf2 - min(logf2(:));
fmax2 = max(fm2(:));
F_show2 = uint8(255*(fm2/fmax2));    
%figure();imshow(F_show2);        % input image2 Fourier spectrum 출력

pf2 = angle(F2);
pfm2 = pf2-min(pf2(:));
pfmax2 = max(pfm2(:));
pfs2 = uint8(255*(pfm2/pfmax2));
%figure();imshow(pfs2)            % input image2 phase 출력

mag = abs(F1);
phase = angle(F2);
Fuv1 = mag.*exp(1i*phase);
F1_ifft = ifft2(Fuv1);
fa1 = abs(F1_ifft);
fam1 = fa1 - min(fa1(:));
famax1 = max(fam1(:));
f_1 = uint8(255*(fam1/famax1));
%figure();imshow(f_1);

dst_1 = f_1;

mag2 = abs(F2);
phase2 = angle(F1);
Fuv2 = mag2.*exp(1i*phase2);
F2_ifft = ifft2(Fuv2);
fa2 = abs(F2_ifft);
fam2 = fa2 - min(fa2(:));
famax2 = max(fam2(:));
f_2 = uint8(255*(fam2/famax2));
%figure();imshow(f_2);

dst_2 = f_2;
end
