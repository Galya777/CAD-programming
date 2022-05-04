(prompt "\nType TEST_DCL2 to run.....")
(defun dialogFunction (/ Dcl_Id%)
  (princ "\nMyFirst")(princ)
  ; Load Dialog
  (setq Dcl_Id% (load_dialog "C:/Users/hp/Desktop/26.07.2021/D/DSL/task5Dialog.dcl"))
  (if (not (new_dialog "InYan" Dcl_Id%))
   (exit ))
  ; Dialog Actions
  (if (not bigOne) (setq bigOne 100))
(if (not smallOne) (setq smallOne 50))
  
(set_tile "bigOne" (rtos  bigOne 2 2))
(set_tile "smallOne" (rtos  smallOne 2 2))
  
  (action_tile "bigOne" "(setq bigOne $value)")
  (action_tile "smallOne" "(setq smallOne $value)")
  (action_tile "accept" "(val1)")
  (start_dialog)
  ; Unload Dialog
  (unload_dialog Dcl_Id%)
  (princ)
);defun
-----------------------------------------------------
(defun val1 ()
(setq bigOne (atof (get_tile "bigOne"))
      smallOne (atof (get_tile "smallOne"))
      )
  (done_dialog)
;;;);if
);defun
-------------------------------
(defun c:InYanSymbol(/ a)
  (setq a (getpoint "\nEnter center point: "))
  (dialogFunction) 
(setq up (polar a (/ pi 2.0) (/ bigOne 2) ))
(setq down (polar a (/ pi 2.0) (-(/ bigOne 2))))
(setq up1 (polar a (/ pi 2.0) bigOne))
(setq down1 (polar a (/ pi 2.0) (- bigOne)))
(setq upa2 (polar up 0.0 (/ bigOne 2.0)))
(setq downa2 (polar down pi (/ bigOne 2.0)))
(command "circle" a bigOne"")
(command "circle" up smallOne"")
(command "circle" down smallOne"")
(command "arc" a upa2 up1 "")
(command "arc" a downa2 down1 "")

  )