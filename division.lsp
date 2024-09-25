; Código división recursiva en LISP

(defun division (n1 n2)
  (cond
    ((< n1 n2) 0)
    (t (+ 1 (division (- n1 n2) n2)))))
