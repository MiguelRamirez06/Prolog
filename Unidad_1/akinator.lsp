;; Definición de equipos de fútbol y sus características
(defparameter *equipos* '(
    (Real-Madrid (
        (pais España)
        (fundacion 1902)
        (estadio "Santiago Bernabéu")
        (titulos 35)
    ))
    (Barcelona (
        (pais España)
        (fundacion 1899)
        (estadio "Camp Nou")
        (titulos 27)
    ))
    (Manchester-United (
        (pais Inglaterra)
        (fundacion 1878)
        (estadio "Old Trafford")
        (titulos 20)
    ))
    (Bayern-Munich (
        (pais Alemania)
        (fundacion 1900)
        (estadio "Allianz Arena")
        (titulos 32)
    ))
    (Juventus (
        (pais Italia)
        (fundacion 1897)
        (estadio "Allianz Stadium")
        (titulos 36)
    ))
))

;; Función para recorrer la lista de equipos
(defun recorrer-equipos (lista)
  (when lista
    (let ((equipo (car lista)))
      (format t "El equipo ~a tiene las siguientes características:~%" (car equipo))
      (dolist (caracteristica (cadr equipo))
        (format t " - ~a: ~a~%" (car caracteristica) (cadr caracteristica)))
      (format t "~%")
      (recorrer-equipos (cdr lista)))))

;; Ejecutar la función
(recorrer-equipos *equipos*)
