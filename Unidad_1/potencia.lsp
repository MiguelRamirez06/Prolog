; Código de la función potencia en LISP con sumas recursivas

(defun multiplicacion (a b)
  (if (= b 0)
      0
      (+ a (multiplicacion a (- b 1)))))

(defun potencia (base exponente)
  (if (= exponente 0)
      1
      (multiplicacion base (potencia base (- exponente 1)))))