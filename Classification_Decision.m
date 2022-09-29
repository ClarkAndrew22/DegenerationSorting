% Purpose: Develop code to analyze all images of neurons, no matter the
% orientation.

% Written by: ASC
% Date: 2022-09-29

%% Initialize
clear;
clc;

% Load in results from AUDDIT
load("Breaks.mat");
load("MasterFeatureTable.mat")

%% Adjust data structures to be easier to work with
dendriteBreakProp = 1-cell2mat(dendriteBreakProp);
dendriteLengths = cell2mat(cellfun(@transpose,dendriteLengths,'UniformOutput',false));
dendriteIntensities = cell2mat(cellfun(@transpose,dendriteIntensities,'UniformOutput',false));

% Get averages of dendrite data on per image basis.
meanBreak = mean(dendriteBreakProp,2);
meanLength = mean(dendriteLengths,2);
meanIntensity = mean(dendriteIntensities,2);

% Allocate for speed
featureCount = zeros(numel(imgSize),1);
weightFeatureCount = zeros(numel(imgSize),1);
featureCountLen = zeros(numel(imgSize),1);
meanSize = zeros(numel(imgSize),1);
minSize = zeros(numel(imgSize),1);
maxSize = zeros(numel(imgSize),1);

% Get bleb data on per image basis using for loop
for img = 1:numel(imgSize)

    tempTable = MasterFeatureTable(MasterFeatureTable.ImageNumber == img, :);

    % Get features
    featureCount(img) = size(tempTable,1);
    weightFeatureCount(img) = featureCount(img)./meanBreak(img);
    featureCountLen(img) = featureCount(img)./meanLength(img);

    if ~isempty(tempTable)
        meanSize(img) = mean(tempTable.Area);
        minSize(img) = min(tempTable.Area);
        maxSize(img) = max(tempTable.Area);
    else
        minSize(img) = NaN;
        maxSize(img) = NaN;
    end

end

% Combine all values
totalDegen = [meanBreak, featureCount, weightFeatureCount, meanSize];













