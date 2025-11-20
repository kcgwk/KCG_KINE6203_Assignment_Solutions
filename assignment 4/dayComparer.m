function incIDs = dayComparer(subject_id, dayA, dayB)
% DAYCOMPARER  Find which subjects improved from one day to another.
%   INCIDS = DAYCOMPARER(SUBJECT_ID, DAYA, DAYB) checks each subject's
%   values on two different days and returns the IDs of those who increased
%   from DAYA to DAYB. All input vectors must be the same length.
%
%   This works for any two days in the dataset (for example Day 1>Day 2 or
%   Day 2>Day 3).

%% grab IDs where the second day beats the first day
% literally just "did you get better or not?" using logical indexing
incIDs = subject_id(dayB > dayA);

end