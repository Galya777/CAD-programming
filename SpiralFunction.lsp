(defun C:SPIRAL ( / nt bp cf lp)

        (initget 1)                     ; bp must not be null

        (setq bp (getpoint "\nCenter point: "))

        (initget 7)                     ; nt must not be zero, neg, or null

        (setq nt (getint "\nNumber of rotations: "))

        (initget 3)                     ; cf must not be zero, or null

        (setq cf (getdist "\nGrowth per rotation: "))

        (initget 6)                     ; lp must not be zero or neg

        (setq lp (getint "\nPoints per rotation <30>: "))

        (cond ((null lp) (setq lp 30)))

        (cspiral nt bp cf lp)

);end of defun

 (defun cspiral (ntimes bpoint cfac lppass / ang dist tp ainc dinc circle bs cs oldsnap)

  (getsystvar)

(setq    circle (* pi 2) ainc (/ circle lppass)  dinc (/ cfac lppass)  ang 0.0  dist 0.0)

  (turnofsyst)

        (command "pline" bpoint)        ; start spiral from base point and...

        (repeat ntimes

           (repeat lppass

              (setq tp (polar bpoint (setq ang (+ ang ainc))

                          (setq dist (+ dist dinc))))

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