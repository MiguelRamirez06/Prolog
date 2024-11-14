(defun verificar-mayoria-edad ()
  (printc "Ingrea es tu edad? ")
  (let ((edad (read)))
    (if (>= edad 18)
        (format t "Eres mayor de edad.~%")
        (format t "Eres menor de edad.~%"))
    (when (< edad 0)
      (format t "Edad no valida.~%"))))