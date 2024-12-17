;; Definición de dispositivos electrónicos

(defparameter *nodes* '(
    (telefono (
        (samsung (s24))
        (cubot (x70))
        (huawei (p30))
        (xiaomi (redmi-note-8))
    ))
    (computadora (
        (asus (rog-strix-g15))
        (acer (aspire-5))
        (hp (pavilion-gaming))
        (lenovo (ideapad-3))
    ))
    (smartwatch (
        (apple (watch-series-6))
        (samsung (galaxy-watch-3))
        (huawei (watch-fit))
        (xiaomi (mi-band-5))
    ))
    (tablet (
        (apple (ipad-pro))
        (samsung (galaxy-tab-s7))
        (huawei (matepad-pro))
        (xiaomi (mi-pad-5))
    ))
    (consola (
        (sony (playstation-5))
        (microsoft (xbox-series-x))
        (nintendo (switch))
    ))
))

;; Función para recorrer y mostrar los dispositivos y modelos
(defun recorrer-dispositivos (lista)
  (when lista
    (let* ((categoria (car lista))        ;; Extraer la categoría (telefono, computadora, etc.)
           (elementos (cadr lista)))      ;; Extraer los elementos de la categoría
      (format t "~%Categoría: ~a~%" categoria)
      (dolist (dispositivo elementos)    ;; Recorrer los dispositivos de la categoría
        (format t " - Marca: ~a, Modelo: ~a~%"
                (car dispositivo)        ;; Nombre de la marca
                (cadr dispositivo)))     ;; Modelo del dispositivo
      (recorrer-dispositivos (cdr lista))))) ;; Llamada recursiva para el resto de la lista

;; Ejecutar la función
(recorrer-dispositivos *nodes*)