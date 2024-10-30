(defparameter *nodes* '(
    (Juan (
        (altura 1.75)
        (color-de-piel blanco)
        (personalidad serio)
        (hobby fútbol)
    ))
    (Brayan (
        (altura 1.65)
        (color-de-piel moreno)
        (personalidad extrovertido)
        (hobby videojuegos)
    ))
    (Carlos (
        (altura 1.80)
        (color-de-piel europeo)
        (personalidad tranquilo)
        (hobby cotorrear)
    ))
    (Aide (
        (altura 1.65)
        (color-de-piel moreno)
        (personalidad alegre)
        (hobby sepa)
    ))
))

(defun recorre (lista)
    (when lista
        (let ((elemento (car lista)))
            (format t "Tu personaje es -a?-%" (car elemento))
            (recorre (cdr lista))
        )
    )
)OpenPyXL es una librería que permite leer y escribir archivos Excel (XLSX) en Python.