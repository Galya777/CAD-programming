(defun c:MyFirst (/ Dcl_Id%)
  (princ "\nMyFirst")(princ)
  ; Load Dialog
  (setq Dcl_Id% (load_dialog "C:/Users/hp/Desktop/26.07.2021/D/DSL/dialog2.dcl"))
  (new_dialog "MyFirst" Dcl_Id%)
  ; Dialog Actions
  (start_dialog)
  ; Unload Dialog
  (unload_dialog Dcl_Id%)
  (princ)
);defun c:MyFirst