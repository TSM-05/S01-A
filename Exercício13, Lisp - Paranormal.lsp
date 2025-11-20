(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)


(defun soma-medo-recursiva (lista)
  (if (null lista)
      0
      (+ (ocorrencia-nivel-medo (car lista))
         (soma-medo-recursiva (cdr lista)))))


(defun analise-final (lista-ocorrencias)
  
  (let ((media-medo (/ (soma-medo-recursiva lista-ocorrencias) 
                       (length lista-ocorrencias))))
    
    (format t "A media de medo calculada foi: ~f~%" media-medo)
    
    (let ((criticas 
            (remove-if-not 
              (lambda (obs) 
                (and (> (ocorrencia-agentes-enviados obs) 3)
                     (> (ocorrencia-nivel-medo obs) media-medo)))
              lista-ocorrencias)))
      
      (mapcar #'ocorrencia-nome criticas))))

(defparameter *missoes*
  (list
    (make-ocorrencia :nome "Sussurros no Porao" 
                     :ritual "Nenhum" 
                     :nivel-medo 10 
                     :agentes-enviados 2)
    
    (make-ocorrencia :nome "Espiritos da Floresta" 
                     :ritual "Fogo Fatuo" 
                     :nivel-medo 20 
                     :agentes-enviados 5)
    
    (make-ocorrencia :nome "Kutulu" 
                     :ritual "Sacrificio" 
                     :nivel-medo 90 
                     :agentes-enviados 4)
    
    (make-ocorrencia :nome "Balrog" 
                     :ritual "Desconhecido" 
                     :nivel-medo 100 
                     :agentes-enviados 10)
    
    (make-ocorrencia :nome "Freira" 
                     :ritual "Exorcismo" 
                     :nivel-medo 80 
                     :agentes-enviados 2)))


(format t "~%Resultado da Analise Final:~%")
(format t "Ocorrencias Criticas: ~a~%" (analise-final *missoes*))
