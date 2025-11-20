function [Subject_ID, Age, Gender, Weight, Day_1, Day_2, Day_3] = importfile(filename)
% IMPORTFILE  Import isometric strength data from a CSV file.
%   [SUBJECT_ID, AGE, GENDER, WEIGHT, DAY_1, DAY_2, DAY_3] = IMPORTFILE(FILENAME)
%   reads the CSV file named FILENAME and returns each column from the dataset
%   as a separate output. The file must include the columns 'Subject ID',
%   'Age', 'Gender', 'Weight', 'Day 1', 'Day 2', and 'Day 3'. The original
%   header names are preserved.
%
%   FILENAME must be a character vector or string specifying the CSV file.

%% okay so now we're just pulling the columns straight out of the table
% nothing fanc just matching the header names exactly bc MATLAB
% gets dramatic if you don't tell it to preserve them  

T = readtable(filename, 'VariableNamingRule', 'preserve');

Subject_ID = T.("Subject ID");
Age        = T.("Age");
Gender     = T.("Gender");
Weight     = T.("Weight");
Day_1      = T.("Day 1");
Day_2      = T.("Day 2");
Day_3      = T.("Day 3");

end