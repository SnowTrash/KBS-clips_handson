; Personas que intervienen
(deftemplate medico
  (multislot rol)
  (slot cirugias-hoy)
  (multislot nombre)
  (slot ID-medico)
  (slot contaminado)
  (slot sleeped_hr)
  (slot mano_izq)
  (slot mano_der)
)

; Instrumentos
(deftemplate instrumento
  (multislot customer-name)
  (multislot forma)
  (multislot usos)
  (slot ocupado)
  (slot mano)
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
  (multislot nombre/procedimiento)
  (slot post-op-days)
  (slot area)
  (slot horas-aprox)
  (slot tipo)
  ; permimtidas a,b,c ([a1,a2,a3],b1...)

)

; cirugia-paciente-cirujano
(deftemplate intervencion
  (multislot ID)
  (multislot abordaje)
  (slot estado-actual)
)
