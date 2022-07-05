(defun C:EPYCYLOID ( / nt bp r1 r2 lp)

        (initget 1)                     ; bp must not be null

        (setq bp (getpoint "\nCenter point: "))

        (initget 7)                     ; nt must not be zero, neg, or null

        (setq nt (getint "\nNumber of rotations: "))

        (initget 3)                    

        (setq r1 (getdist "\nBig radius: "))

        (initget 6)
  
        (setq r2 (getdist "\nSmall radius: "))

        (initget 6)   

        (setq lp (getint "\nPoints per rotation <30>: "))

        (cond ((null lp) (setq lp 30)))

        (cspiral nt bp (r1 + r2) lp)

);end of defun

 (defun cspiral (ntimes bpoint cfac lppass / ang dist tp ainc dinc circle bs cs oldsnap)

  (getsystvar)

(setq circle (* pi 2) ainc (/ circle lppass)  dinc (/ (r1 + r2) lppass)  ang 0.0  dist 0.0)

  (turnofsyst)

        (command "pline" bpoint)        

        (repeat ntimes

           (repeat lppass			   
             (setq px (- (* (+ r1 r2) (cos tit)) (* r2 (cos tit) )) )
             (setq py (- (* (+ r1 r2) (sin tit)) (* r2 (sin tit) )) )
	     (setq ang (+ ang ainc))
              (setq tp (list (+ (car bpoint) px) (+ (cadr bpoint) py)))
              (command tp)              ; continue to the next point...

           )

        )

        (command)                       ; until done.

  (setsystvar)

);end defun cspiral
(defun getsystvar ()

  (setq  cs         (getvar "cmdecho")    ; save old cmdecho

            oldsnap           (getvar "osmode")

  )

 )                                                          ;end of defun

                                                           ; turn off systems

(defun turnofsyst ()

  (setvar "cmdecho" 0)                                   ; turn cmdecho off

  (setvar "osmode" 0)

 )                                                          ;end of defun

(defun setsystvar ()

(setvar "osmode" oldsnap)

(setvar "cmdecho" cs)
  )