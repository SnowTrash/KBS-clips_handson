
;;Definimos los hechos, en este caso, productos y clientes variados
(deffacts products
  (product (part-number 1234) (name "USBMem") (category "storage") (price 199.99))
  (product (part-number 2341) (name "Amplifier") (category "electronics") (price 399.99))
  (product (part-number 3412) (name "Rubber duck") (category "mechanics") (price 99.99))
  (product (part-number 4512) (name "Wireless Mouse") (category "electronics") (price 29.99))
  (product (part-number 5623) (name "Desk Lamp") (category "home") (price 49.99))
  (product (part-number 6734) (name "Coffee Maker") (category "kitchen") (price 79.99))
  (product (part-number 7845) (name "Running Shoes") (category "sports") (price 89.99))
  (product (part-number 8956) (name "Backpack") (category "outdoor") (price 69.99))
  (product (part-number 9067) (name "Smartphone") (category "electronics") (price 599.99))
  (product (part-number 1001) (name "Book") (category "books") (price 19.99))
  (product (part-number 1002) (name "Chair") (category "furniture") (price 129.99))
)

(deffacts customers
  ;; ESTAMOS MODIFICANDO ESTE ARCHIVO PARA QUE COINCIDA CON EL RUN
  (customer (customer-id 101) (name "Joe")   (address "123 Main St") (phone 3313073905 )  (register-date "2023-11-02") (birth-date "1903-00-XX"))
  (customer (customer-id 102) (name "Mary")  (address "456 Elm St") (phone 333222345)     (register-date "2023-09-15") (birth-date "1903-00-XX"))
  (customer (customer-id 103) (name "Bob")   (address "789 Oak St") (phone 331567890)     (register-date "2023-11-02") (birth-date "1903-00-XX"))
  (customer (customer-id 104) (name "Alice") (address "987 Birch St") (phone 335555555)   (register-date "2023-11-02") (birth-date "1903-00-XX"))
  (customer (customer-id 105) (name "David") (address "567 Cedar St") (phone 331234567)   (register-date "2023-11-15") (birth-date "1903-00-XX"))
  (customer (customer-id 106) (name "Carol") (address "876 Pine St") (phone 331999999)    (register-date "2023-11-02") (birth-date "1903-00-XX"))
  ;(customer (customer-id 107) (name "Eve") (address "234 Maple St") (phone 331222333)      ) 
  ;(customer (customer-id 108) (name "Frank") (address "543 Walnut St") (phone 332222444)   ) 
  ;(customer (customer-id 109) (name "Grace") (address "654 Ash St") (phone 334444666)      ) 
  ;(customer (customer-id 110) (name "Harry") (address "789 Cherry St") (phone 331111222)   ) 
  ;(customer (customer-id 111) (name "Ivy") (address "432 Sycamore St") (phone 331122333)   ) 
  ;(customer (customer-id 112) (name "Jack") (address "876 Fir St") (phone 331333444)       ) 
  ;(customer (customer-id 113) (name "Kate") (address "234 Oak St") (phone 334444777)       ) 
  ;(customer (customer-id 114) (name "Liam") (address "567 Birch St") (phone 331245678)     ) 
  ;(customer (customer-id 115) (name "Mia") (address "345 Elm St") (phone 331765432)        ) 
  ;(customer (customer-id 116) (name "Noah") (address "654 Pine St") (phone 332222333)      ) 
  ;(customer (customer-id 117) (name "Olivia") (address "789 Walnut St") (phone 334444555)  ) 
  ;(customer (customer-id 118) (name "Parker") (address "876 Cedar St") (phone 331222777)   ) 
  ;(customer (customer-id 119) (name "Quinn") (address "123 Cedar St") (phone 331222888)    ) 
  ;(customer (customer-id 120) (name "Riley") (address "567 Oak St") (phone 331555666)      ) 
)


(deffacts memberships
 (membership (customer-id 101) (name "Joe")   (cp-typo B49E) )
 (membership (customer-id 102) (name "Mary")  (cp-typo B49E) )
 (membership (customer-id 103) (name "Bob")   (cp-typo B49E) ) 
 (membership (customer-id 104) (name "Alice") (cp-typo B49E) )
 (membership (customer-id 105) (name "David") (cp-typo B49E) )
 (membership (customer-id 106) (name "Carol") (cp-typo B49E) )
)

(deffacts level-updates
 (level-update (customer-id 101) (refered-by 0)    (level 1) (refered-friends 101))
 (level-update (customer-id 102) (refered-by 101)  (level 4) (refered-friends 5)  )
 (level-update (customer-id 103) (refered-by 101)  (level 3) (refered-friends 15) )
 (level-update (customer-id 104) (refered-by 101)  (level 2) (refered-friends 50) )
 (level-update (customer-id 105) (refered-by 101)  (level 5) (refered-friends 3)  )
 (level-update (customer-id 106) (refered-by 101)  (level 5) (refered-friends 2)  )
)

