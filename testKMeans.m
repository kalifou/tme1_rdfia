clc;close all;clear;

%number of visual words
M = 1000;

%randomly collect SIFTS
[points, norms] = randomSampling('allSifts/');

[centers, error] = solutionKMeans(points, M);

%TODO add null vector to visual words

%{
%run this to see what assignmentKMeans returns on a simple example 
a = [1 1 ; 0 0 ; 2 2 ; 5 5]
b =  [0 1 ; 4 4]
test = assignementKMeans(a,b)
%}