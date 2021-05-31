# Image Processing Homeworks
### HW1
- Affine Transformation
- Nearest & Bilinear 코드 구현
----------------
### HW2
1. Gamma Transformation
  - Input image   &   Gamma = 0.6   &   Gamma = 0.4   &   Gamma = 0.3   
  <img src="https://user-images.githubusercontent.com/74402562/117856338-74561780-b2c6-11eb-9eee-698f7a463b40.PNG" width="15%" height="15%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/117856335-74561780-b2c6-11eb-94b3-7952667adb5b.PNG" width="15%" height="15%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/117856334-73bd8100-b2c6-11eb-9644-2047b748d0da.PNG" width="15%" height="15%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/117856332-7324ea80-b2c6-11eb-8885-766d22a64022.PNG" width="15%" height="15%"></img>
  
2. Histogram Equalization
  - Input image & Histogram   
  <img src="https://user-images.githubusercontent.com/74402562/117855336-576d1480-b2c5-11eb-8f88-51e737bcabd5.jpg" width="28%" height="28%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/117855163-30aede00-b2c5-11eb-8df2-76f2f3234f53.png" width="36%" height="36%"></img>
  
  - Output image & Histogram   
  <img src="https://user-images.githubusercontent.com/74402562/117855329-563be780-b2c5-11eb-8e34-e95926213e5a.jpg" width="28%" height="28%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/117855166-31477480-b2c5-11eb-8223-19cedaeaa1f8.png" width="36%" height="36%"></img>

3. Spatial Domain Filtering   
  - Box kernel 11x11 - Zero Padding & Mirror Padding   
  <img src="https://user-images.githubusercontent.com/74402562/117856342-761fdb00-b2c6-11eb-86e2-d43de4238496.PNG" width="50%" height="50%"></img>
  
  - Box kernel 25x25 - Zero Padding & Mirror Padding   
  <img src="https://user-images.githubusercontent.com/74402562/117856343-76b87180-b2c6-11eb-9672-bab30a76da21.PNG" width="50%" height="50%"></img>
  
-----------------
### HW3
1. Frequency domain Filtering
- Low pass Gaussian kernel Fourier spectrum & phase angle (H(u,v))  
<img src="https://user-images.githubusercontent.com/74402562/117851641-7b2e5b80-b2c1-11eb-8470-28e14d6d7d32.PNG" width="30%" height="30%"></img>
<img src="https://user-images.githubusercontent.com/74402562/117851647-7bc6f200-b2c1-11eb-943d-4d77b8300473.PNG" width="30%" height="30%"></img>

- Input image Fourier spectrum & phase angle (F(u,v))   
<img src="https://user-images.githubusercontent.com/74402562/117851652-7cf81f00-b2c1-11eb-8637-a82eb668dc0a.PNG" width="30%" height="30%"></img>
<img src="https://user-images.githubusercontent.com/74402562/117851664-7ec1e280-b2c1-11eb-802d-fb778b46c7c8.PNG" width="30%" height="30%"></img>

- G(u,v)의 Fourier spectrum   
<img src="https://user-images.githubusercontent.com/74402562/117851673-82ee0000-b2c1-11eb-849a-7fbe7242f06a.PNG" width="30%" height="30%"></img>

- Input &  Output    
<img src="https://user-images.githubusercontent.com/74402562/117853498-78cd0100-b2c3-11eb-852a-3e0b513d6eb9.PNG" width="30%" height="30%"></img>
<img src="https://user-images.githubusercontent.com/74402562/117853502-79659780-b2c3-11eb-9966-154b1e57d1c8.PNG" width="30%" height="30%"></img>

2. Combination of the spectrum and phase angle to image formation - 2-D DFT and IDFT
- input img_1 & input img_2    
<img src="https://user-images.githubusercontent.com/74402562/117853507-79fe2e00-b2c3-11eb-9a6d-82bbc71df2cf.PNG" width="30%" height="30%"></img>
<img src="https://user-images.githubusercontent.com/74402562/117853503-79fe2e00-b2c3-11eb-950d-deb33e8207ed.PNG" width="30%" height="30%"></img>

- img_1의 Fourier spectrum  &  phase angle   
<img src="https://user-images.githubusercontent.com/74402562/117850772-9c427c80-b2c0-11eb-8977-a0f6db94227f.PNG" width="30%" height="30%"></img>
<img src="https://user-images.githubusercontent.com/74402562/117850773-9d73a980-b2c0-11eb-84b3-3b828492db7b.PNG" width="30%" height="30%"></img>

- img_2의 Fourier spectrum  &  phase angle  
<img src="https://user-images.githubusercontent.com/74402562/117850776-9d73a980-b2c0-11eb-91bf-a5097bf35f01.PNG" width="30%" height="30%"></img>
<img src="https://user-images.githubusercontent.com/74402562/117850777-9e0c4000-b2c0-11eb-990e-f804f3c0df44.PNG" width="30%" height="30%"></img>

- img_1의 Fourier spectrum과 img_2의 phase angle을 사용하여 Reconstuct한 Image   
<img src="https://user-images.githubusercontent.com/74402562/117850390-348c3180-b2c0-11eb-99c1-75585d7b9c91.PNG" width="30%" height="30%"></img>

- img_2의 Fourier spectrum과 img_1의 phase angle을 사용하여 Reconstuct한 Image   
<img src="https://user-images.githubusercontent.com/74402562/117850393-348c3180-b2c0-11eb-9db1-430ab144998a.PNG" width="30%" height="30%"></img>

