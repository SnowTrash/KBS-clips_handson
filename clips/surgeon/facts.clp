; Personal que interviene
(deffacts medicos
  (medico (ID-medico "ID1") (rol "cirujano-principal")    (cirugias-hoy 0) (nombre "Andrea Villegas") (contaminado 0) (sleeped-hr 8) (mano-izq "no") (mano-der "no"))
  (medico (ID-medico "ID2") (rol "cirujano-auxiliar")     (cirugias-hoy 1) (nombre "Yolanda Galvan")  (contaminado 1) (sleeped-hr 7) (mano-izq "no") (mano-der "no"))
  (medico (ID-medico "ID3") (rol "anestesista-principal") (cirugias-hoy 1) (nombre "Ramiro Calle")    (contaminado 1) (sleeped-hr 7) (mano-izq "no") (mano-der "no"))
  (medico (ID-medico "ID4") (rol "enfermero-circulante")  (cirugias-hoy 2) (nombre "Jose Cruz")  (contaminado 1) (sleeped-hr 6)    (mano-izq "no") (mano-der "no"))
  (medico (ID-medico "ID5") (rol "enfermera-instrumentista") (cirugias-hoy 2) (nombre "Juan Lopez") (contaminado 1) (sleeped-hr 6) (mano-izq "no") (mano-der "no"))
)

; Instrumental médico
(deffacts orquesta
  ;nombre,composicion,forma,funcion,usos
  (instrumento (nombre "cuchillo") (composicion "torio")  (forma "un-cuerpo") (funcion "diéresis")  (usos "basico") (ocupado "no") ) 
  (instrumento (nombre "varilla") (composicion "titanio") (forma "un-cuerpo") (funcion "aprehensión") (usos "especializado") (ocupado "no") ) 
; Bisturí Bard-Parker No.3,4,7 - con cuchillas 10-15(7y3) y 20-23(4)
  (instrumento (nombre "bisturí-B-P-3") (composicion "titanio")   (forma "un-cuerpo") (funcion "diéresis-corte") (usos "basico") (ocupado "no") ) 
  (instrumento (nombre "bisturí-B-P-4") (composicion "vitalio")   (forma "un-cuerpo") (funcion "diéresis-corte") (usos "basico") (ocupado "no") ) 
  (instrumento (nombre "bisturí-B-P-7") (composicion "vibranium") (forma "un-cuerpo") (funcion "diéresis-corte") (usos "basico") (ocupado "no") ) 
; Tijeras ([2]- p.p.64) 
  (instrumento (nombre "tijeras") (composicion "titanio") (forma "articulado") (funcion "diéresis-corte") (usos "basico") (ocupado "no") )
  (instrumento (nombre "tijeras") (composicion "acero-inoxidable") (forma "articulado") (funcion "separacion") (usos "basico") (ocupado "no") )
)

; Pacientes
( deffacts pacientes
;(paciente (slot ID-paciente) (slot cirugias-hoy) (multislot nombre) (slot pulso) (slot peso) (slot altura) (slot IMC))
  (paciente (ID-paciente "0001") (cirugias-hoy 0) (nombre "javier milei") (pulso 90) (peso 95) (altura 169) (IMC 23.4) )
  (paciente (ID-paciente "0002") (cirugias-hoy 0) (nombre "charles xavier") (pulso 84) (peso 95) (altura 169) (IMC 23.4) )
  (paciente (ID-paciente "0003") (cirugias-hoy 2) (nombre "bashir folman") (pulso 120) (peso 80) (altura 180) (IMC 22.1) )
  (paciente (ID-paciente "0004") (cirugias-hoy 5) (nombre "hisashi ouchi") (pulso 74) (peso 85) (altura 175) (IMC 23.1) )
)

; Cirugías
(deffacts recipes
;(cirugia (multislot ID-cirugia)(multislot nombre/procedimiento)(slot post-op-days)(slot area)(slot horas-aprox) (slot tipo))
  (cirugia (ID-cirugia "666")(nombre-procedimiento "Apendicectomia")(post-op-days 14)(area "V")(horas-aprox 4) (tipo "mayor ambulatoria"))
  (cirugia (ID-cirugia "777")(nombre-procedimiento "Reducción abierta de fractura con fijación interna , femur")(post-op-days 60)(area "L")(horas-aprox 10) (tipo "mayor"))
  (cirugia (ID-cirugia "778")(nombre-procedimiento "Reducción abierta de fractura con fijación interna, húmero")(post-op-days 50)(area "A")(horas-aprox 12) (tipo "mayor ambulatoria"))
)

; Intervenciones
(deffacts kissinger

  (intervencion (ID-intervencion "IN-01")(ID-cirugia "666")(ID-paciente "0001")(ID-cirujano-principal "ID1")(ID-cirujano-auxiliar "ID2")(ID-enfermero-circulante "ID4")(ID-enfermera-instrumentista "ID5")(ID-anestesista "ID3")(abordaje "sin-definir") (estado-actual "genesis"))
  
  (intervencion (ID-intervencion "IN-02")(ID-cirugia "777")(ID-paciente "0003")(ID-cirujano-principal "ID1")(ID-cirujano-auxiliar "ID2")(ID-enfermero-circulante "ID4")(ID-enfermera-instrumentista "ID5")(ID-anestesista "ID3")(abordaje "sin-definir")(estado-actual "genesis"))
  (intervencion (ID-intervencion "IN-03")(ID-cirugia "778")(ID-paciente "0003")(ID-cirujano-principal "ID1")(ID-cirujano-auxiliar "ID2")(ID-enfermero-circulante "ID4")(ID-enfermera-instrumentista "ID5")(ID-anestesista "ID3")(abordaje "sin-definir")(estado-actual "genesis"))
  
)