% tipo de objeto 
es_objeto(martillo). 
es_objeto(silla). 
es_objeto(mesa). 
es_objeto(destornillador). 
es_objeto(cuchara). 

% HECHOS: materiales 
material(martillo, metal). 
material(destornillador, metal). 
material(cuchara, plastico). 
material(silla, madera). 
material(mesa, madera). 

% categorias 
tipo(martillo, herramienta). 
tipo(destornillador, herramienta). 
tipo(cuchara, utensilio). 
tipo(silla, mueble). 
tipo(mesa, mueble).

% Reglas:

% Un objeto es metalico si su material es metal
metalico(X) :- material(X, metal).

% Un objeto es de madera si su material es madera
madera(X) :- material(X, madera).

% Un objeto es herramienta si su tipo es herramienta
herramienta(X) :- tipo(X, herramienta).

% Un objeto es utilizable si es herramienta o utensilio
utilizable(X) :- herramienta(X).
utilizable(X) :- tipo(X, utensilio).

% Consultas:

% ¿Que objetos son metalicos?
% Consulta: ?- metalico(X).

% ¿La silla es de madera?
% Consulta: ?- madera(silla).

% ¿Que objetos son utilizables?
% Consulta: ?- utilizable(X).
