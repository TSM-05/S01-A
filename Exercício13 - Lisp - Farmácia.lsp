(defun calcula-dosagem (peso-kg idade-anos)
  (cond
  
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20)) 25)
    
    (t 50)))

(defun ajusta-preco (preco-base nome-da-erva)
  (cond
  
    ((string-equal nome-da-erva "Ginseng") (* preco-base 3.0))
    
    ((string-equal nome-da-erva "Lotus") (* preco-base 1.5))
    
    (t preco-base)))

(format t "--- Paciente 1 ---~%")
(format t "Erva: Lotus~%")
(format t "Dosagem: ~dml~%" (calcula-dosagem 60 14))
(format t "Preco Final: ~f moedas~%" (ajusta-preco 10 "Lotus"))

(format t "~%--- Paciente 2 (Crianca pequena) ---~%")
(format t "Erva: Ginseng~%")
(format t "Dosagem: ~dml~%" (calcula-dosagem 15 4)) 
(format t "Preco Final: ~f moedas~%" (ajusta-preco 10 "Ginseng"))

(format t "~%--- Paciente 3 ---~%")
(format t "Erva: Hortela~%")
(format t "Dosagem: ~dml~%" (calcula-dosagem 25 8))
(format t "Preco Final: ~f moedas~%" (ajusta-preco 10 "Hortela"))
