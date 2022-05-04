(prompt "\nType TEST_DCL2 to run.....")
(defun c:InYanSymbol (/ Dcl_Id%)
  (princ "\nMyFirst")(princ)
  ; Load Dialog
  (setq Dcl_Id% (load_dialog "C:/Users/hp/Desktop/26.07.2021/D/DSL/task5Dialog.dcl"))
  (if (not (new_dialog "InYan" Dcl_Id%))
   (exit ))
  ; Dialog Actions
  (set_tile "bigOne" "65")
  (set_tile "smallOne" "20")
  (action_tile "bigOne" "(setq bigOne $value)")
  (action_tile "smallOne" "(setq smallOne $value)")
  (action_tile "accept" "(val1)")
  (start_dialog)
  ; Unload Dialog
  (unload_dialog Dcl_Id%)
  (princ)
);defun
;InYan( bigOne smallOne)
-----------------------------------------------------
(defun val1 ()
  (setq bigOne (get_tile "bigOne"))
;;;(if (=  "Enter Name Here")
;;;(progn
;;;(set_tile "error" "You must enter a name!")
;;;(mode_tile "name" 2)
;;;);progn
;;;;(val2)
  (done_dialog)
;;;);if
);defun
