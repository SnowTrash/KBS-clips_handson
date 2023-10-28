                           ;; Definimos las plantillas;
;cliente
(deftemplate customer
  (slot customer-id)
  (multislot name)
  (multislot address)
  (slot phone)
  (slot register-date)
)

;membresia
(deftemplate membership
  (slot customer-id)
  (multislot name)
  (slot level)
  (slot points)
  (slot cp-typo)
  (slot cupon-buy)
  (slot refered-by)
  (slot invited)
)

;producto
(deftemplate product
  (slot part-number)
  (slot name)
  (slot category)
  (slot price)
)

;Orden/Ticket
(deftemplate order
  (slot order-number)
  (slot customer-id)
  (slot purchase-date)
  (slot total)
  (slot discount)
)

;Producto/fila(una orden tiene muchas filas)
(deftemplate line-item
  (slot order-number)
  (slot part-number)
  (slot customer-id)
  (slot quantity (default 1))
)



;; Conductores para pruebas de fecha 
(deftemplate driver
   (slot name)
   (slot dateBorn))

;; Aqui se definira la plantilla de codigo postal
;; Se espera generar una regla
(deftemplate postal-code
   (slot code)
   (slot group))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;; Aqui comienzan las plantillas de las reglas creadas
             ;; mensaje para ofrecer descuento 
(deftemplate discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
  (slot purchase-date)
)

; Recompensa loyalty 
(deftemplate loyalty-reward
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

; Oferta de cumpleaños
(deftemplate birthday-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

; 5 .- Descuento por departamento 
(deftemplate category-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

; 7 ?? 
(deftemplate total-purchase-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)

;; Promocion
(deftemplate referral-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
  (slot level)
  (slot n-recomendados)
)





;; FUNCIONES PARA FECHAS
;; Definimos funciones que nos ayudan a manipular fechas
(deffunction current-date ()
   (bind ?lt (local-time))
   (format nil "%04d-%02d-%02d" (nth$ 1 ?lt) (nth$ 2 ?lt) (nth$ 3 ?lt)))

(deffunction is-leap-year (?year)
   (if (= (mod ?year 400) 0) then (return TRUE))
   (if (= (mod ?year 100) 0) then (return FALSE))
   (if (= (mod ?year 4) 0) then (return TRUE))
   (return FALSE))


(deffunction days-from-year-begin (?date)
   (bind ?year (string-to-field (sub-string 1 4 ?date)))
   (bind ?month (string-to-field (sub-string 6 7 ?date)))
   (bind ?day (string-to-field (sub-string 9 10 ?date)))
   (if (is-leap-year ?year)
      then
      (return (+ (nth$ ?month ?*days-before-month-leap-year*) ?day))
      else
      (return (+ (nth$ ?month ?*days-before-month*) ?day))))

(deffunction days-until-year-end (?date)
   (bind ?year (string-to-field (sub-string 1 4 ?date)))
   (bind ?month (string-to-field (sub-string 6 7 ?date)))
   (bind ?day (string-to-field (sub-string 9 10 ?date)))
   (if (is-leap-year ?year)
      then
      (return (- 366 (+ (nth$ ?month ?*days-before-month-leap-year*) ?day)))
      else
      (return (- 365 (+ (nth$ ?month ?*days-before-month*) ?day)))))

(deffunction date-days-diff (?date1 ?date2)
   (bind ?year1 (string-to-field (sub-string 1 4 ?date1)))
   (bind ?year2 (string-to-field (sub-string 1 4 ?date2))) 
   (if (= ?year1 ?year2)
      then
      (return (- (days-from-year-begin ?date1) (days-from-year-begin ?date2))))
   (if (> ?year1 ?year2)
      then
      (bind ?negate FALSE)
      else
      (bind ?negate TRUE)
      (bind ?temp ?date1)
      (bind ?date1 ?date2)
      (bind ?date2 ?temp)
      (bind ?temp ?year1)
      (bind ?year1 ?year2)
      (bind ?year2 ?temp))
   (bind ?day-count (+ (days-until-year-end ?date2) (days-from-year-begin ?date1)))
   (loop-for-count (?year (+ ?year2 1) (- ?year1 1)) do
      (if (is-leap-year ?year)
         then (bind ?day-count (+ ?day-count 366))
         else (bind ?day-count (+ ?day-count 365))))
   (if ?negate
      then 
      (return (- 0 ?day-count))
      else
      (return ?day-count)))

(deffunction date-years-diff (?date1 ?date2)
   (bind ?year1 (string-to-field (sub-string 1 4 ?date1)))
   (bind ?year2 (string-to-field (sub-string 1 4 ?date2))) 
   (if (= ?year1 ?year2)
      then
      (return 0))
   (if (> ?year1 ?year2)
      then
      (bind ?negate FALSE)
      else
      (bind ?negate TRUE)
      (bind ?temp ?date1)
      (bind ?date1 ?date2)
      (bind ?date2 ?temp))
   (bind ?year1 (string-to-field (sub-string 1 4 ?date1)))
   (bind ?year2 (string-to-field (sub-string 1 4 ?date2))) 
   (bind ?month1 (string-to-field (sub-string 6 7 ?date1)))
   (bind ?month2 (string-to-field (sub-string 6 7 ?date2))) 
   (bind ?day1 (string-to-field (sub-string 9 10 ?date1)))
   (bind ?day2 (string-to-field (sub-string 9 10 ?date2))) 
   (bind ?years (- ?year1 ?year2))
   (if (= ?month1 ?month2)
      then
      (if (< ?day1 ?day2)
         then
         (bind ?years (- ?years 1)))
      else
      (if (< ?month1 ?month2)
         then
         (bind ?years (- ?years 1))))

   (if ?negate
      then (return (- 0 ?years))
      else (return ?years)))
