; Personas que intervienen
(deftemplate medico
  (multislot ID-medico)
  (multislot rol)
  (slot cirugias-hoy)
  (multislot nombre)
  (slot contaminado)
  (slot sleeped-hr)
  (multislot mano-izq)
  (multislot mano-der)
)

; Instrumentos
(deftemplate instrumento
  (multislot nombre)
  (multislot composicion)
  (multislot forma)
  (multislot funcion)
  (multislot usos)
  (multislot ocupado)
)

; paciente
(deftemplate paciente
  (slot ID-paciente)
  (slot cirugias-hoy)
  (multislot nombre)
  (slot pulso)
  (slot peso)
  (slot altura)
  (slot IMC)
)

;cirugia
(deftemplate cirugia
  (multislot ID-cirugia)
  (multislot nombre-procedimiento)
  (slot post-op-days)
  (slot area)
  (slot horas-aprox)
  (multislot tipo)
  ; mayor,menor,ambulatoria.

)

; cirugia-paciente-cirujano
(deftemplate intervencion
  (multislot ID-intervencion)
  (multislot ID-cirugia)
  (multislot ID-paciente)
  (multislot ID-cirujano-principal)
  (multislot ID-cirujano-auxiliar)
  (multislot ID-enfermero-circulante)
  (multislot ID-enfermera-instrumentista)
  (multislot ID-anestesista)
  (multislot abordaje)
  (slot estado-actual)
)

; Acciones para gestionar la interacción
(deftemplate acciones
  (multislot ID-intervencion)
  (multislot ID-agente-A)
  (multislot ID-agente-B)
  (slot numero-accion)
  (multislot descripcion)
)



; (deftemplate student
;     (slot name (type SYMBOL) (default ?NONE))
;     (slot grade (type SYMBOL) (default C) (allowed-symbols A B C D))
;     (slot graduated (type SYMBOL) (default no) (allowed-symbols yes no)))
; CLIPS> 
; (deffacts insert-facts
;     (student (name George) (grade A))
;     (student (name Nick) (grade C))
;     (student (name Bob))
;     (student (name Mary) (grade B)))
; CLIPS> 
; (defrule rule-1
;    ?s <- (student (grade A|B) (name ?n) (graduated ~yes))
;    =>
;    (modify ?s (graduated yes))
;    (printout t "Congratulations " ?n "!" crlf))
; CLIPS> (reset)
; CLIPS> (run)
; Congratulations Mary!
; Congratulations George!