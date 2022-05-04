(defun C:movec1 ()
(setq el (entget (car (entsel))))
(setq el (subst (list 10 2.0 2.0 0.0) (assoc 10 el) el))
(entmod el)
);end defun