function sifts = computeSIFTsImage(I)
% DOC http://www.vlfeat.org/api/sift.html

sifts=[];

% params
delta = 8; % overlap
s =16;

% Extracting Norm of Gradient Ig, Orientation, And Gradient Ix & Iy
% matrices
hx = [-1;0;1]; % hx & hy :  2D - Sobel–Feldman kernel (https://en.wikipedia.org/wiki/Sobel_operator)
hy = [ 1 2 1];

Iy = convolution_separable(I,hy,hx);
Ix = convolution_separable(I,hx',hy');
Ig = sqrt(Ix.^2 + Iy.^2);
Ior = orientation(Ix,Iy,I);

% Creating the Gaussian Mask
Mg = gaussSIFT(s);

% Creating random patches
r=denseSampling(I,s,delta);

% For every patch in the image, compute the sift descriptor and store it 
for patch=r
    xi = patch(1);
    yi = patch(2);
    sift=computeSIFT(s,Ig(xi:xi+15,yi:yi+15),Ior(xi:xi+15,yi:yi+15),Mg);
    sifts = [sifts sift];
end

end

