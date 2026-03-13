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