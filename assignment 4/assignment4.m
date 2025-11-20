%% assignment4.m
% Analyze isometric strength data from isok_data_6803.csv.

% 1) Import data
[Subject_ID, Age, Gender, Weight, Day_1, Day_2, Day_3] = importfile('isok_data_6803.csv');

% 2) Make sure numeric columns are numeric (this prevents weird errors)
Weight = double(Weight);
Day_1  = double(Day_1);
Day_2  = double(Day_2);
Day_3  = double(Day_3);

% 3) Male/Female individual and group means (NOT normalized)
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = ...
    genderIsoCalc(Gender, Day_1, Day_2, Day_3);

% 4) Who improved between days?
day1toDay2 = dayComparer(Subject_ID, Day_1, Day_2);
day2toDay3 = dayComparer(Subject_ID, Day_2, Day_3);

% 5) Weight-normalized group means
normDay1mean = mean(Day_1 ./ Weight, 'omitnan');
normDay2mean = mean(Day_2 ./ Weight, 'omitnan');
normDay3mean = mean(Day_3 ./ Weight, 'omitnan');

% --- OPTIONAL: Print results to the Command Window ---
fprintf('\n--- GROUP MEANS (not normalized) ---\n');
fprintf('Male group mean:   %.2f\n', maleGroupIsoMean);
fprintf('Female group mean: %.2f\n', femaleGroupIsoMean);

fprintf('\n--- NORMALIZED DAY MEANS (value/weight) ---\n');
fprintf('Day 1 mean: %.4f\n', normDay1mean);
fprintf('Day 2 mean: %.4f\n', normDay2mean);
fprintf('Day 3 mean: %.4f\n', normDay3mean);

fprintf('\nImproved Day 1 -> Day 2 (IDs): ');
fprintf('%s ', string(day1toDay2));
fprintf('\n');

fprintf('Improved Day 2 -> Day 3 (IDs): ');
fprintf('%s ', string(day2toDay3));
fprintf('\n');

% 6) Export summary results to a CSV
iso_results = table(maleGroupIsoMean, femaleGroupIsoMean, ...
                    normDay1mean, normDay2mean, normDay3mean);
writetable(iso_results, 'iso_results.csv');