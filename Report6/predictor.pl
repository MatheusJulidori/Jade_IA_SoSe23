:-dynamic (marketValue/2). % to informs the interpreter that the definition
:-dynamic (averageAge/2). % of the predicates
:-dynamic (shotAccuracy/2). % marketValue, averageAge , shotAccuracy and passAccuracy
:-dynamic (passAccuracy/2). % may change during execution

% feed the knowledge base with facts about team1
marketValue(team1,600). 
averageAge(team1,22).
shotAccuracy(team1,78).
passAccuracy(team1,30).

main(Qualified):- % main predicate to execute the predication model
	var(Team), % make sure that “Team” is unbounded variable
	write('What is the name of the team?'), read(Team), % read the name of the team 
 	predict(Team, Qualified). % predict if the team will be qualified or not.

% Predict functions

predict(Team, Qualified):-
    % First rule
    model ask_marketValue(Team,Value),
    Value>=400,
    ask_averageAge(Team,Avg),
    Avg<23,
    ask_shotAccuracy(Team,ShotAc),
    ShotAc<40,
    ask_passAccuracy(Team,PassAc),
    PassAc>=60,
    Qualified=yes,!.

predict(Team, Qualified):-
    % Second rule
    model ask_marketValue(Team,Value),
    Value>=400,
    ask_averageAge(Team,Avg),
    Avg<23,
    ask_shotAccuracy(Team,ShotAc),
    ShotAc>=40,
    ask_passAccuracy(Team,PassAc),
    PassAc<60,
    Qualified=yes,!.

predict(Team, Qualified):-
    % third rule
    model ask_marketValue(Team,Value),
    Value>=400,
    ask_averageAge(Team,Avg),
    Avg<23,
    ask_shotAccuracy(Team,ShotAc),
    ShotAc>=40,
    ask_passAccuracy(Team,PassAc),
    PassAc>=60,
    Qualified=yes,!.

predict(Team, Qualified):-
    % fourth rule
    model ask_marketValue(Team,Value),
    Value>=400,
    ask_averageAge(Team,Avg),
    Avg>=23,
    ask_shotAccuracy(Team,ShotAc),
    ShotAc>=40,
    ask_passAccuracy(Team,PassAc),
    PassAc>=60,
    Qualified=yes,!.

predict(Team, Qualified):-
    % fifth rule
    model ask_marketValue(Team,Value),
    Value<400,
    ask_averageAge(Team,Avg),
    Avg<23,
    ask_shotAccuracy(Team,ShotAc),
    ShotAc>=40,
    ask_passAccuracy(Team,PassAc),
    PassAc>=60,
    Qualified=yes,!.

predict(Team, Qualified):-
    % sixth rule
    model ask_marketValue(Team,Value),
    Value<400,
    ask_averageAge(Team,Avg),
    Avg>=23,
    ask_shotAccuracy(Team,ShotAc),
    ShotAc>=40,
    ask_passAccuracy(Team,PassAc),
    PassAc<60,
    Qualified=yes,!.

predict(_,Qualified):- Qualified=no. % if none of the rules of the decision tree can be applied the predictor, return no

%asking logics

ask_marketValue(Team,Value):- marketValue(Team,Value). % to get the value market of the team
ask_marketValue(Team,Value):-
	not(marketValue(Team,Value)), % if market value of a team is not defined as fact
    	write('what is the market value of the team?'), % the user can add this fact to the knowledge base
		read(Value), asserta(marketValue(Team,Value)).% using asserta predicate 

ask_averageAge(Team,Avg):- averageAge(Team,Avg).
ask_averageAge(Team,Avg):- 
    not(averageAge(Team,Avg)),
		write('what is the average age of the team?'),
		read(Avg), asserta(averageAge(Team,Avg)).

ask_shotAccuracy(Team,ShotAc):- shotAccuracy(Team,ShotAc).
ask_shotAccuracy(Team,ShotAc):-
	not(shotAccuracy(Team,ShotAc)),
		write('what is the shot accuracy of the team?'),
		read(ShotAc), asserta(shotAccuracy(Team,ShotAc)).

ask_passAccuracy(Team,PassAc):- passAccuracy(Team,PassAc).
ask_passAccuracy(Team,PassAc):-
	not(passAccuracy(Team,PassAc)),
		write('what is the shot accuracy of the team?'),
		read(PassAc), asserta(shotAccuracy(Team,PassAc)).
