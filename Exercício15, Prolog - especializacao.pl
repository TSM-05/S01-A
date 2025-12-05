% disciplina(Nome, Area)
disciplina(calculo_i, matematica).
disciplina(calculo_ii, matematica).
disciplina(algebra_linear, matematica).
disciplina(estatistica, matematica).
disciplina(geometria_analitica, matematica).
disciplina(programacao_i, computacao).
disciplina(programacao_ii, computacao).
disciplina(estruturas_dados, computacao).
disciplina(banco_dados, computacao).
disciplina(inteligencia_artificial, computacao).
disciplina(redes_computadores, computacao).
disciplina(fisica_i, fisica).
disciplina(fisica_ii, fisica).
disciplina(quimica_geral, quimica).

concluido(joao, programacao_i).
concluido(joao, programacao_ii).
concluido(joao, estruturas_dados).
concluido(joao, banco_dados).
concluido(joao, calculo_i).

concluido(maria, programacao_i).
concluido(maria, programacao_ii).
concluido(maria, fisica_i).
concluido(maria, quimica_geral).

concluido(pedro, programacao_i).
concluido(pedro, estruturas_dados).
concluido(pedro, fisica_i).

concluido(ana, calculo_i).
concluido(ana, programacao_i).
concluido(ana, fisica_i).

concluido(carlos, programacao_i).
concluido(carlos, programacao_ii).
concluido(carlos, banco_dados).
concluido(carlos, inteligencia_artificial).

especialista_comp(Aluno) :-
    disciplina(D1, computacao),
    disciplina(D2, computacao),
    D1 \= D2,
    concluido(Aluno, D1),
    concluido(Aluno, D2).

deficiencia_mat(Aluno) :-
    concluido(Aluno, _),  % Garante que o aluno existe
    \+ (disciplina(D, matematica), concluido(Aluno, D)).

% QUERY 3: Alunos que são especialistas em computação E têm deficiência em matemática
especialista_e_deficiente(Aluno) :-
    especialista_comp(Aluno),
    deficiencia_mat(Aluno).

contar_disciplinas_area(Aluno, Area, Count) :-
    findall(D, (disciplina(D, Area), concluido(Aluno, D)), Lista),
    length(Lista, Count).

perfil_aluno(Aluno) :-
    format('~n=== Perfil de ~w ===~n', [Aluno]),
    
    contar_disciplinas_area(Aluno, computacao, CompCount),
    contar_disciplinas_area(Aluno, matematica, MatCount),
    
    format('Disciplinas de Computação: ~w~n', [CompCount]),
    format('Disciplinas de Matemática: ~w~n', [MatCount]),
    
    (   especialista_comp(Aluno) ->
        write('É ESPECIALISTA em Computação~n')
    ;   write('NÃO é especialista em Computação~n')
    ),
    
    (   deficiencia_mat(Aluno) ->
        write('Tem Deficiência em Matemática~n')
    ;   write('NÃO tem deficiência em Matemática~n')
    ),
    
    (   especialista_e_deficiente(Aluno) ->
        write('É especialista E deficiente (caso crítico!)~n')
    ;   true
    ).

listar_todos_perfis :-
    write('ANÁLISE DE TODOS OS ALUNOS~n'),
    findall(A, concluido(A, _), TodosAlunos),
    list_to_set(TodosAlunos, AlunosUnicos),
    forall(member(Aluno, AlunosUnicos), perfil_aluno(Aluno)).

listar_especialistas :-
    write('~n=== Alunos Especialistas em Computação ===~n'),
    (   especialista_comp(A) ->
        forall(especialista_comp(A),
               format('  ✓ ~w~n', [A]))
    ;   write('  Nenhum aluno especialista encontrado.~n')
    ).

listar_deficientes :-
    write('~n=== Alunos com Deficiência em Matemática ===~n'),
    (   deficiencia_mat(A) ->
        forall(deficiencia_mat(A),
               format('  ✗ ~w~n', [A]))
    ;   write('  Nenhum aluno com deficiência encontrado.~n')
    ).

listar_ambos :-
    write('~n=== Alunos Especialistas E Deficientes ===~n'),
    (   especialista_e_deficiente(A) ->
        forall(especialista_e_deficiente(A),
               format('  ⚠ ~w~n', [A]))
    ;   write('  Nenhum aluno nesta categoria.~n')
    ).

% Relatório completo
relatorio_completo :-
    listar_especialistas,
    listar_deficientes,
    listar_ambos,
    listar_todos_perfis.

% Exemplos de uso:
% ?- especialista_comp(joao).
% ?- deficiencia_mat(maria).
% ?- especialista_e_deficiente(Aluno).
% ?- perfil_aluno(pedro).
% ?- relatorio_completo.
