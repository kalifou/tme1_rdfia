clc;close all;clear;

%number of visual words
M = 1000

%randomly collect SIFTS
[points, norms] = randomSampling('allSifts/');

[centres, erreur] = solutionKMeans(points, M);

%TODO add null vector to visual words