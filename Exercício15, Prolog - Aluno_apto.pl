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
disciplina(inteligencia_artificial, 6, computacao).
disciplina(intro_engenharia, 2, engenharia).

prerequisito(calculo_ii, calculo_i).
prerequisito(fisica_ii, fisica_i).
prerequisito(fisica_i, calculo_i).
prerequisito(programacao_ii, programacao_i).
prerequisito(estruturas_dados, programacao_ii).
prerequisito(banco_dados, programacao_i).
prerequisito(inteligencia_artificial, estruturas_dados).
prerequisito(inteligencia_artificial, estatistica).

area_fundamental(matematica).
area_fundamental(fisica).

concluido(joao, calculo_i).
concluido(joao, algebra_linear).
concluido(joao, programacao_i).
concluido(joao, programacao_ii).

concluido(maria, calculo_i).
concluido(maria, calculo_ii).
concluido(maria, algebra_linear).
concluido(maria, estatistica).
concluido(maria, programacao_i).
concluido(maria, programacao_ii).
concluido(maria, estruturas_dados).

concluido(pedro, intro_engenharia).
concluido(pedro, programacao_i).

falta_concluir(Aluno, Disciplina) :-
    prerequisito(_, Disciplina),
    \+ concluido(Aluno, Disciplina).

% REGRA PRINCIPAL: aluno_apto(Aluno, Disciplina)
aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, _, Area),
    \+ area_fundamental(Area),
    \+ concluido(Aluno, Disciplina),
    todos_prerequisitos_concluidos(Aluno, Disciplina).

todos_prerequisitos_concluidos(Aluno, Disciplina) :-
    forall(prerequisito(Disciplina, PreReq),
           concluido(Aluno, PreReq)).

% QUERYS:

% Query 1: Quais disciplinas João está apto a cursar?
disciplinas_joao_apto(D) :-
    aluno_apto(joao, D).

% Query 2: Maria está apta a cursar inteligencia_artificial?
maria_apta_ia :-
    aluno_apto(maria, inteligencia_artificial).

% Predicados auxiliares para listagem formatada
listar_disciplinas_apto(Aluno) :-
    format('Disciplinas que ~w está apto a cursar:~n', [Aluno]),
    (   aluno_apto(Aluno, D) ->
        forall(aluno_apto(Aluno, D),
               (disciplina(D, Cred, Area),
                format('  ✓ ~w (~w créditos, ~w)~n', [D, Cred, Area])))
    ;   write('  Nenhuma disciplina disponível no momento.~n')
    ).

verificar_apto(Aluno, Disciplina) :-
    (   aluno_apto(Aluno, Disciplina) ->
        format('✓ ~w ESTÁ APTO a cursar ~w~n', [Aluno, Disciplina])
    ;   format('✗ ~w NÃO está apto a cursar ~w~n', [Aluno, Disciplina]),
        mostrar_motivo(Aluno, Disciplina)
    ).

mostrar_motivo(Aluno, Disciplina) :-
    disciplina(Disciplina, _, Area),
    (   area_fundamental(Area) ->
        format('  Motivo: ~w é da área fundamental (~w)~n', [Disciplina, Area])
    ;   concluido(Aluno, Disciplina) ->
        format('  Motivo: ~w já foi concluída~n', [Disciplina])
    ;   (   prerequisito(Disciplina, PreReq),
            \+ concluido(Aluno, PreReq) ->
            format('  Motivo: Falta concluir pré-requisito(s):~n'),
            forall((prerequisito(Disciplina, P), \+ concluido(Aluno, P)),
                   format('    - ~w~n', [P]))
        ;   write('  Motivo: Todos os pré-requisitos não foram satisfeitos~n')
        )
    ).

% Exemplos de uso:
% ?- disciplinas_joao_apto(D).
% ?- maria_apta_ia.
% ?- listar_disciplinas_apto(joao).
% ?- listar_disciplinas_apto(maria).
% ?- verificar_apto(maria, inteligencia_artificial).
