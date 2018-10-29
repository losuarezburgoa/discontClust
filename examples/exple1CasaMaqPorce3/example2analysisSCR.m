1;
graphics_toolkit ("gnuplot");

## Importing useful packages.
pkg load io
pkg load image
pkg load statistics
pkg load discontclust

## Import data from 'txt' file.
filename = 'example2'; % without extension
dipDipdir = dlmread ([filename,'data.csv'], ',', 'B1:C342');
trendPlungeArray = dipdirdip2pole (fliplr(dipDipdir));

## General plot parameters.
projectionType = 'equalangle';
symbolSize = 5;

## Performing the spectral clustering.
K = 4; % Dimension.
sigma = 0.12; % Scaling parameter.

[knTParrayCell, lCell, knNormEigVecCell] = spectralclustering (trendPlungeArray, ...
    K, sigma);

## Plotting the clustered data in the spherical projection.
pltfigClusts = plotclusterssphericalproy (knTParrayCell);
print (pltfigClusts, [filename, 'KNequiangle.svg'], '-dsvg');