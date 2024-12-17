
eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input),
	eliza(Input),!.
eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([buenas, tardes, _], ['Buenas tardes, Como puedo ayudarte hoy?'], []).
template([buenas, noches, _], ['Buenas noches, En qué te puedo ayudar?'], []).

template([hola, eliza, _], ['Hola, Que gusto verte! Que te gustaria discutir hoy?'], []).
template([hey, eliza, _], ['Hey, Que tal? Tienes alguna pregunta o tema en mente?'], []).

template([hola, _], ['Hola, Como te sientes hoy?'], []).

template([que, tal, _], ['Hola, Todo bien por aqui! Y tu, Como estás?'], []).
template([saludos, _], ['¡Saludos! Que quieres hablar hoy?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).


template([que, te, gusta, s(_), _], [flagLikesNew], [3]).		 


% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).

% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

				  
        
        
% Listar todas las categorías disponibles
template([cuales, son, todas, las, categorias, disponibles], [flagcategoriasdisponibles], [5]).
    
% Listar todos los dispositivos de una categoría específica
template([todos, los, dispositivos, de, la, categoria, s(Categoria)], [flagdispositivoscategoria], [6]).

% Listar todas las marcas disponibles en una categoría específica
template([cuales, son, las, marcas, en, la, categoria, s(Categoria)], [flagmarcascategoria], [7]).

% Templates de familia
template([quien, es, el, padre, de, s(_)], [flagfather], [5]).
template([quien, es, la, madre, de, s(_)], [flagmother], [5]).
template([quienes, son, los, hermanos, de, s(_)], [flagsiblings], [5]).
template([quienes, son, los, primos, de, s(_)], [flagcousins], [5]).
template([quien, es, el, abuelo, de, s(_)], [flaggrandfather], [5]).
template([quien, es, la, abuela, de, s(_)], [flaggrandmother], [5]).
template([quienes, son, los, tios, de, s(_)], [flaguncles], [5]).
template([quienes, son, las, tias, de, s(_)], [flagaunts], [5]).
template([quienes, son, los, hijos, de, s(_)], [flagson], [5]).
template([quienes, son, las, hijas, de, s(_)], [flagdaughter], [5]).

template(_, ['Please', explain, a, little, more, '.'], []). 

% Hechos
hombre(angel).
hombre(miguel).
hombre(jesus).
hombre(nicolas).
hombre(sergio).
hombre(fernando).
hombre(imanol).
hombre(alejandro).
hombre(rigo).

mujer(maria).
mujer(angelina).
mujer(guadalupe).
mujer(cristina).
mujer(rosa).
mujer(larisa).

padre(miguel, angel).
padre(miguel, cristina).
padre(jesus, miguel).
padre(jesus, sergio).
padre(nicolas, maria).
padre(nicolas, rosa).
padre(nicolas, alejandro).
padre(sergio, fernando).
padre(sergio, imanol).

madre(maria, angel).
madre(maria, cristina).
madre(angelina, maria).
madre(angelina, rosa).
madre(angelina, alejandro).
madre(guadalupe, miguel).
madre(guadalupe, sergio).
madre(rosa, fernando).

esposos(miguel, maria).
esposos(jesus, guadalupe).
esposos(nicolas, angelina).
esposos(sergio, rosa).
esposos(alejandro, larisa).
esposos(rigo, cristina).

% Regla para abuelos
abuelo(X, Y) :- padre(X, Z), padres(Z, Y).
abuela(X, Y) :- madre(X, Z), padres(Z, Y).

% Regla para padres 
padres(X, Y) :- padre(X, Y); madre(X, Y).

% Regla modificada para hermanos
hermanos(X, Y) :- (padre(Z, X), padre(Z, Y); madre(W, X), madre(W, Y)), X \= Y.

% Regla para primos
primos(X, Y) :- padres(A, X), padres(B, Y), hermanos(A, B).

% Relación de cuñados
cunado(X, Y) :- esposos(X, Z), hermanos(Z, Y). 
cunado(X, Y) :- esposos(Y, Z), hermanos(Z, X). 

% Relación de tíos y tías (incluyendo cónyuges)
tio(X, Y) :- hermanos(X, Z), padres(Z, Y), hombre(X).          
tio(X, Y) :- esposos(X, W), tia(W, Y).                         
tia(X, Y) :- hermanos(X, Z), padres(Z, Y), mujer(X).           
tia(X, Y) :- esposos(X, W), tio(W, Y).                         

% sobrinos
sobrino(X, Y) :- tio(Y, X), hombre(X).
sobrino(X, Y) :- tia(Y, X), hombre(X).
sobrina(X, Y) :- tio(Y, X), mujer(X).
sobrina(X, Y) :- tia(Y, X), mujer(X).

% Hijos
hijo(X, Y) :- padre(Y, X), hombre(X).
hijo(X, Y) :- madre(Y, X), hombre(X).
hija(X, Y) :- padre(Y, X), mujer(X).
hija(X, Y) :- madre(Y, X), mujer(X).

% Respuestas especificas
respuesta(flagfather, [S], R) :- padre(R, S).
respuesta(flagmother, [S], R) :- madre(R, S).
respuesta(flagsiblings, [S], R) :- findall(X, hermanos(S, X), R).
respuesta(flagcousins, [S], R) :- findall(X, primos(S, X), R).
respuesta(flaggrandfather, [S], R) :- abuelo(R, S).
respuesta(flaggrandmother, [S], R) :- abuela(R, S).
respuesta(flaguncles, [S], R) :- findall(X, tio(X, S), R).
respuesta(flagaunts, [S], R) :- findall(X, tia(X, S), R).
respuesta(flaggrandsons, [S], R) :- findall(X, nieto(X, S), R).
respuesta(flaggranddaughters, [S], R) :- findall(X, nieta(X, S), R).
respuesta(flagson, [S], R) :- hijo(S, R).
respuesta(flagdaughter, [S], R) :- hija(S, R).

% Bandera: Hijos (son)
flagson(Person, Son) :-
    hijo(Person, Son).

% Bandera: Hijas (daughter)
flagdaughter(Person, Daughter) :-
    hija(Person, Daughter).

% Derivar hijo/hija a partir de padre/madre
hijo(PadreOMadre, Hijo) :-
    padre(PadreOMadre, Hijo), hombre(Hijo).
hijo(PadreOMadre, Hijo) :-
    madre(PadreOMadre, Hijo), hombre(Hijo).
hija(PadreOMadre, Hija) :-
    padre(PadreOMadre, Hija), mujer(Hija).
hija(PadreOMadre, Hija) :-
    madre(PadreOMadre, Hija), mujer(Hija).


% Hechos de dispositivos electrónicos
dispositivo(telefono, samsung, s24).
dispositivo(telefono, cubot, x70).
dispositivo(telefono, huawei, p30).
dispositivo(telefono, xiaomi, redmi_note_8).

dispositivo(computadora, asus, rog_strix_g15).
dispositivo(computadora, acer, aspire_5).
dispositivo(computadora, hp, pavilion_gaming).
dispositivo(computadora, lenovo, ideapad_3).

dispositivo(smartwatch, apple, watch_series_6).
dispositivo(smartwatch, samsung, galaxy_watch_3).
dispositivo(smartwatch, huawei, watch_fit).
dispositivo(smartwatch, xiaomi, mi_band_5).

dispositivo(tablet, apple, ipad_pro).
dispositivo(tablet, samsung, galaxy_tab_s7).
dispositivo(tablet, huawei, matepad_pro).
dispositivo(tablet, xiaomi, mi_pad_5).

dispositivo(consola, sony, playstation_5).
dispositivo(consola, microsoft, xbox_series_x).
dispositivo(consola, nintendo, switch).


execute_query(flagdispositivoscategoria, Categoria, R):-
    flagdispositivoscategoria == flagdispositivoscategoria,
    findall((Marca, Modelo), dispositivo(Categoria, Marca, Modelo), Resultados),
    R = ['Dispositivos en la categoría ', Categoria, ': ', Resultados].

execute_query(flagmarcascategoria, Categoria, R):-
    flagmarcascategoria == flagmarcascategoria,
    setof(Marca, Modelo^dispositivo(Categoria, Marca, Modelo), Marcas),
    R = ['Marcas en la categoría ', Categoria, ': ', Marcas].

listar_categorias_disponibles(R):-
    setof(Categoria, Marca^Modelo^dispositivo(Categoria, Marca, Modelo), Categorias),
    R = ['Las categorías disponibles son: ', Categorias].


% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).