(deffacts card-updates
  (card-update (customer-id 101) (points 5000)(total-buys 150) (cupon-buy 80))
  (card-update (customer-id 102) (points 500) (total-buys 150) (cupon-buy 80))
  (card-update (customer-id 103) (points 500) (total-buys 150) (cupon-buy 80))
  (card-update (customer-id 104) (points 500) (total-buys 150) (cupon-buy 80))
  (card-update (customer-id 105) (points 500) (total-buys 150) (cupon-buy 80))
  (card-update (customer-id 106) (points 500) (total-buys 150) (cupon-buy 80))
)

          ;;Aqui definimos lo que los clientes ordenaron, lo matcheamos
(deffacts orders
  (order (order-number 321) (customer-id 101) (purchase-date "2023-11-02"))
  (order (order-number 320) (customer-id 101) (purchase-date "2023-10-28"))
  (order (order-number 307) (customer-id 101) (purchase-date "2023-10-26"))
  (order (order-number 308) (customer-id 101) (purchase-date "2023-10-25"))

  (order (order-number 301) (customer-id 103) (purchase-date "2023-12-25"))
  (order (order-number 319) (customer-id 104) (purchase-date "2023-01-01"))
  (order (order-number 303) (customer-id 105) (purchase-date "2023-02-14"))
  (order (order-number 304) (customer-id 106) (purchase-date "2023-12-24"))
  (order (order-number 305) (customer-id 102) (purchase-date "2023-09-15"))

  ; (order (order-number 309) (customer-id 111) (purchase-date "2023-09-23"))
  ; (order (order-number 310) (customer-id 112) (purchase-date "2023-09-19"))
  ; (order (order-number 311) (customer-id 113) (purchase-date "2023-10-04"))
  ; (order (order-number 312) (customer-id 114) (purchase-date "2023-09-14"))
  ; (order (order-number 313) (customer-id 115) (purchase-date "2023-09-24"))
  ; (order (order-number 314) (customer-id 116) (purchase-date "2023-09-30"))
  ; (order (order-number 315) (customer-id 117) (purchase-date "2023-09-26"))
  ; (order (order-number 316) (customer-id 118) (purchase-date "2023-09-29"))
  ; (order (order-number 317) (customer-id 119) (purchase-date "2023-09-17"))
  ; (order (order-number 318) (customer-id 120) (purchase-date "2023-09-16"))
  ; (order (order-number 319) (customer-id 121) (purchase-date "2023-09-22"))
  ; (order (order-number 320) (customer-id 122) (purchase-date "2023-09-10"))
  ; (order (order-number 321) (customer-id 123) (purchase-date "2023-09-15"))
)

          ;; Aqui se listan los items comprados, se debe modificar y agregar una fecha
          ;; para calcular la ultima compra
(deffacts items-list
  (line-item (order-number 321) (customer-id 101) (part-number 1234))
  (line-item (order-number 320) (customer-id 101) (part-number 2341) (quantity 10))
  (line-item (order-number 307) (customer-id 101) (part-number 1234) (quantity 4))
  (line-item (order-number 308) (customer-id 101) (part-number 3412) (quantity 3))
  
  (line-item (order-number 301) (customer-id 104) (part-number 1234) (quantity 2))
  (line-item (order-number 319) (customer-id 106) (part-number 3412) (quantity 6))
  (line-item (order-number 303) (customer-id 103) (part-number 2341) (quantity 3))
  (line-item (order-number 304) (customer-id 105) (part-number 2341) (quantity 9))
  (line-item (order-number 305) (customer-id 107) (part-number 2341) (quantity 3))

  ;; Agregaremos ordenes y clientes para gatillar las reglas
  ; Add line items for other orders as needed
)


(deffacts fiestas
  (holiday (name "Dia de muertos") (dia-santo "2023-11-02"))
  (holiday (name "Año nuevo") (dia-santo "2023-01-01"))
  (holiday (name "Dia de reyes") (dia-santo "2023-01-08"))
  (holiday (name "Dia del amor") (dia-santo "2023-02-14"))
  (holiday (name "Noche Buena") (dia-santo "2023-12-24"))
  (holiday (name "Navidad") (dia-santo "2023-12-25"))
  (holiday (name "Elecciones 2024") (dia-santo "2023-09-10"))
  (holiday (name "Muerte de Julio Ruelas") (dia-santo "2023-09-15"))
)

(deffacts postal-codes
  (postal-code (code "331") (group "A"))
  (postal-code (code "332") (group "B"))
  (postal-code (code "333") (group "C"))
  (postal-code (code "334") (group "D"))
  (postal-code (code "335") (group "E"))
  ; Agrega más códigos postales y grupos según tus necesidades
)


;; Aqui se hace la Definicion de fechiyas YY-MM-DD
(deffacts drivers
   (driver (name "Daniel Silva") (dateBorn "2000-08-10"))
   (driver (name "Carlos Santos") (dateBorn "2000-08-15"))
)
   