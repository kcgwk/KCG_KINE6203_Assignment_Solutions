function [maleIndMeans, femaleIndMeans, maleGroupMean, femaleGroupMean] = ...
    genderIsoCalc(gender, day1, day2, day3)
% GENDERISOCALC  Compute individual and group strength means by gender.
%   [MALEINDMEANS, FEMALEINDMEANS, MALEGROUPMEAN, FEMALEGROUPMEAN] =
%   GENDERISOCALC(GENDER, DAY1, DAY2, DAY3) calculates each subject's mean
%   strength across three testing days, then separates those values into
%   male and female groups based on the GENDER input.
%
%   GENDER can be written as 'Male'/'Female' or 'M'/'F'. DAY1, DAY2, and
%   DAY3 must be numeric vectors of the same length.

%% get each subject's mean across the 3 days
% basically smooshing the three day columns together and averaging each row
subMean = mean([day1 day2 day3], 2, 'omitnan');

%% break gender into "male" vs "female"
% letting ppl type M/F or Male/Female because ppl are inconsistent
g = lower(string(gender));
isMale   = startsWith(g,"m");
isFemale = startsWith(g,"f");

%% grab the individual means for each gender
% same numb of rows as subjects, just filtered by gender flags
maleIndMeans    = subMean(isMale);
femaleIndMeans  = subMean(isFemale);

%% now get the group means
% averaging the individual means, ignoring any missing values
maleGroupMean   = mean(maleIndMeans,   'omitnan');
femaleGroupMean = mean(femaleIndMeans, 'omitnan');

end