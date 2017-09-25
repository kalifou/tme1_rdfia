clc;close all;clear;
% Adding path
addpath('descripteurs/');
addpath('k-means/');
% DOC http://www.vlfeat.org/api/sift.html

% params
delta = 8; % overlap
s =16;

%%%%%%%TEST
% Ps : le test echou pour l'image test ( I = marche()) car on obtient des Ior = O parfois ! (nonsense) 
I = randomImage('Scene/'); % PS : I = 200 X 267 
%I = marche();
xi = 121;%test on 125 97 121
xii = xi+15;
yj = 121;%test on 100 121 121
yjj = yj+15;
patch = [xi;yj];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extracting Norm of Gradient Ig, Orientation, And Gradient Ix & Iy
% matrices
hx = [-1;0;1]; % hx & hy :  2D - Sobel–Feldman kernel (https://en.wikipedia.org/wiki/Sobel_operator) 
hy = [ 1 2 1];

Iy = convolution_separable(I,hy,hx);
Ix = convolution_separable(I,hx',hy');
Ig = sqrt(Ix.^2 + Iy.^2);
Ior = orientation(Ix,Iy,Ig);

% Creating the Gaussian Mask
Mg = gaussSIFT(s);

% Computing & Visualizing SIFT results
sift=computeSIFT(s,Ig(xi:xii,yj:yjj),Ior(xi:xii,yj:yjj),Mg);
nom = 'Patch 1';
visuSIFT( I, Ig,Ior, patch ,nom,s,sift );
