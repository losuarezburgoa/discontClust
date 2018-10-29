1;

%graphics_toolkit ("qt"); % The default for Octave
graphics_toolkit("gnuplot"); % The used for exportation
%graphics_toolkit ("fltk");

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
%pltfigUnclusts =  plotunclusterssphericalproy (trendPlungeArray, ...
%    projectionType, symbolSize, false);
%print (pltfigUnclusts, [filename, 'equiarea.svg'], '-dsvg');

## Performing the spectral clustering.
K = 4; % Dimension.
sigma = 0.12; % Scaling parameter.

[knTParrayCell, lCell, knNormEigVecCell] = spectralclustering (trendPlungeArray, ...
    K, sigma);

## Plotting the clustered data in the spherical projection.
pltfigClusts = plotclusterssphericalproy (knTParrayCell);
print (pltfigClusts, [filename, 'KNequiarea.svg'], '-dsvg');
