filho(hades, Crono).
filho(hades, reia).

filho(zeus, crono).
filho(zeus, reia).

filho(poseidon, crono).
filho(poseidon, reia).

dominio(zeus, ceu).
dominio(poseidon, mar).
dominio(hades, submundo).

divindade_olimpica(Deus) :-
    filho(Deus, crono),
    dominio(Deus, Dominio),
    (Dominio = ceu ; Dominio = mar ; Dominio = submundo).
