/* facts */
/* father(X, Y) : X is father of Y*/
father(george, elizabeth2).
father(george, margaret).
father(philip, charles).
father(philip, anne).
father(philip, andrew).
father(philip, edward).
father(charles, william).
father(charles, henry).
father(andrew, beatrice).
father(andrew, eugenie).
/* mother(X, Y) : X is mother of Y */
mother(elizabeth1, elizabeth2).
mother(elizabeth1, margaret).
mother(elizabeth2, charles).
mother(elizabeth2, anne).
mother(elizabeth2, andrew).
mother(elizabeth2, edward).
mother(diana, william).
mother(diana, henry).
mother(sarah, beatrice).
mother(sarah, eugenie).
/* male(X) : X is male */ male(george).
male(philip).
male(charles).
male(andrew).
male(edward).
male(william).
male(henry).
/* female(X) : X is female */
female(elizabeth1).
female(elizabeth2).
female(margaret).
female(anne).
female(diana).
female(sarah).
female(sophie).
female(beatrice).
female(eugenie).

/* rules */
/* parent(X, Y) : X is parent of Y */
parent(X, Y) :-
	father(X,Y).

parent(X, Y) :-
	mother(X,Y).
    
/* child(X, Y) : X is a child of Y */
child(X, Y) :-
    parent(Y, X).

/* is_mother(X) : X is a mother */
is_mother(X) :-
    mother(X, _).

/* son(X, Y) : X is son of Y */
son(X, Y) :-
    male(X),
    parent(Y, X).

/* sibling(X, Y) : X is a sibling of Y, created this to make uncle rule easier*/ 
sibling(X, Y) :-
    parent(Z, X), % Z is a parent of X
    parent(Z, Y), % Z is a parent of Y
    not(X = Y).       % X and Y are not the same person


uncle(X, Y) :- % X is uncle of Y 
    parent(B,Y),% B is a parent of Y
    sibling(B,X),% B and X are siblings
    male(X). % X is male

uncle(X, Y) :- % X is uncle of Y 
    father(B,Y),% B is a parent of Y
    sibling(B,M), % B and M are sibling
    mother(M,C), % M is mother of C
    father(X,C), %X is father of C
    % The last two lines implicate that X is married to M, so he is brother in law of B
    % That means he is uncle of Y
    male(X). % X is male

/* grandfather(X, Y) : X is grandfather of Y */
grandfather(X, Y) :-
    father(X, Z),
    parent(Z, Y).

/* ancestor(X, Y) : X is an ancestor of Y */
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

/* descendent(X, Y) : X is a descendent of Y */
descendent(X, Y) :-
    parent(Y, X).
descendent(X, Y) :-
    parent(Y, Z),
    descendent(X, Z).
/*Here I used recursion because if I didn't there would be an new rules for
 * each time a new branch of the family would be added to the tree*/

/*
 * 1 - son(andrew,elizabeth1). False
 * 2 - parent(X,edward). philip and elizabeth2
 * 3 - grandfather(X,eugenie) - philip
 * 4 - ancestor(X,henry) - charles, diana, philip and elizabeth2
 * 5 - uncle(X,henry) - andrew and edward
 * */