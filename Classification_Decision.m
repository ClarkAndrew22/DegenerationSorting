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

% Get bleb data on per image basis using for loop
for img = 1:numel(imgSize)

    tempTable = MasterFeatureTable(MasterFeatureTable.ImageNumber == img, :);
    


end
