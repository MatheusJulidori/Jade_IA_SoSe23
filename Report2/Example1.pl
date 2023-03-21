% Author: Matheus Julidori
% Date: 21.03.2023

female(anaFlavia).
female(anaCristina).
female(anaPaula).
female(joana).
female(elisa).
female(luna).
female(cris).
female(laura).
female(mirtes).
female(marina).
male(carlos).
male(cadu).
male(matheus).
male(cassio).
male(brad).
male(ullysses).
male(pedro).
male(miguel).
male(luka).

parent(anaFlavia,carlos,mirtes). /*parent(X,F,M)  X is kid of father F and mother M*/
parent(anaPaula,carlos,mirtes).
parent(anaCristina,carlos,mirtes).
parent(cadu,carlos,mirtes).
parent(matheus,ullysses,anaCristina).
parent(elisa,ullysses,anaCristina).
parent(pedro,cassio,anaFlavia).
parent(marina,cassio,anaFlavia).
parent(joana,cadu,cris).
parent(miguel,cadu,cris).
parent(laura,cadu,cris).
parent(luka,brad,anaPaula).
parent(luna,brad,anaPaula).

sister(X,Y):- /*X is sister of Y if*/
    female(X), /*X is female*/
    parent(X,F,M),
    parent(X,F,M), /*F and M are parents of both X and Y*/
    not(X=Y).

brother(X,Y):- /*X is brother of Y if*/
    male(X), /*X is male*/
    parent(X,F,M),
    parent(X,F,M), /*F and M are parents of both X and Y*/
    not(X=Y).
    
mother(M,C):- /*M is mother of child C if*/
    female(M), %M is female
    parent(C,_,M). /*C parent contains M in last position*/
    
father(F,C):- /*F is father of child C if*/
    male(F), %F is male
    parent(C,F,_). /*C parent contains F in second position*/
    
grandmother(G,C):- /*G is grandmother of child C if*/
   female(G), %G is female
   parent(C,F,M), %F and M are parents of C
   (mother(G,F) ; mother(G,M)). %G is either the mother of F or M
   
grandfather(G,C):- /*G is grandmother of child C if*/
   male(G), %G is female
   parent(C,F,M), %F and M are parents of C
   (father(G,F) ; father(G,M)). %G is either the mother of F or M