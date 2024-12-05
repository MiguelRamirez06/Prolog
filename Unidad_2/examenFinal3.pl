% Problema 3: Las gemas de los titanes Cuatro titanes

% Guardianes y templos
guardianes([apolo, hecate, ares, hermes]).
templos([fuego, agua, tierra, aire]).

% Restricciones:
% Apolo no cuida el templo de fuego ni el de tierra
no_guarda(apolo, fuego).
no_guarda(apolo, tierra).

% Hécate no cuida el templo de aire
no_guarda(hecate, aire).

% Ares no cuida el templo de agua ni de aire
no_guarda(ares, agua).
no_guarda(ares, aire).

% Hermes cuida el templo de fuego o de agua
guarda_hermes(T) :- member(T, [fuego, agua]).

% Un guardián puede cuidar un templo si no tiene restricciones para ese templo
puede_guardar(Guard, Templo) :-
    \+ no_guarda(Guard, Templo),  % El guardián no tiene restricción para este templo
    (Guard \= hermes; guarda_hermes(Templo)).  % Hermes solo cuida fuego o agua

% Asignar templos a guardianes
asignar_temporales(Guardianes, Templos, Asignaciones) :-
    permutation(Guardianes, GuardianesAsignados),  % Genera una permutación de los guardianes
    maplist(puede_guardar, GuardianesAsignados, Templos),  % Verifica que cada guardián puede cuidar un templo
    zip(GuardianesAsignados, Templos, Asignaciones).  % Asigna guardianes a templos


zip([], [], []).
zip([X|Xs], [Y|Ys], [(X,Y)|Zs]) :- zip(Xs, Ys, Zs).

% Consulta para encontrar las asignaciones de templos a guardianes
consulta :-
    guardianes(Guardianes),
    templos(Templos),
    asignar_temporales(Guardianes, Templos, Asignaciones),
    write('Asignaciones: '), nl,
    write(Asignaciones).