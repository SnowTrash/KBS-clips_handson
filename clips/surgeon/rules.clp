; si - paciente_ingresado => Prepararlo para la cirugia
(defrule preparar-paciente
  (paciente (ID-paciente ?idpa) (pulso ?pu&:(> ?pu 85)) (nombre ?name))
  =>
  (printout t  ?idpa ?name " es un paciente con pulsaciones > 85 , estable para cirugia " crlf)
)

; se toman las intervenciones definidas en facts, probaremos con una sola
(defrule generar-intervencion
  (intervencion (ID-intervencion ?idi) (ID-paciente ?idp) (ID-cirugia ?idc) (abordaje ?lines)(estado-actual ?st) )
  (paciente (ID-paciente ?idp) (nombre ?name))
  (cirugia (ID-cirugia ?idc) (nombre-procedimiento ?np))
  (test (eq "genesis" ?st))
  =>
  (assert (acciones (ID-intervencion ?idi) (ID-agente-A "Paciente") (ID-agente-B "Hospital") (numero-accion 0) (descripcion "Se asignaran medicos a :" ?name " -> para su proxima " ?np crlf) ))
  (printout t " iniciando proceso... " ?st  crlf)
)

; lavarlos a todos
(defrule lavarlos-all
  (acciones (ID-intervencion ?idi) (numero-accion ?an&:(eq ?an 0)))
  (intervencion (ID-intervencion ?idi)(ID-cirugia ?idc)(ID-paciente ?idp)(ID-cirujano-principal ?idcp)(ID-cirujano-auxiliar ?idcx)(ID-enfermero-circulante ?idenc)(ID-enfermera-instrumentista ?ideni)(ID-anestesista ?idan)(abordaje ?abord) (estado-actual ?st))
  =>
  (assert (acciones (ID-intervencion ?idi) (ID-agente-A "Medicos") (ID-agente-B "Paciente") (numero-accion (+ ?an 1)) (descripcion "accion +1 realizada?? lavandolos") ))
)
; tunel de viento
; ingresar al quirofano.


; Anestesiarlo segun el área previamente acordada
    ;(TODO para reglas mas especificas leer los manuales y agregarlas)
(defrule anestesiar-mayor
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "mayor" ?ty))
  =>
  (printout t " a dormir como caballo trastabillado -> " ?ar  crlf)
)

(defrule anestesiar-mayor-ambulatoria
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "mayor ambulatoria" ?ty))
  =>
  (printout t " una cobacha leve -> " ?ar  crlf)
)

(defrule anestesiar-menor
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "menor" ?ty))
  =>
  (printout t " dormidillo y anestesia local -> " ?ar  crlf)
)

(defrule anestesiar-menor-ambulatoria
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "menor ambulatoria" ?ty))
  =>
  (printout t " Friega con hielo en ---> " ?ar  crlf)
)


; En el caso de la fractura de femur mediante el primer abordaje.
; la extremidad inferior izquierda de un paciente antes de la reducción abierta y
; fijación interna de una fractura de la meseta tibial. La extremidad inferior se ha colocado sobre un paño estéril y se ha
; dibujado una incisión anterolateral centrada en el tubérculo
; de Gerdy. También se ha dibujado el tendón rotuliano, la
; tuberosidad anterior de la tibia y la cabeza del peroné. Se
; ha colocado un triángulo radiotransparente bajo la rodilla
; para facilitar el acceso a la fractura y relajar los ligamentos
; laterales externo e interno

(defrule marcar-area-L
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "L" ?ar))
  =>
  (printout t " Se marca la pata con forma de S, homie  -> (Leg) = " ?ar  crlf)
)

(defrule marcar-area-V
  (cirugia (horas-aprox ?hrs) (area ?ar) (tipo ?ty))
  (test (eq "V" ?ar))
  =>
  (printout t " Se marca acceso a ciertos organos  -> (Vientre) = " ?ar  crlf)
)

; Incisiones
; Arreglada (acomodar los huesos parejones)
; Sutura

; Haremos una descripcion mas simple para las otras 9






; NO - paciente_NEGADO => estabilizarlo y reprogramar la cirugia
(defrule devolver-paciente
  (paciente (ID-paciente ?idpa) (pulso ?pu&:(< ?pu 85)) (nombre ?name) )
  =>
  (printout t  ?idpa ?name " pacientes con pulso menor a 85 , cancelar la cirugia "  crlf)
)