addpath('descripteurs/');
I = imread('Scene/bedroom/image_0001.jpg');

% params
delta = 8; % overlap
% patch from image
patch_1= I(1:16,1:16);
%imshow(patch_1);
%r = denseSampling(I,s,patch_1,delta); %    
%RectsImage(Ig,r(0),s);
%computeSIFT(s,Ig,Ior,Mg)
hx = [-1;0;1];
hy = [ 1 2 1];
Iy = convolution_separable(patch_1,hy,hx);
Ix = convolution_separable(patch_1,hx',hy');
% imshow(patch_1);
% figure;
% imagesc(Ix);
% figure;
% imagesc(Iy);
Ig = sqrt(Ix.^2 + Iy.^2);
Ior = orientation(Ix,Iy,I);

% Creating the Gaussian Mask
s =16;
Mg = gaussSIFT(s);

sift=computeSIFT(s,Ig,Ior,Mg)




