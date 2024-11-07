% Ejemplos de funciones que se pueden utilizar dentro de las listas en Prolog

% 1. member/2 - Comprueba si un elemento está en una lista
% Sintaxis: member(Element, List)
% Ejemplo:
?- member(a, [a, b, c]).  % Resultado: true
?- member(x, [a, b, c]).  % Resultado: false

% 2. length/2 - Calcula la longitud de una lista
% Sintaxis: length(List, Length)
% Ejemplo:
?- length([a, b, c, d], Length).  % Resultado: Length = 4

% 3. append/3 - Concatena dos listas o divide una lista en dos partes
% Sintaxis: append(List1, List2, Result)
% Ejemplo (concatenación):
?- append([1, 2], [3, 4], Result).  % Resultado: Result = [1, 2, 3, 4]
% Ejemplo (división):
?- append(X, Y, [1, 2, 3]).
% Posibles resultados:
% X = [], Y = [1, 2, 3] ;
% X = [1], Y = [2, 3] ;
% X = [1, 2], Y = [3] ;
% X = [1, 2, 3], Y = [].

% 4. reverse/2 - Invierte una lista
% Sintaxis: reverse(List, ReversedList)
% Ejemplo:
?- reverse([1, 2, 3, 4], Reversed).  % Resultado: Reversed = [4, 3, 2, 1]

% 5. nth0/3 y nth1/3 - Obtiene el elemento en la posición N (0-indexado o 1-indexado)
% Sintaxis:
% nth0(Index, List, Element) - Comienza desde el índice 0.
% nth1(Index, List, Element) - Comienza desde el índice 1.
% Ejemplo:
?- nth0(1, [a, b, c, d], Element).  % Resultado: Element = b
?- nth1(2, [a, b, c, d], Element).  % Resultado: Element = b

% 6. select/3 - Selecciona un elemento de una lista y devuelve la lista sin ese elemento
% Sintaxis: select(Element, List, NewList)
% Ejemplo:
?- select(b, [a, b, c, d], Result).  % Resultado: Result = [a, c, d]

% 7. delete/3 - Elimina todas las ocurrencias de un elemento en la lista
% Sintaxis: delete(List, Element, Result)
% Ejemplo:
?- delete([a, b, a, c, a], a, Result).  % Resultado: Result = [b, c]

% 8. last/2 - Devuelve el último elemento de una lista
% Sintaxis: last(List, LastElement)
% Ejemplo:
?- last([a, b, c, d], Last).  % Resultado: Last = d

% 9. min_list/2 y max_list/2 - Encuentra el mínimo o máximo en una lista de números
% Sintaxis:
% min_list(List, Min)
% max_list(List, Max)
% Ejemplo:
?- min_list([3, 7, 2, 9], Min).  % Resultado: Min = 2
?- max_list([3, 7, 2, 9], Max).  % Resultado: Max = 9

% 10. sum_list/2 - Calcula la suma de los elementos de una lista de números
% Sintaxis: sum_list(List, Sum)
% Ejemplo:
?- sum_list([1, 2, 3, 4], Sum).  % Resultado: Sum = 10
