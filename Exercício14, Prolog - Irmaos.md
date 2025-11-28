pai(cronos, zeus).
pai(cronos, poseidon).
pai(cronos, hades).
pai(cronos, hera).
pai(cronos, demeter).
pai(cronos, hestia).

mae(reia, zeus).
mae(reia, poseidon).
mae(reia, hades).
mae(reia, hera).
mae(reia, demeter).
mae(reia, hestia).

irmaos_germanos(A, B) :-
    pai(P, A),
    pai(P, B),
    mae(M, A),
    mae(M, B),
    A \= B.

