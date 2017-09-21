addpath('descripteurs/');
addpath('k-means/');
%%%%%%%TEST
% Ps : le test echou pour l'image test ( I = marche()) car on obtient des Ior = O parfois ! (nonsense) 
%I = marche();
%imagesc(I)
%xi = 100;
%xii = xi+15;
%yj = 125;
%yjj = yj+15;
%patch_1 = I(xi:xii,yj:yjj); ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% params
delta = 8; % overlap


%%%% NORMAL : A COMMENTER SI TEST EN COURS
% Patch from image <=> Change xi &yi to modify sample
%% PS : I = 200 X 267 
I = randomImage('Scene/'); % marche();
xi = 100;
xii = xi+15;
yj = 100;
yjj = yj+15;
patch_1= I(xi:xii,yj:yjj);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Extracting Norm of Gradient Ig, Orientation, And Gradient Ix & Iy
% matrices
hx = [-1;0;1];
hy = [ 1 2 1];
Iy = convolution_separable(I,hy,hx);
Ix = convolution_separable(I,hx',hy');
Ig = sqrt(Ix.^2 + Iy.^2);
Ior = orientation(Ix,Iy,I);

% Creating the Gaussian Mask
s =16;
Mg = gaussSIFT(s);
% Computing & Visualizing SIFT results
sift=computeSIFT(s,Ig(xi:xii,yj:yjj),Ior(xi:xii,yj:yjj),Mg);
nom = 'Patch 1';
visuSIFT( I, Ig,Ior, patch_1 ,nom,s,sift );
