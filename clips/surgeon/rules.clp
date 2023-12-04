; si - paciente_ingresado => Prepararlo para la cirugia
(defrule sales-in-holiday
  (order (customer-id ?id) (purchase-date ?born))
  (holiday (name ?god) (dia-santo ?dia))
  (test (eq ?dia ?born))
  =>
  (printout t  ?id " celebrando "?god  crlf)
)

; Hacer los preparativos de los medicos tambien

; ingresar al quirofano.

; Anestesiarlo segun el área previamente acordada
    ;(TODO para reglas mas especificas leer los manuales y agregarlas)

; En el caso de la fractura de femur mediante el primer abordaje.

la extremidad inferior izquierda de un paciente antes de la reducción abierta y
fijación interna de una fractura de la meseta tibial. La extremidad inferior se ha colocado sobre un paño estéril y se ha
dibujado una incisión anterolateral centrada en el tubérculo
de Gerdy. También se ha dibujado el tendón rotuliano, la
tuberosidad anterior de la tibia y la cabeza del peroné. Se
ha colocado un triángulo radiotransparente bajo la rodilla
para facilitar el acceso a la fractura y relajar los ligamentos
laterales externo e interno

; Incisiones
; Arreglada (acomodar los huesos parejones)
; Sutura


; Haremos una descripcion mas simple para las otras 9