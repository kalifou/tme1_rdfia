clc;close all;clear;
% Adding path
addpath('descripteurs/');
addpath('k-means/');

% params
delta = 8; % overlap
s =16;

%Reading & pathing a random image
I = randomImage('Scene/');
%I = marche();
sifts = computeSIFTsImage(I);
r=denseSampling(I,s,delta);
j = drawPatches(I,r,s,sifts);