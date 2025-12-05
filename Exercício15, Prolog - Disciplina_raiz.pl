% Banco de dados
% disciplina(Nome, Creditos, Area)
disciplina(calculo_i, 6, matematica).
disciplina(calculo_ii, 6, matematica).
disciplina(algebra_linear, 4, matematica).
disciplina(estatistica, 4, matematica).
disciplina(geometria_analitica, 4, matematica).
disciplina(fisica_i, 5, fisica).
disciplina(fisica_ii, 5, fisica).
disciplina(programacao_i, 4, computacao).
disciplina(programacao_ii, 4, computacao).
disciplina(estruturas_dados, 6, computacao).
disciplina(banco_dados, 4, computacao).
disciplina(inteligencia_artificial, 6, computacao).
disciplina(redes_computadores, 4, computacao).
disciplina(compiladores, 6, computacao).
disciplina(intro_engenharia, 2, engenharia).
disciplina(sistemas_operacionais, 6, computacao).
disciplina(engenharia_software, 5, aplicacoes).
disciplica(desenvolvimento_web, 4, aplicacoes).
disciplina(mobile_apps, 4, aplicacoes).

prerequisito(calculo_ii, calculo_i).
prerequisito(fisica_ii, fisica_i).
prerequisito(fisica_i, calculo_i).
prerequisito(programacao_ii, programacao_i).
prerequisito(estruturas_dados, programacao_ii).
prerequisito(banco_dados, programacao_i).
prerequisito(inteligencia_artificial, estruturas_dados).
prerequisito(inteligencia_artificial, estatistica).
prerequisito(compiladores, estruturas_dados).
prerequisito(redes_computadores, programacao_ii).
prerequisito(sistemas_operacionais, estruturas_dados).
prerequisito(engenharia_software, estruturas_dados).
prerequisito(mobile_apps, programacao_ii).

% REGRA 1: disciplina_raiz(D)
disciplina_raiz(D) :-
    disciplina(D, _, _),
    \+ prerequisito(D, _).

% REGRA 2: disciplina_folha(D)
disciplina_folha(D) :-
    disciplina(D, _, _),
    \+ prerequisito(_, D).

% QUERY 3: Disciplinas que são RAIZ E não pertencem à área 'aplicacoes'
raiz_nao_aplicacoes(D) :-
    disciplina_raiz(D),
    disciplina(D, _, Area),
    Area \= aplicacoes.
    
tipo_disciplina(D, raiz) :- disciplina_raiz(D), !.
tipo_disciplina(D, folha) :- disciplina_folha(D), !.
tipo_disciplina(D, intermediaria) :- disciplina(D, _, _).

analisar_disciplina(D) :-
    disciplina(D, Cred, Area),
    format('~n=== Análise: ~w ===~n', [D]),
    format('Créditos: ~w | Área: ~w~n', [Cred, Area]),
    
    (   disciplina_raiz(D) ->
        write('É DISCIPLINA RAIZ~n')
    ;   write('Não é raiz~n'),
        forall(prerequisito(D, P), format('    - ~w~n', [P]))
    ),
    
    (   disciplina_folha(D) ->
        write('✓ É DISCIPLINA FOLHA (não é pré-req de nada)~n')
    ;   write('✗ Não é folha (é pré-requisito de):~n'),
        forall(prerequisito(Dep, D), format('    - ~w~n', [Dep]))
    ).

listar_raizes :-
    write('~n=== DISCIPLINAS RAIZ (sem pré-requisitos) ===~n'),
    (   disciplina_raiz(D) ->
        forall(disciplina_raiz(D),
               (disciplina(D, C, A),
                format('  ✓ ~w (~w créditos, ~w)~n', [D, C, A])))
    ;   write('  Nenhuma disciplina raiz encontrada.~n')
    ).

listar_folhas :-
    write('~n=== DISCIPLINAS FOLHA (não são pré-req) ===~n'),
    (   disciplina_folha(D) ->
        forall(disciplina_folha(D),
               (disciplina(D, C, A),
                format('  ✓ ~w (~w créditos, ~w)~n', [D, C, A])))
    ;   write('  Nenhuma disciplina folha encontrada.~n')
    ).

listar_raiz_nao_aplicacoes :-
    write('~n=== DISCIPLINAS RAIZ que NÃO são de Aplicações ===~n'),
    (   raiz_nao_aplicacoes(D) ->
        forall(raiz_nao_aplicacoes(D),
               (disciplina(D, C, A),
                format('  ✓ ~w (~w créditos, ~w)~n', [D, C, A])))
    ;   write('  Nenhuma disciplina encontrada.~n')
    ).

estatisticas :-
    findall(D, disciplina_raiz(D), Raizes),
    findall(D, disciplina_folha(D), Folhas),
    findall(D, (disciplina(D,_,_), \+ disciplina_raiz(D), \+ disciplina_folha(D)), Inter),
    length(Raizes, NRaizes),
    length(Folhas, NFolhas),
    length(Inter, NInter),
    write('~n=== ESTATÍSTICAS ===~n'),
    format('Disciplinas RAIZ: ~w~n', [NRaizes]),
    format('Disciplinas FOLHA: ~w~n', [NFolhas]),
    format('Disciplinas INTERMEDIÁRIAS: ~w~n', [NInter]).

visualizar_caminho(D) :-
    format('~n=== Caminho de Dependências: ~w ===~n', [D]),
    mostrar_prerequisitos(D, 0).

mostrar_prerequisitos(D, Nivel) :-
    tab(Nivel),
    format('→ ~w~n', [D]),
    NovoNivel is Nivel + 2,
    forall(prerequisito(D, P),
           mostrar_prerequisitos(P, NovoNivel)).

relatorio_completo :-
    listar_raizes,
    listar_folhas,
    listar_raiz_nao_aplicacoes,
    estatisticas.

% Exemplos de uso:
% ?- disciplina_raiz(D).
% ?- disciplina_folha(D).
% ?- raiz_nao_aplicacoes(D).
% ?- analisar_disciplina(calculo_i).
% ?- analisar_disciplina(inteligencia_artificial).
% ?- visualizar_caminho(inteligencia_artificial).
% ?- relatorio_completo.
