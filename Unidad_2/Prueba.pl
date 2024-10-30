padre(juna).
padre(jose).
padre(julio).
madre(maria).
madre(julia).
madre(rosa).
madre(antonia).
padrede(juana, jose).
padrede(juana, elpepe).
padrede(pedro, ramon).
padrede(pedro, maria).
padrede(josefo, josefa).
madrede(filomena, pedro).
abuelos(X,Y):-padrede(X,Z), padrede(Z,Y); madrede(Z,X), padrede(Z,Y).

/Tio, hermano, primo, cuñado/