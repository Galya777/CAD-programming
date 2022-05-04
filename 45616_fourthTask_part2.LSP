(defun C:modArc ()
(setq el (entget (car (entsel))))
(setq el (subst (cons 51 pi) (assoc 51 el) el))
(entmod el)
);end defun