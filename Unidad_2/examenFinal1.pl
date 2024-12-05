% Problema 1: Los guardianes de los templos

% Generar todas las permutaciones de una lista
permutacion([], []).
permutacion(Lista, [Elem|Perm]) :-
    select(Elem, Lista, Resto),
    permutacion(Resto, Perm).

% Restricciones de los guardianes y templos
validar_mitologia_templos(apolo, Templo) :-
    Templo \= fuego,
    Templo \= tierra.
validar_mitologia_templos(hecate, Templo) :-
    Templo \= aire.
validar_mitologia_templos(ares, Templo) :-
    Templo \= agua,
    Templo \= aire.
validar_mitologia_templos(hermes, Templo) :-
    Templo = fuego;
    Templo = agua.

% Asignación de templos a guardianes
asignar_templos(Asignacion) :-
    % Lista de templos
    permutacion([fuego, agua, tierra, aire], Asignacion),
    % Asignar cada templo a un guardián
    Asignacion = [TemploApolo, TemploHecate, TemploAres, TemploHermes],
    validar_mitologia_templos(apolo, TemploApolo),
    validar_mitologia_templos(hecate, TemploHecate),
    validar_mitologia_templos(ares, TemploAres),
    validar_mitologia_templos(hermes, TemploHermes).

% Descripciones mitológicas
descripcion_mitologica(apolo, fuego, "purificación").
descripcion_mitologica(hecate, aire, "magia").
descripcion_mitologica(ares, tierra, "guerra").
descripcion_mitologica(hermes, agua, "viajes").

% Consulta con explicación adicional
mostrar_asignacion :-
    asignar_templos([TemploApolo, TemploHecate, TemploAres, TemploHermes]),
    format("Apolo guarda el templo de ~w.~n", [TemploApolo]),
    format("Hécate guarda el templo de ~w.~n", [TemploHecate]),
    format("Ares guarda el templo de ~w.~n", [TemploAres]),
    format("Hermes guarda el templo de ~w.~n", [TemploHermes]),
    descripcion_mitologica(_, TemploApolo, DescApolo), format("Apolo asociado con ~w.~n", [DescApolo]),
    descripcion_mitologica(_, TemploHecate, DescHecate), format("Hécate asociada con ~w.~n", [DescHecate]),
    descripcion_mitologica(_, TemploAres, DescAres), format("Ares asociado con ~w.~n", [DescAres]),
    descripcion_mitologica(_, TemploHermes, DescHermes), format("Hermes asociado con ~w.~n", [DescHermes]).
