% disciplina(Nome, Creditos, Area)
disciplina(calculo_i, 6, matematica).
disciplina(calculo_ii, 6, matematica).
disciplina(algebra_linear, 4, matematica).
disciplina(estatistica, 4, matematica).
disciplina(fisica_i, 5, fisica).
disciplina(fisica_ii, 5, fisica).
disciplina(programacao_i, 4, computacao).
disciplina(programacao_ii, 4, computacao).
disciplina(estruturas_dados, 6, computacao).
disciplina(banco_dados, 4, computacao).
disciplina(intro_engenharia, 2, engenharia).

% prerequisito(Disciplina, PreRequisito)
prerequisito(calculo_ii, calculo_i).
prerequisito(fisica_ii, fisica_i).
prerequisito(fisica_i, calculo_i).
prerequisito(programacao_ii, programacao_i).
prerequisito(estruturas_dados, programacao_ii).
prerequisito(banco_dados, programacao_i).

% REGRA 1: Disciplina de alto impacto
% Uma disciplina D é de alto impacto se:
% - Tem mais de 5 créditos (Creditos > 5)
% - É pré-requisito para pelo menos duas outras disciplinas diferentes
alto_impacto(D) :-
    disciplina(D, Creditos, _),
    Creditos > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

% QUERY 2: Disciplinas da área 'matematica' com 4 créditos
% que NÃO são pré-requisito para nenhuma outra disciplina
matematica_4_creditos_sem_dependentes(D) :-
    disciplina(D, 4, matematica),
    \+ prerequisito(_, D).

% Exemplos de consultas:
% ?- alto_impacto(D).
% ?- matematica_4_creditos_sem_dependentes(D).

% Listar todas as disciplinas de alto impacto
listar_alto_impacto :-
    write('Disciplinas de Alto Impacto:'), nl,
    forall(alto_impacto(D), 
           (disciplina(D, Cred, Area),
            format('  - ~w (~w créditos, ~w)~n', [D, Cred, Area]))).

listar_matematica_4_sem_dep :-
    write('Disciplinas de Matemática com 4 créditos sem dependentes:'), nl,
    forall(matematica_4_creditos_sem_dependentes(D),
           format('  - ~w~n', [D])).
