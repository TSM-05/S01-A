dominio(zeus, ceu).
dominio(zeus, terra).
dominio(zeus, olimpo).

dominio(poseidon, mar).
dominio(poseidon, terra).

dominio(hades, submundo).

habita(zeus, olimpo).
habita(poseidon, olimpo). 

deus_maior(Deus) :-
    habita(Deus, olimpo),
    dominio(Deus, D1),
    dominio(Deus, D2),
    D1 \= D2.
