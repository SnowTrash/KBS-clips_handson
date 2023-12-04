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
  (multislot mano)
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
  (slot ID-cirugia)
)

;cirugia
(deftemplate cirugia
  (multislot ID-cirugia)
  (multislot nombre-procedimiento)
  (slot post-op-days)
  (slot area)
  (slot horas-aprox)
  (multislot tipo)
  ; permimtidas a,b,c ([a1,a2,a3],b1...)

)

; cirugia-paciente-cirujano
(deftemplate intervencion
  (multislot ID)
  (multislot abordaje)
  (slot estado-actual)
)