elizaLikesNew(_, R) :-
    findall(["A Eliza le gusta ", Gusto], likes(Gusto), Results), 
    flatten(Results, R).


% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.


% Eliza likesNew:
% Reemplazo en la respuesta
replace0([], _, _, Resp, Resp).
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, _), % No es relevante el contenido del token aquí
    Resp = [flagLikesNew | _],
    elizaLikesNew(_, R), !.


% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

replace0([I|_], Input, _, Resp, R):-
        nth0(I, Input, Atom),
        nth0(0, Resp, X),
        X == flagcategoriasdisponibles,
        listar_categorias_disponibles( R).

replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.

    

replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    execute_query(X, Atom, R).

% Manejo especifico para flagfather
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagfather | _], 
    ( padre(Padre, Atom) -> 
        format(atom(R), 'El padre de ~w es ~w.', [Atom, Padre]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no se quien es el padre de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo especifico para flagmother
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), 
    Resp = [flagmother | _],
     ( madre(Madre, Atom) -> 
        format(atom(R), 'La madre de ~w es ~w.', [Atom, Madre]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no se quien es la madre de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo especifico para hermanos
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), % Obten el nombre de la persona
    Resp = [flagsiblings | _], 
    findall(Hermano, hermanos(Atom, Hermano), ListaHermanos), % Obten todos los hermanos
    ( ListaHermanos \= [] -> 
        atomic_list_concat(ListaHermanos, ', ', ListaHermanosStr), % Convierte la lista a cadena
        format(atom(R), 'Los hermanos de ~w son: ~w.', [Atom, ListaHermanosStr]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no se quienes son los hermanos de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo especifico para primos
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), % Obten el nombre de la persona
    Resp = [flagcousins | _], % Verifica que sea la bandera correcta
    findall(Primo, primos(Atom, Primo), ListaPrimos), % Obten todos los primos
    ( ListaPrimos \= [] -> 
        atomic_list_concat(ListaPrimos, ', ', ListaPrimosStr), % Convierte la lista a cadena
        format(atom(R), 'Los primos de ~w son: ~w.', [Atom, ListaPrimosStr]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no se quienes son los primos de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo especifico para cada relacion
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaggrandfather | _],
    ( abuelo(Abuelo, Atom) ->
        format(atom(R), 'El abuelo de ~w es ~w.', [Atom, Abuelo])
    ;
        format(atom(R), 'Lo siento, no se quien es el abuelo de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaggrandmother | _],
    ( abuela(Abuela, Atom) ->
        format(atom(R), 'La abuela de ~w es ~w.', [Atom, Abuela])
    ;
        format(atom(R), 'Lo siento, no se quien es la abuela de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaguncles | _],
    findall(Tio, tio(Tio, Atom), ListaTios),
    ( ListaTios \= [] ->
        atomic_list_concat(ListaTios, ', ', ListaTiosStr),
        format(atom(R), 'Los tios de ~w son: ~w.', [Atom, ListaTiosStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son los tios de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagaunts | _],
    findall(Tia, tia(Tia, Atom), ListaTias),
    ( ListaTias \= [] ->
        atomic_list_concat(ListaTias, ', ', ListaTiasStr),
        format(atom(R), 'Las tias de ~w son: ~w.', [Atom, ListaTiasStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son las tias de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaggrandsons | _],
    findall(Nieto, nieto(Nieto, Atom), ListaNietos),
    ( ListaNietos \= [] ->
        atomic_list_concat(ListaNietos, ', ', ListaNietosStr),
        format(atom(R), 'Los nietos de ~w son: ~w.', [Atom, ListaNietosStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son los nietos de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaggranddaughters | _],
    findall(Nieta, nieta(Nieta, Atom), ListaNietas),
    ( ListaNietas \= [] ->
        atomic_list_concat(ListaNietas, ', ', ListaNietasStr),
        format(atom(R), 'Las nietas de ~w son: ~w.', [Atom, ListaNietasStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son las nietas de ~w.', [Atom])
    ), !.


replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagson | _],
    findall(Son, flagson(Atom, Son), ListaHijos),
    ( ListaHijos \= [] ->
        atomic_list_concat(ListaHijos, ', ', ListaHijosStr),
        format(atom(R), 'Los hijos de ~w son: ~w.', [Atom, ListaHijosStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son los hijos de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagdaughter | _],
    findall(Daughter, flagdaughter(Atom, Daughter), ListaHijas),
    ( ListaHijas \= [] ->
        atomic_list_concat(ListaHijas, ', ', ListaHijasStr),
        format(atom(R), 'Las hijas de ~w son: ~w.', [Atom, ListaHijasStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son las hijas de ~w.', [Atom])
    ), !.


replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagmother | _], madre(Atom, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagsiblings | _], findall(X, hermanos(Atom, X), R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagcousins | _], findall(X, primos(Atom, X), R), !.