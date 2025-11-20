(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defparameter *catalogo*
  (list
    
    (make-criatura :nome "Peeper" 
                   :ambiente "Safe Shallows" 
                   :periculosidade "Baixa" 
                   :vida-media 2)
    
    
    (make-criatura :nome "Reaper Leviathan" 
                   :ambiente "Crash Zone" 
                   :periculosidade "Alta" 
                   :vida-media 100)
    
  
    (make-criatura :nome "Ghost Leviathan" 
                   :ambiente "Deep" 
                   :periculosidade "Alta" 
                   :vida-media 200)
    
    (make-criatura :nome "Crab Squid" 
                   :ambiente "Deep" 
                   :periculosidade "Media" 
                   :vida-media 30)))


(defun filtra-por-perigo (lista-catalogo)
  (remove-if-not 
    (lambda (c) 
      
      (not (string-equal (criatura-periculosidade c) "Baixa")))
    lista-catalogo))


(defun relatorio-profundidade (lista-catalogo)
  
  (let ((apenas-deep 
          (remove-if-not 
            (lambda (c) (string-equal (criatura-ambiente c) "Deep")) 
            lista-catalogo)))
    
    (mapcar 
      (lambda (c) 
        (format nil "[~a]: Vive em [~a]" (criatura-nome c) (criatura-ambiente c)))
      apenas-deep)))


(format t "~% => Filtro de Perigo~%")

(let ((perigosos (filtra-por-perigo *catalogo*)))
  (dolist (p perigosos)
    (format t "Nome: ~a | Perigo: ~a~%" 
            (criatura-nome p) 
            (criatura-periculosidade p))))

(format t "~% => Relatorio de Profundidade~%")

(dolist (linha (relatorio-profundidade *catalogo*))
  (format t "~a~%" linha))
