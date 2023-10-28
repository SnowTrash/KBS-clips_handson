;; Definimos las plantillas para:
             ;;cliente
(deftemplate customer
  (slot customer-id)
  (multislot name)
  (multislot address)
  (slot phone)
  (slot last-purchase-date)
  (multislot email)
  (slot referral-count)
  (slot reviewed-products)
  (multislot recommended-products)
)
             ;;producto
(deftemplate product
  (slot part-number)
  (slot name)
  (slot category)
  (slot price)
)
             ;;Orden/Ticket
(deftemplate order
  (slot order-number)
  (slot customer-id)
)
             ;;Producto/fila
(deftemplate line-item
  (slot order-number)
  (slot part-number)
  (slot customer-id)
  (slot quantity (default 1))
)
             ;; Oferta de descuento
(deftemplate discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)
             ;; Recompensa loyalty
(deftemplate loyalty-reward
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)
             ;; Oferta de cumpleaños 
(deftemplate birthday-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)
             ;; Descuento en una categoria(si es mas del 75% de la compra) pensada para mayoristas
(deftemplate category-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)
             ;; Descuento Total si no es arriba de un tanto (Para que no choque la regla superior)
(deftemplate total-purchase-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)
            ;; Jalate a un compa
(deftemplate referral-discount-offer
  (multislot customer-name)
  (slot customer-phone)
  (multislot message)
)


;; Conductores y pruebas de fecha 

(deftemplate driver
   (slot name)
   (slot dateBorn))


;; Definimos una clase para las fechas
(deffunction current-date ()
   (bind ?lt (local-time))
   (format nil "%04d-%02d-%02d" (nth$ 1 ?lt) (nth$ 2 ?lt) (nth$ 3 ?lt)))

(deffunction is-leap-year (?year)
   (if (= (mod ?year 400) 0) then (return TRUE))
   (if (= (mod ?year 100) 0) then (return FALSE))
   (if (= (mod ?year 4) 0) then (return TRUE))
   (return FALSE))

;;(defglobal ?*days-before-month* =           (create$ 0 31 59 90 120 151 181 212 243 273 304 334))
;;(defglobal ?*days-before-month-leap-year* = (create$ 0 31 60 91 121 152 182 213 244 274 305 335))


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