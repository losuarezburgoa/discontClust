1;
graphics_toolkit ("qt");

## Importing useful packages.
pkg load io
pkg load image
pkg load statistics
pkg load discontclust

## Import data from 'txt' file.
filename = 'example3'; % without extension
%[dipDir, dip] = textread ([filename,'data.txt'], '%d %d');
%trendPlungeArray = dipdirdip2pole ([dipDir, dip]);
dipDipdir = dlmread ([filename,'data.txt'], ',', 'A1:B83');
trendPlungeArray = dipdirdip2pole (dipDipdir);

## General plot parameters.
projectionType = 'equiarea';
symbolSize = 5;

## Performing the spectral clustering.
K = 3; % Dimension.
sigma = 0.12; % Scaling parameter.

[knTParrayCell, lCell, knNormEigVecCell] = spectralclustering (trendPlungeArray, ...
    K, sigma);

## Plotting the clustered data in the spherical projection.
pltfigClusts = plotclusterssphericalproy (knTParrayCell);
%print (pltfigClusts, [filename, 'K', num2str(K), projectionType, '.svg'], '-dsvg');