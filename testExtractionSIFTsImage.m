% Adding path
%addpath('descripteurs/');
%addpath('k-means/');

% params
delta = 8; % overlap
eps = 10^-20; % to prevent from having null gradient
s =16;

%Reading & pathing a random image
I = randomImage('Scene/') + eps;
%I = marche()+eps;
sifts = computeSIFTsImage(I);
r=denseSampling(I,s,delta);
j = drawPatches(I,r,s,sifts);