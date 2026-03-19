% --- 1. Reprezentam schimbarea de stare ---
opus(stg, dr).
opus(dr, stg).

% --- 2. Validare ---
% Invalid daca lupul sta cu capra fara taran
invalid(stare(Taran, Lup, Capra, _)) :- 
    Lup == Capra, 
    Taran \== Lup.

% Invalid daca capra sta cu varza fara taran
invalid(stare(Taran, _, Capra, Varza)) :- 
    Capra == Varza, 
    Taran \== Capra.

% Valid daca nu e invalid
valid(Stare) :- 
    \+ invalid(Stare).


% --- Mutari posibile ---
% Taran + Taran (se plimba singur)
mutare(stare(T1, L, C, V), stare(T2, L, C, V)) :- 
    opus(T1, T2).

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
% Afisarea detaliata a solutiei ---
joaca :-
    solutie(Drum),
    write('=== SOLUTIA GASITA ==='), nl, nl,
    afiseaza_drum(Drum, 0).

afiseaza_drum([], _).
afiseaza_drum([Stare | Rest], Pas) :-
    afiseaza_stare(Stare, Pas),
    PasUrmator is Pas + 1,
    afiseaza_drum(Rest, PasUrmator).