3. Notch Filter   
- Input Image  
 
<img src="https://user-images.githubusercontent.com/74402562/117980619-1df0e380-b36f-11eb-983c-ac95a065dfc8.PNG" width="30%" height="30%"></img>
- Input Image의 Fourier spectrum   

<img src="https://user-images.githubusercontent.com/74402562/117980637-221d0100-b36f-11eb-967a-4d27589639a8.PNG" width="30%" height="30%"></img>
- Fourier transform multiplied by a Butterworth notch reject filter transfer function   

<img src="https://user-images.githubusercontent.com/74402562/117980648-23e6c480-b36f-11eb-9622-4908002038ce.PNG" width="30%" height="30%"></img>
- Output Image   

<img src="https://user-images.githubusercontent.com/74402562/117980652-25b08800-b36f-11eb-9726-c9328f9e463f.PNG" width="30%" height="30%"></img>

-----------------
### HW4
Image Restoration

1. Spatial Non-linear Filtering
- Salt & Pepper Noise 생성
  - Salt noise (ps = 0.1)    
  ![salt1](https://user-images.githubusercontent.com/74402562/120076425-70a4fc00-c0e0-11eb-9e49-06b3a874a5e5.PNG)
  <img src="https://user-images.githubusercontent.com/74402562/120076435-7995cd80-c0e0-11eb-9934-e8a1a58ab4ab.PNG" width="36%" height="36%"></img>
  
  - Pepper noise (pp = 0.1)    
  ![pepper1](https://user-images.githubusercontent.com/74402562/120076423-6f73cf00-c0e0-11eb-9441-ae9b10dd0435.PNG)
  <img src="https://user-images.githubusercontent.com/74402562/120076441-7e5a8180-c0e0-11eb-8d8f-cfee4c50cca0.PNG" width="36%" height="36%"></img>
  
  - Salt & Pepper noise (ps = pp = 0.05)    
  ![s p1](https://user-images.githubusercontent.com/74402562/120076427-713d9280-c0e0-11eb-88d9-e27b9ae8c9e9.PNG)
  <img src="https://user-images.githubusercontent.com/74402562/120076444-7ef31800-c0e0-11eb-983d-6a20035b304a.PNG" width="36%" height="36%"></img>
  
- Image degraded by Salt & Pepper noise (pp = 0.1 , ps = 0.1 , pp = ps = 0.1)    
  <img src="https://user-images.githubusercontent.com/74402562/120109576-fab69880-c1a4-11eb-9c88-4dd4c2635059.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120109579-fb4f2f00-c1a4-11eb-837d-e349796d8d56.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120109580-fc805c00-c1a4-11eb-8096-932e8eb2f407.PNG" width="26%" height="26%"></img>

- Contraharmonic Mean Filter      
  - Q = 1.5     
  <img src="https://user-images.githubusercontent.com/74402562/120109585-00ac7980-c1a5-11eb-8cff-0e788f7e4c90.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120109589-02763d00-c1a5-11eb-95d0-5e5fed6b254b.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120109592-030ed380-c1a5-11eb-918f-5425759fcf92.PNG" width="26%" height="26%"></img>
  
  - Q = 0      
  <img src="https://user-images.githubusercontent.com/74402562/120109587-01dda680-c1a5-11eb-8599-6874bf410a0a.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120109590-02763d00-c1a5-11eb-9a4e-b55c1512f558.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120109593-04d89700-c1a5-11eb-9f86-55fe7930a9f5.PNG" width="26%" height="26%"></img>
  
  - Q = -1.5      
  <img src="https://user-images.githubusercontent.com/74402562/120109588-01dda680-c1a5-11eb-8f15-f36a192f1ecc.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120109591-030ed380-c1a5-11eb-98c0-18c8aa617d42.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120109594-04d89700-c1a5-11eb-9535-5f55ad3e9897.PNG" width="26%" height="26%"></img>
  
- Median Filter       
  <img src="https://user-images.githubusercontent.com/74402562/120110254-ba0c4e80-c1a7-11eb-94db-fa60ee1bc6ce.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120110257-bd073f00-c1a7-11eb-8427-128427650242.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120110259-be386c00-c1a7-11eb-880b-113c982ccddf.PNG" width="26%" height="26%"></img>

- Adaptive Median Filter    
  <img src="https://user-images.githubusercontent.com/74402562/120110272-c7c1d400-c1a7-11eb-9eb4-8bc4c2fe070b.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120110274-c85a6a80-c1a7-11eb-8553-a1426b89aa24.PNG" width="26%" height="26%"></img>
  <img src="https://user-images.githubusercontent.com/74402562/120110275-c85a6a80-c1a7-11eb-98de-3bf6fb43bf5f.PNG" width="26%" height="26%"></img>

2. Frequency Domain Filtering
- Original Image    
  <img src="https://user-images.githubusercontent.com/74402562/120220819-4ede7d00-c278-11eb-9995-9d55622deffb.PNG" width="40%" height="40%"></img>

- Add Atmospheric Turbulence     
  <img src="https://user-images.githubusercontent.com/74402562/120220820-4f771380-c278-11eb-8644-cdd9026b383c.PNG" width="40%" height="40%"></img>
  
- Wiener Filter    
  <img src="https://user-images.githubusercontent.com/74402562/120220823-500faa00-c278-11eb-927b-09cf9b1e9dcf.PNG" width="40%" height="40%"></img>
