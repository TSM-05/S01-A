10 INPUT "Digite a nota parcial 1: "; N1
20 INPUT "Digite a nota parcial 2: "; N2
30 MEDIA = (VAL(N1) + VAL(N2)) / 2
40 IF MEDIA > 60 THEN GOTO 100
50 IF MEDIA < 30 THEN GOTO 200
60 INPUT "Digite a nota parcial 3: "; N3
70 MEDIA = (VAL(N1)+ VAL(N2) + VAL(N3)) /3
80 IF MEDIA >= 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado direto"
90 END
100 PRINT "Aprovado direto" 
110 END
200 PRINT "Reprovado na NP3"
210 END
