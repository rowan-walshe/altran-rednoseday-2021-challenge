:- initialization get_key_code("Rowan_input.txt",K),
    write(K), nl,
    halt.

%% Parses the input file into a list of instructions,
%%  converts those instructions into keypad values,
%%  and the makes it into a string
get_key_code(F,K):-
    parse_file(F,Ls),
    parse_instructions(Ls,Ns),
    atomics_to_string(Ns,K).

parse_file(F,Ls):-
    open(F,read,S),
    parse_stream(S,Ls),
    close(S).

parse_stream(S,[]):-at_end_of_stream(S),!.
parse_stream(S,[Cs|T]):-
    read_line_to_codes(S,Cs),
    parse_stream(S,T).

%% Follows each set of instructions, storing each value
parse_instructions([HI|TI],[HV|TV]):-
    get_value(HI,5,HV),
    parse_instructions(TI,TV,HV).
parse_instructions([],[],_).
parse_instructions([HI|TI],[HV|TV],PV):-
    get_value(HI,PV,HV),
    parse_instructions(TI,TV,HV).

%% Gets the next value, given a list of instructions, and the starting position
get_value([],V,V).
get_value([H|T],V1,V):- up(H), top_key(V1), get_value(T,V1,V),!.
get_value([H|T],V1,V):- left(H), left_key(V1), get_value(T,V1,V),!.
get_value([H|T],V1,V):- right(H), right_key(V1), get_value(T,V1,V),!.
get_value([H|T],V1,V):- down(H), bottom_key(V1), get_value(T,V1,V),!.
get_value([H|T],V1,V):- up(H), V2 is V1 - 3, get_value(T,V2,V).
get_value([H|T],V1,V):- left(H), V2 is V1 - 1, get_value(T,V2,V).
get_value([H|T],V1,V):- right(H), V2 is V1 + 1, get_value(T,V2,V).
get_value([H|T],V1,V):- down(H), V2 is V1 + 3, get_value(T,V2,V).

%% Definition of instructions
up(85).
left(76).
right(82).
down(68).

%% Definition of edge keys on the keypad
top_key(1).
top_key(2).
top_key(3).
left_key(1).
left_key(4).
left_key(7).
right_key(3).
right_key(6).
right_key(9).
bottom_key(7).
bottom_key(8).
bottom_key(9).