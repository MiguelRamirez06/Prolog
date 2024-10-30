; Código fibonacci recursivo en LISP
; La función fibonacci recibe un número entero n y devuelve el n-ésimo número de la serie de Fibonacci
; Ejemplo de uso: (fibonacci 7) => 13

(defun fibonacci (n)
  (if (<= n 1)
      n
      (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))