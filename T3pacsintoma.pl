% Pacientes y síntomas
tiene_sintoma(ana, fiebre).
tiene_sintoma(ana, tos).
tiene_sintoma(luis, cansancio).
tiene_sintoma(luis, dolor_cabeza).
tiene_sintoma(marta, fiebre).
tiene_sintoma(marta, vomito).
tiene_sintoma(pedro, dolor_estomago).
tiene_sintoma(pedro, nauseas).

% Relación entre síntomas y enfermedades
sintoma_de(fiebre, gripe).
sintoma_de(tos, gripe).
sintoma_de(cansancio, anemia).
sintoma_de(dolor_cabeza, migraña).
sintoma_de(vomito, infeccion).
sintoma_de(nauseas, infeccion).
sintoma_de(dolor_estomago, gastritis).

% Medicamentos que eliminan síntomas
elimina(aspirina, fiebre).
elimina(jarabe, tos).
elimina(vitaminas, cansancio).
elimina(analgesico, dolor_cabeza).
elimina(antiacido, dolor_estomago).
elimina(suero, vomito).
elimina(suero, dolor_cabeza).
elimina(antibiotico, infeccion).


% REGLAS 

% 1. Un paciente está enfermo si tiene un síntoma que pertenece a una enfermedad
tiene_enfermedad(Paciente, Enfermedad) :-
    tiene_sintoma(Paciente, Sintoma),
    sintoma_de(Sintoma, Enfermedad).

% 2. Un medicamento alivia una enfermedad si elimina uno de sus síntomas
alivia(Medicamento, Enfermedad) :-
    sintoma_de(Sintoma, Enfermedad),
    elimina(Medicamento, Sintoma).

% 3. Se puede recetar un medicamento a un paciente si alivia la enfermedad que tiene
se_puede_recetar(Paciente, Medicamento) :-
    tiene_enfermedad(Paciente, Enfermedad),
    alivia(Medicamento, Enfermedad).

% 4. Un síntoma es severo si aparece en mas de un paciente
sintoma_severo(Sintoma) :-
    tiene_sintoma(P1, Sintoma),
    tiene_sintoma(P2, Sintoma),
    P1 \= P2.

% 5. Un paciente tiene multiples síntomas
paciente_con_multiples_sintomas(Paciente) :-
    tiene_sintoma(Paciente, S1),
    tiene_sintoma(Paciente, S2),
    S1 \= S2.

% 6. Una enfermedad es compleja si tiene mas de un síntoma
enfermedad_compleja(Enfermedad) :-
    sintoma_de(S1, Enfermedad),
    sintoma_de(S2, Enfermedad),
    S1 \= S2.

% 7. Un medicamento sirve si elimina al menos un síntoma conocido
medicamento_util(Medicamento) :-
    elimina(Medicamento, _).

% 8. Un paciente tiene síntomas sin diagnóstico conocido
sintoma_sin_diagnostico(Paciente, Sintoma) :-
    tiene_sintoma(Paciente, Sintoma),
    \+ sintoma_de(Sintoma, _).

% 9. Un medicamento es multiusos si alivia mas de una enfermedad
medicamento_multiusos(Medicamento) :-
    alivia(Medicamento, X),
    alivia(Medicamento, Y),
    X \= Y.

% 10. Un paciente necesita suero si tiene vómito
necesita_suero(Paciente) :-
tiene_sintoma(Paciente, vomito).

% CONSULTAS 
% ¿Qué enfermedad tiene Ana?
?- tiene_enfermedad(ana, Enfermedad).

% ¿Qué medicamento se puede recetar a Luis?
?- se_puede_recetar(luis, Medicamento).

% ¿Qué síntomas son severos?
?- sintoma_severo(Sintoma).

% ¿Qué medicamentos son multiusos?
?- medicamento_multiusos(Medicamento).

% ¿Qué pacientes necesitan suero?
?- necesita_suero(Paciente).