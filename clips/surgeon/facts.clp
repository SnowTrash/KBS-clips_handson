; Personas que intervienen
(deffacts medicos

(medico (multislot rol) (slot cirugias-hoy) (multislot nombre) (slot ID) (slot contaminado) (slot sleeped_hr) (slot mano_izq) (slot mano_der))
(medico (multislot rol) (slot cirugias-hoy) (multislot nombre) (slot ID) (slot contaminado) (slot sleeped_hr) (slot mano_izq) (slot mano_der))
(medico (multislot rol) (slot cirugias-hoy) (multislot nombre) (slot ID) (slot contaminado) (slot sleeped_hr) (slot mano_izq) (slot mano_der))
(medico (multislot rol) (slot cirugias-hoy) (multislot nombre) (slot ID) (slot contaminado) (slot sleeped_hr) (slot mano_izq) (slot mano_der))

)

; Instrumental médico
(deffacts orquesta

(instrumento (multislot customer-name) (multislot forma) (multislot usos) (slot ocupado) (slot mano)) 

)

; Pacientes
( deffacts komander
(paciente (slot ID-paciente) (slot cirugias-hoy) (multislot nombre) (slot pulso) (slot peso) (slot altura) (slot IMC) (slot ID-cirugia))
)

; Cirugias
(deffacts sirugias

( cirugia
  (multislot ID-cirugia)
  (multislot nombre/procedimiento)
  (slot post-op-days)
  (slot area)
  (slot horas-aprox) 
  (slot tipo)
  )
  
)

;; Cirugia-paciente-ciruajno
(intervencion
  (multislot ID)
  (multislot abordaje)
  (slot estado-actual)
)
