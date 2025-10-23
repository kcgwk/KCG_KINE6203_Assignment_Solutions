function total = coinTotal(q, d, n, p) % there was 0 chance im typing all those words out
% the inputs are the counts of each coin type, outputs are total dollar
% amount as a numb, and we know how much each coin equals so no explain for
% that
total = 0.25*q + 0.10*d + 0.05*n + 0.01*p;
end