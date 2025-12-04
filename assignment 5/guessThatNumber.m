function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Kendall Gawlik
%
% DESCRIPTION: This program allows the user to play
%              the Number Guessing Game, and all the bugs have been
%              exterminated. (hopefully i think)
%            
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (bug exterminator version)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

%% bug: og code used ors (||), which made the loop never end
% fix: use ands (&&) instead so it only loops when level is not any valid
% option

while level ~= beginner && level ~= moderate && level ~= advanced       
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

%% bug: og code used = which made an "incorrect use of =" error and tried to assign instead of compare
% fix: use "==" instead for comparisons 

if level == beginner                      

    highest = beginnerHighest;

elseif level == moderate

    highest = moderateHighest;

else
   
    %% bug: og code had wrong variable name (advancedhighest)
    % fix: use advancedHighest, so caps the H
    highest = advancedHighest;          
end

% randomly select secret number between 1 and highest for level of play

%% bug: og code listed as "secretNumber = floor(rand() + 1 * highest)"
% which would generate the highest+1 (duh)
% fix: use randi(highest) instead so it gives an integer from 1 - highest
secretNumber = randi(highest);     

% initialize number of guesses and User_guess

%% bug: og code started at 1 so it would count a guess before the player even guessed
% fix: start at 0 instead lol

numOfTries = 0;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');

%% bug: og code used >= highest, which would reject the highest valid guess
% fix: use > highest, so the highest value is allowed
while userGuess < 1 || userGuess > highest

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct

%% bug: og code used both "userGuess > secretNumber", so the messages didnt match
% fix: use < for "too low", and > for "too high", and then else for correct

if userGuess < secretNumber
fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
else
    break
end
end

% after the loop ends, the user has guessed the secretNumber
if numOfTries == 1
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
    %% bug: og code had fprintf only pass secretNumber to two %d slots
    % fix: pass both secretNumber and numOfTries
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber, numOfTries);

end


fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % end of function

% end of game