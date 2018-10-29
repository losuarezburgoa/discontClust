1;
graphics_toolkit("gnuplot")

## Installing the package.
%pkg install discontclust-0.1.0.tar.gz

## Importing useful packages.
pkg load io
pkg load image
pkg load statistics
pkg load discontclust

## General plot parameters.
projectionType = 'equalarea';
symbolSize = 5;

## Import data from 'txt' file.
filename = 'validation3'; % without extension
trendPlungeArray = load ('-ascii', [filename,'data.txt']);

## Plotting the unclustered data in spherical projection.
%plotunclusterssphericalproy (trendPlungeArray, projectionType, ...
%    symbolSize, false);

## Performing the spectral clustering.
K = 2; % Dimension.
sigma = 0.12; % Scaling parameter.

[knTParrayCell, lCell, knNormEigVecCell] = spectralclustering (trendPlungeArray, ...
    K, sigma);

## Plotting the results of transfrmed U in K space.
pltfigK2 = plotudata (knTParrayCell, knNormEigVecCell, lCell);
%print (pltfigK2, [filename, 'K2space.pdf'], '-dpdflatexstandalone');
%print (pltfigK2, [filename, 'K2space.pdf']);
print (pltfigK2, [filename, 'K2space.svg'], '-dsvg');

## Plotting the clustered data in the spherical projection.
pltfigClusts = plotclusterssphericalproy (knTParrayCell);
print (pltfigClusts, [filename, 'K2equiarea.svg'], '-dsvg');
