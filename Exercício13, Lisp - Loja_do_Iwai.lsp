(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defparameter *catalogo-iwai*
  (list
    
    (make-item :nome "Katana do herdeiro do dragao" 
               :tipo "Arma" 
               :preco 1000 
               :forca-magica 90)
    
    
    (make-item :nome "Adaga de sangue" 
               :tipo "Arma" 
               :preco 100 
               :forca-magica 40)
    
    
    (make-item :nome "Elixir das almas" 
               :tipo "Pocao" 
               :preco 50 
               :forca-magica 10)
    
    
    (make-item :nome "Joia da Alma" 
               :tipo "Artefato" 
               :preco 5000 
               :forca-magica 200)))


(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)

  (let ((apenas-armas 
          (remove-if-not 
            (lambda (i) (string-equal (item-tipo i) "Arma")) 
            catalogo)))
    
    (mapcar 
      (lambda (arma)
      
        (let ((novo-preco (adiciona-imposto (item-preco arma)))
              (nova-forca (bonus-maldicao (item-forca-magica arma))))
          
          
          (format nil "Arma: ~a | Novo Preco: ~f | Forca Final: ~f" 
                  (item-nome arma) 
                  novo-preco 
                  nova-forca)))
      apenas-armas)))

(format t "Relatorio de Vendas:~%")

(dolist (linha (processa-venda *catalogo-iwai*))
  (format t "~a~%" linha))
