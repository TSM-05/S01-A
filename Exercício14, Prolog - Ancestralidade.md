pai(urano, cronos).
pai(urano, rea).

pai(cronos, zeus).
pai(cronos, poseidon).
pai(cronos, hades).
pai(cronos, hera).
pai(cronos, demeter).
pai(cronos, hestia).

mae(gaia, cronos).
mae(gaia, rea).

mae(rea, zeus).
mae(rea, poseidon).
mae(rea, hades).
mae(rea, hera).
mae(rea, demeter).
mae(rea, hestia).

/* Caso Base */
ancestral(A, D) :-
    pai(A, D).
ancestral(A, D) :-
    mae(A, D).

/* Caso Recursivo */
ancestral(A, D) :-
    pai(A, Z),
    ancestral(Z, D).

ancestral(A, D) :-
    mae(A, Z),
    ancestral(Z, D).
