% --- Mutari posibile ---
% Taran + Lup.
mutare(stare(T1, T1, C, V), stare(T2, T2, C, V)) :- 
    opus(T1, T2).

% Taran + capra.
mutare(stare(T1, L, T1, V), stare(T2, L, T2, V)) :- 
    opus(T1, T2).

% Taran + varza.
mutare(stare(T1, L, C, T1), stare(T2, L, C, T2)) :- 
    opus(T1, T2).

% Cazul de succes: Toate elementele au ajuns pe malul drept ('dr').
rezolva(stare(dr, dr, dr, dr), _, [stare(dr, dr, dr, dr)]).

% Recursivitatea.
rezolva(StareCurenta, Vizitate, [StareCurenta | Drum]) :-
    mutare(StareCurenta, StareUrmatoare),
    valid(StareUrmatoare),
    \+ member(StareUrmatoare, Vizitate), % Verificam sa nu mergem inapoi
    rezolva(StareUrmatoare, [StareCurenta | Vizitate], Drum).

% Startul programului, toti incep de la stanga ('stg').
solutie(Solutie) :-
    StareInitiala = stare(stg, stg, stg, stg),
    rezolva(StareInitiala, [], Solutie).
