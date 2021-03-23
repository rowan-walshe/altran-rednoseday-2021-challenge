:- initialization get_key_code("Rowan_input.txt",K),
    write(K), nl,
    halt.

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

parse_instructions([HI|TI],[HV|TV]):-
    get_value(HI,5,HV),
    parse_instructions(TI,TV,HV).
parse_instructions([],[],_).
parse_instructions([HI|TI],[HV|TV],PV):-
    get_value(HI,PV,HV),
    parse_instructions(TI,TV,HV).

get_value(Cs,V):-
    get_value(Cs,5,V).

get_value([],V,V).
get_value([H|T],V1,V):-
    H is 85,
    V1 is 1,
    V2 is V1 + 3,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 85,
    V1 is 2,
    V2 is V1 + 3,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 85,
    V1 is 3,
    V2 is V1 + 3,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 76,
    V1 is 1,
    V2 is V1 + 1,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 76,
    V1 is 4,
    V2 is V1 + 1,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 76,
    V1 is 7,
    V2 is V1 + 1,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 82,
    V1 is 3,
    V2 is V1 - 1,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 82,
    V1 is 6,
    V2 is V1 - 1,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 82,
    V1 is 9,
    V2 is V1 - 1,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 68,
    V1 is 7,
    V2 is V1 - 3,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 68,
    V1 is 8,
    V2 is V1 - 3,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 68,
    V1 is 9,
    V2 is V1 - 3,
    get_value(T,V2,V),!.
get_value([H|T],V1,V):-
    H is 85,
    V2 is V1 - 3,
    get_value(T,V2,V).
get_value([H|T],V1,V):-
    H is 76,
    V2 is V1 - 1,
    get_value(T,V2,V).
get_value([H|T],V1,V):-
    H is 82,
    V2 is V1 + 1,
    get_value(T,V2,V).
get_value([H|T],V1,V):-
    H is 68,
    V2 is V1 + 3,
    get_value(T,V2,V).