% Problema 2: Las armas de los héroes

% Generar todas las permutaciones de una lista
permutacion([], []).
permutacion(Lista, [Elem|Perm]) :-
    select(Elem, Lista, Resto),
    permutacion(Resto, Perm).

% Restricciones de los héroes y armas
validar_mitologia_armas(aquiles, Arma) :-
    Arma \= escudo,
    Arma \= arco.
validar_mitologia_armas(perseo, Arma) :-
    Arma \= espada.
validar_mitologia_armas(hercules, Arma) :-
    Arma \= lanza,
    Arma \= escudo.
validar_mitologia_armas(teseo, Arma) :-
    Arma = arco;
    Arma = escudo.

% Asignación de armas a héroes
asignar_armas(Asignacion) :-
    % Lista de armas
    permutacion([espada, lanza, arco, escudo], Asignacion),
    % Asignar cada arma a un héroe
    Asignacion = [ArmaAquiles, ArmaPerseo, ArmaHercules, ArmaTeseo],
    validar_mitologia_armas(aquiles, ArmaAquiles),
    validar_mitologia_armas(perseo, ArmaPerseo),
    validar_mitologia_armas(hercules, ArmaHercules),
    validar_mitologia_armas(teseo, ArmaTeseo).

% Descripciones mitológicas
descripcion_mitologica_armas(aquiles, espada, "habilidad en batalla").
descripcion_mitologica_armas(perseo, arco, "precisión letal").
descripcion_mitologica_armas(hercules, lanza, "fuerza bruta").
descripcion_mitologica_armas(teseo, escudo, "protección y estrategia").

% Consulta con explicación adicional
mostrar_asignacion_armas :-
    asignar_armas([ArmaAquiles, ArmaPerseo, ArmaHercules, ArmaTeseo]),
    format("Aquiles usa ~w.~n", [ArmaAquiles]),
    format("Perseo usa ~w.~n", [ArmaPerseo]),
    format("Hércules usa ~w.~n", [ArmaHercules]),
    format("Teseo usa ~w.~n", [ArmaTeseo]),
    descripcion_mitologica_armas(_, ArmaAquiles, DescAquiles), format("Aquiles asociado con ~w.~n", [DescAquiles]),
    descripcion_mitologica_armas(_, ArmaPerseo, DescPerseo), format("Perseo asociado con ~w.~n", [DescPerseo]),
    descripcion_mitologica_armas(_, ArmaHercules, DescHercules), format("Hércules asociado con ~w.~n", [DescHercules]),
    descripcion_mitologica_armas(_, ArmaTeseo, DescTeseo), format("Teseo asociado con ~w.~n", [DescTeseo]).
