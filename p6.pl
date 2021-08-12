%
% CS 430 P6 (Prolog 2)
%
% Name: Jacob Hitzges
%


eval([eint, X], X).
eval([eadd, L, R], X) :- eval(L, LX), eval(R, RX), X is LX + RX.
eval([esub, L, R], X) :- eval(L, LX), eval(R, RX), X is LX - RX.
eval([emul, L, R], X) :- eval(L, LX), eval(R, RX), X is LX * RX.

countOps([eint, X], Y) :- Y is 0.
countOps([eadd, L, R], X) :- countOps(L, LX), countOps(R, RX), X is 1 + RX + LX.
countOps([esub, L, R], X) :- countOps(L, LX), countOps(R, RX), X is 1 + RX + LX.
countOps([emul, L, R], X) :- countOps(L, LX), countOps(R, RX), X is 1 + RX + LX.


height(nil, X) :- X is 0.
height([eint, X], Y) :- Y is 1.
height([eadd, L, R], X) :- height(L, LX), height(R, RX), X is 1 + LX.
height([esub, L, R], X) :- height(L, LX), height(R, RX), X is 1 + LX.
height([emul, L, R], X) :- height(L, LX), height(R, RX), X is 1 + LX.

postfix([eint, X], [X]).
postfix([eadd, L, R], X) :- postfix(L, LX), postfix(R, RX), append(LX,RX,Z), append(Z, [+], X).
postfix([esub, L, R], X) :- postfix(L, LX), postfix(R, RX), append(LX,RX,Z), append(Z, [-], X).
postfix([emul, L, R], X) :- postfix(L, LX), postfix(R, RX), append(LX,RX,Z), append(Z, [*], X).

uniqInts([eint, X], [X]).
uniqInts([eadd, L, R], X) :- uniqInts(L, LX), uniqInts(R, RX), append(LX,RX,Z), sort(Z, X).
uniqInts([esub, L, R], X) :- uniqInts(L, LX), uniqInts(R, RX), append(LX,RX,Z), sort(Z, X).
uniqInts([emul, L, R], X) :- uniqInts(L, LX), uniqInts(R, RX), append(LX,RX,Z), sort(Z, X).
