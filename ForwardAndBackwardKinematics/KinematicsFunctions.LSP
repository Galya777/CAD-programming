(defun c:Kinematics (/ Dcl_Id% Radio2$ Return# )
  (setq Dcl_Id% (load_dialog "C:/Users/hp/Desktop/26.07.2021/D/DSL/choose.dcl"))
  (new_dialog "Choose" Dcl_Id%)

  (start_dialog)
(unload_dialog dcl_id%)
  (princ)
);defun c:Kinematics

  (if (= Radio1$ nil) (setq Radio1$ "B") )
  (if (= a1 nil) (setq a1 "100"))
  (if (= a2 nil) (setq a2 "85"))

  (setq Dcl_Id% (load_dialog "C:/Users/hp/Desktop/26.07.2021/D/DSL/Kinematics.dcl"))
  (new_dialog "Kinematics" Dcl_Id%)
  ; Set Dialog Initial Settings
  (set_tile "Title" " Forward Kinematics")
  (set_tile "Radio1" Radio1$)

  (setq x (dimx_tile "Slide1") y (dimy_tile "Slide1"))
  (start_image "Slide1")
  
    (slide_image 0 -4 x y "C:/Users/hp/Desktop/26.07.2021/D/DSL/field.sld")

  (end_image)

  (set_tile "a1" a1)
  (set_tile "a2" a2)
  
  ; Dialog Actions
  (action_tile "Radio1" "(setq Radio1$ $value)")
  (action_tile "accept" "(get_r)")

  (action_tile "Backward" "(backwards)")
  
(start_dialog)
(unload_dialog dcl_id%)
  (princ)
);defun c:Kinematics




 Function to get value
(defun get_r ( / r1)
(setq r1 (get_tile "Radio1")
	a1 (get_tile "a1")
	a2 (get_tile "a2")
	la1 (atof a1)
      	la2 (atof a2)
      )



  
(done_dialog) ;;; Mnogo vagno 
  (setq Radio1$ r1)
  (print la1) (print la2)
 )


(defun backwards ( / pt1 pt1r pt2 a1 a2 pinv)
(setq a1 120.0 ;Дължина на първото звено
      a2 100.0 ;Дължина на второто звено
;;;      pinv (list 110.0 85.0 0.0)
      pinv (getpoint "\n Input point:") ;точка
      );end setq
    (animate "L") (animate "R")	;Изтрива слой с име
  (make-c (list 0.0 0.0) (+ a1 a2) 5 "L") (make-c (list 0.0 0.0) (- (max a1 a2) (min a1 a2)) 5 "L") ; чертае окръжности
		  (rr a1 a2 pinv) ;Тук се извиква функцията за решаване на ОЗК
  (setq pt1 (polar (list 0.0 0.0) titaa1 a1)
	pt2 (polar pt1 (+ titaa2 titaa1) a2)
	pt1r (polar (list 0.0 0.0) titaa1R a1)
	);end setq
(line1 (list 0.0 0.0) pt1 "L" 3 ) (line1 (list 0.0 0.0) pt1r "R" 2 ) (line1 pt1 pt2 "L" 3 ) (line1 pt1r pt2 "R" 2 ); Чертае линии
  );end defun

(defun rr (a1 a2 pinv / ll t1 tt1 ttt1 tt1i tt1i1 po p1 pend)
  (setq po (list 0.0 0.0 0.0) ll (distance po pinv) flag 1)
  (if (and (> (+ a1 a2) ll) (< (- (max a1 a2) (min a1 a2)) ll))
    (progn
      (setq flag  1 ttt1  (angle po pinv) tt1i  (cosc a1 ll a2) tt1i1 (tfromc tt1i) tt1 (atan tt1i1))
      (if (< tt1i 0.0) (setq tt1 (- pi tt1)))
      (setq t1  (+ ttt1 tt1)
	    titaa1 t1		;Резултат тита1 лява ръка
	    titaa2_1 (cosc a1 a2 ll)
	    titaa2_2 (tfromc titaa2_1) titaa2   (atan titaa2_2)	;Резултат тита2
	    p1 (polar po t1 a1)		;Междинна точка лява ръка
	    t1  (- ttt1 tt1)
	    titaa1R (- ttt1 tt1)	;изчислява тита1 за дясна ръка
	    pend (polar p1 (+ titaa1 titaa2) a2)	;Изчислява крайната точка (хващача) с ПЗК
	    );end setq
(if (> (distance pend pinv) 0.5) (setq titaa2 (+ titaa2 pi))) ; Проверява дали е вярно изчислен хващача с ПЗК (съвпадат ли точките с точност до 0.5мм) с тези ъгли
    (if (> titaa1 (* 2 pi)) (setq titaa1 (- titaa1 (* 2 pi))))
    (if (< titaa1R 0.0) (setq titaa1R (+ (* 2 pi) titaa1R)))
(if (< titaa2 (/ pi 2.0)) (setq titaa2 (+ titaa2 (* 2.0 pi))))
(if (> titaa2R 0.0) (setq titaa2R (- titaa2R (* 2.0 pi))))
(if (> titaa1 pi) (setq titaa1 (- titaa1 (* 2 pi))))
(if (> titaa1R pi) (setq titaa1R (- titaa1R (* 2 pi))))
(if (> titaa2 pi) (setq titaa2 (- titaa2 (* 2 pi))))
       (setq titaa2R (- titaa2))
    )		;end progn
    (setq flag 0)	; Флаг дали има решение?
  )		;end if
)		;end defun
