10 LET NUMERO = rnd(100)

30 INPUT "Tente adivinhar o numero (0-100): "; PALPITE

40 IF PALPITE = NUMERO THEN GOTO 90
50 IF PALPITE > NUMERO THEN GOTO 80

60 PRINT "O numero correto e maior"
70 GOTO 30

80 PRINT "O numero correto e menor"
85 GOTO 30

90 PRINT "Parabens! Voce acertou!"
100 END
