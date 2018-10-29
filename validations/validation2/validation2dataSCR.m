1;

## Installing the package.
%pkg install discontclust-0.1.0.tar.gz

## spectralClusteringSCR
## Importing useful packages.
pkg load io
pkg load image
pkg load statistics
pkg load discontclust

## General plot parameters.
projectionType = 'equalarea';
symbolSize = 5;

#3 Import data from 'txt' file.
trendPlungeArray = load ('-ascii', 'validation2data.txt');

## Plotting the unclustered data in spherical projection.
%plotunclusterssphericalproy (trendPlungeArray, projectionType, ...
%    symbolSize, false);

## Performing the spectral clustering.
K = 3; % Dimension.
sigma = 0.12; % Scaling parameter.

[knTParrayCell, lCell, knNormEigVecCell] = spectralclustering (trendPlungeArray, ...
    K, sigma);

## Plotting the results of transfrmed U in K space.
%plotudata(knTParrayCell, knNormEigVecCell, lCell);

## Plotting the clustered data in the spherical projection.
plotclusterssphericalproy (knTParrayCell);
