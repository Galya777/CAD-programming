;;; TESTDCL.LSP .... by M.P.Saju.
;;; This is a freeware. License for use of this application is granted for
;;; distribution, provided it is not mutilated. If there are problems please
;;; feel free to contact the author at mpsaju@yahoo.com
;;;
;;; Testing *.DCL files becomes a necessity when developing a good sized lisp
;;; application for easy input and understanding. This routine in lisp was
;;; written for just such a necessity.
;;;
;;; Usage is very simple... Just type "Testdcl" in Autocad text screen and press
;;; "enter". A file selection dialog box will open up to select the DCL file.
;;; On entering, the DCL under test will open. This application works under
;;; the assumption that there is an active "accept" or "cancel" button.
;;;
;;; I have tried to solve all problems that I have encountered. However if there
;;; are any further issues please feel free to contact me.


(defun c:testdcl (/ nam$ nam id loop)
;;; lisp for checking dialogboxes at the beginning of their design
   (setq nam$ (getfiled "Select a DCL file" "" "dcl" 0)) 
;;;  (setq nam$ (getfiled "Select a DCL file" "C:/INCH4/" "dcl" 0))
  (setq nam (identify nam$))
)
(defun identify	(nam$ / file x dd dd$)
  (setq	file (open nam$ "r")
	dd$  nil
	dd   nil
	x    0
  )
  (while (setq dd (read-line file))
    (if	(wcmatch dd "*: dialog {")
      (progn
	(setq dd$ (substr dd 1 (- (strlen dd) 11)))
	(if (wcmatch dd$ " *")
	  (setq dd$ (substr dd$ 2 (strlen dd$)))
	  ;; added for eliminating blank
	)
	(rundcl nam$ dd$)
      )


    )

  )
  (close file)
  dd$
)
(defun rundcl (nam$ nam)
  (setq id (load_dialog nam$))
  (if (not (new_dialog nam id))
    (exit)
  )
  (action_tile "cancel" "(done_dialog 0)")
;;; cancel button dialog.. normally in all DCLs
  (action_tile "accept" "(done_dialog 0)")
;;; accept button dialog.. normally in all DCLs
  (setq loop (start_dialog))
)  

