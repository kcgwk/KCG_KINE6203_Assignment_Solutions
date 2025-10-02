% Name: Kendall Gawlik
% Date: 09/24/2025
% Description: simple(ish) version of tic tac toe 

disp('Welcome to tic tac toe!')

% setup for asking if user wants to play with yes/no verif
startGame = input('Would you like to play a game? (Y/N): ','s');
while ~(upper(startGame) == 'Y' || upper(startGame)=='N')
    disp('Please enter Y or N.');
    startGame = input('Would you like to play a game? (Y/N): ','s');
end
% if the user says no then shame them
if upper(startGame) ~= 'Y'
    disp('You afraid to lose? Bye I guess!');
    return
end

% setup for asking if user wants to go first or let the puter start, and
% verif with yes/no
goFirst = input('Do you want to go first? (Y/N): ','s');
while ~(upper(goFirst) == 'Y' || upper(goFirst) == 'N') % y is user start & n is puter start (whoever goes first starts as X)
    disp('Please enter Y or N.');
    goFirst = input('Do you want to go first? (Y/N): ','s');
end

if upper(goFirst) == 'Y'
    playerPiece = 'X'; % user uses X
    puterPiece = 'O'; % puter is O
    playerFirst = true; % user goes first
else
    playerPiece = 'O'; % user uses O
    puterPiece = 'X'; % puter is X
    playerFirst = false; % puter goes first
end

% outer loop (play again), keeps going until user stops
playAgain = 'Y'; 

while upper(playAgain) == 'Y'
    board = repmat(' ', 3, 3); % creates a 3x3 board filled with spaces
    winner = ' '; % keeps track of winner (X, O, or empty space)

    for turn = 1:9 % max 9 moves
        if playerFirst
        % shows board before player move
        fprintf('\nCurrent board:\n');
        printBoard(board);
     
        % asks user to move (and re-asks if wrong input)
  while true
        fprintf('\nYour turn!\n');
        row = input('Enter row (1-3): ');
        col = input('Enter column (1-3): ');
        % makes sure the rows and columns are only whole nums and that the
        % spot on the board is empty 
        if row>=1 && row<=3 && col>=1 && col<=3 && row==floor(row) && col==floor(col) && board(row,col) == ' '
            board(row,col) == ' '
            board(row,col) = playerPiece; % places user move
            break                         % leaves input loop
        else
            disp('Invalid input or Spot taken! Use whole numbers 1-3 and try again.');
        end
  end
      
% shows and checks for a winner
printBoard(board);
w = checkBoard(board);
if w ~= ' '
    winner = w; fprintf('%s wins!\n', winner); break % ends the game early
end

% puter move, if there's spaces
[r,c] = find(board==' ');
if isempty(r), break % if board is full then tie so no winner
end
idx = randi(length(r)); % picks an empty spot
board(r(idx),c(idx)) = puterPiece; % puter's move

fprintf('\nPuter chose a move:\n');
printBoard(board);

w = checkBoard(board); % checking for winner after puter's move
if w ~= ' '
    winner = w; fprintf('%s wins!\n', winner); 
    break
end

        else
            % puter goes first
            [r,c] = find(board==' ');
            if isempty(r), break; end
            idx = randi(length(r));
            board(r(idx), c(idx)) = puterPiece;

            fprintf('\nPuter chose a move:\n')
            printBoard(board);

            w = checkBoard(board);
            if w~= ' '
                winner = w; fprintf('%s wins!\n', winner); break
            end

            % user move
       while true
           fprintf('\nYour turn!\n');
           row = input('Enter row (1-3): ');
           col = input('Enter column (1-3): ');

           if row>=1 && row<=3 && col >=1 && col<=3 && row==floor(row) && col==floor(col) && board(row,col) == ' '
               board(row,col) == ' '
               board(row,col) = playerPiece; 
               break
        else
            disp('Invalid input or spot taken! Use whole numbers 1-3 and try again!')
           end
        end 

        % show board and check for winner after user move
        printBoard(board);
        w = checkBoard(board);
        if w ~= ' '
            winner = w; fprintf('%s wins!\n', winner); break
        end
      end
    end

    % tie check (everyone sucks)
    if winner == ' '
        disp('It''s a tie!')
    end
    % asking if user wants to go again with yes/no verif
    playAgain = input('Play again? (Y/N): ', 's');
    while ~(upper(playAgain) == 'Y' || upper(playAgain) == 'N')
        disp('Please enter Y or N.');
        playAgain = input('Play again? (Y/N): ','s');
    end
end

disp('Thanks for playing!')

% functions! AH! I watched like 4 hours of youtube vids and it works (i
% think) copilot also helped me
function winner = checkBoard(board) % looks for 3 in a row/col/diag
    winner = ' '; % no winner

    % check rows
    for r = 1:3
        if board(r,1) ~= ' ' && board(r,1) == board(r,2) && board(r,2) == board(r,3)
            winner = board(r,1);
            return
        end
    end

    % check columns
    for c = 1:3
        if board(1,c) ~= ' ' && board(1,c) == board(2,c) && board(2,c) == board(3,c)
            winner = board(1,c);
            return
        end
    end

    % check diagonals
    if board(1,1) ~= ' ' && board(1,1) == board(2,2) && board(2,2) == board(3,3)
        winner = board(1,1);
        return
    end
    if board(1,3) ~= ' ' && board(1,3) == board(2,2) && board(2,2) == board(3,1)
        winner = board(1,3);
        return
    end
end

function printBoard(board) % makes the board that i wanted so the X/O fits within
    for r = 1:3
        fprintf(' %s | %s | %s \n', board(r,1), board(r,2), board(r,3));
        if r <= 3 % this stupid thing makes sure the dividers are btwn the rows
            disp('---|---|---');
        end
    end
end % if you didn't get the ref, puter is what batman calls his computer in the lego batman movie 10/10