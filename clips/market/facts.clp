
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
)

(deffacts customers
  (customer (customer-id 101) (name "Joe") (address "123 Main St") (phone 3313073905) (last-purchase-date "10/01/2023"))
  (customer (customer-id 102) (name "Mary") (address "456 Elm St") (phone 333222345) (last-purchase-date "09/25/2023"))
  (customer (customer-id 103) (name "Bob") (address "789 Oak St") (phone 331567890) (last-purchase-date "10/05/2023"))
  (customer (customer-id 104) (name "Alice") (address "987 Birch St") (phone 335555555) (last-purchase-date "09/15/2023"))
  (customer (customer-id 105) (name "David") (address "567 Cedar St") (phone 331234567) (last-purchase-date "10/02/2023"))
  (customer (customer-id 106) (name "Carol") (address "876 Pine St") (phone 331999999) (last-purchase-date "09/10/2023"))
  (customer (customer-id 107) (name "Eve") (address "234 Maple St") (phone 331222333) (last-purchase-date "09/28/2023"))
  (customer (customer-id 108) (name "Frank") (address "543 Walnut St") (phone 332222444) (last-purchase-date "09/20/2023"))
  (customer (customer-id 109) (name "Grace") (address "654 Ash St") (phone 334444666) (last-purchase-date "09/05/2023"))
  (customer (customer-id 110) (name "Harry") (address "789 Cherry St") (phone 331111222) (last-purchase-date "09/23/2023"))
  (customer (customer-id 111) (name "Ivy") (address "432 Sycamore St") (phone 331122333) (last-purchase-date "09/19/2023"))
  (customer (customer-id 112) (name "Jack") (address "876 Fir St") (phone 331333444) (last-purchase-date "10/04/2023"))
  (customer (customer-id 113) (name "Kate") (address "234 Oak St") (phone 334444777) (last-purchase-date "09/14/2023"))
  (customer (customer-id 114) (name "Liam") (address "567 Birch St") (phone 331245678) (last-purchase-date "09/24/2023"))
  (customer (customer-id 115) (name "Mia") (address "345 Elm St") (phone 331765432) (last-purchase-date "09/30/2023"))
  (customer (customer-id 116) (name "Noah") (address "654 Pine St") (phone 332222333) (last-purchase-date "09/26/2023"))
  (customer (customer-id 117) (name "Olivia") (address "789 Walnut St") (phone 334444555) (last-purchase-date "09/29/2023"))
  (customer (customer-id 118) (name "Parker") (address "876 Cedar St") (phone 331222777) (last-purchase-date "09/17/2023"))
  (customer (customer-id 119) (name "Quinn") (address "123 Cedar St") (phone 331222888) (last-purchase-date "09/16/2023"))
  (customer (customer-id 120) (name "Riley") (address "567 Oak St") (phone 331555666) (last-purchase-date "09/22/2023"))
  (customer (customer-id 121) (name "Sophia") (address "321 Birch St") (phone 331999111) (last-purchase-date "09/10/2023"))
  (customer (customer-id 122) (name "Michael") (address "876 Oak St") (phone 332222111) (last-purchase-date "09/15/2023"))
  (customer (customer-id 123) (name "Elizabeth") (address "456 Elm St") (phone 331222333) (last-purchase-date "09/28/2023"))
)

          ;;Aqui definimos lo que los clientes ordenaron, lo matcheamos
(deffacts orders
  (order (order-number 300) (customer-id 102))
  (order (order-number 301) (customer-id 103))
  (order (order-number 302) (customer-id 104))
  (order (order-number 303) (customer-id 105))
  (order (order-number 304) (customer-id 106))
  (order (order-number 305) (customer-id 107))
  (order (order-number 306) (customer-id 108))
  (order (order-number 307) (customer-id 109))
  (order (order-number 308) (customer-id 110))
  (order (order-number 309) (customer-id 111))
  (order (order-number 310) (customer-id 112))
  (order (order-number 311) (customer-id 113))
  (order (order-number 312) (customer-id 114))
  (order (order-number 313) (customer-id 115))
  (order (order-number 314) (customer-id 116))
  (order (order-number 315) (customer-id 117))
  (order (order-number 316) (customer-id 118))
  (order (order-number 317) (customer-id 119))
  (order (order-number 318) (customer-id 120))
  (order (order-number 319) (customer-id 121))
  (order (order-number 320) (customer-id 122))
  (order (order-number 321) (customer-id 123))
)


          ;; Aqui se listan los items comprados, se debe modificar y agregar una fecha
          ;; para calcular la ultima compra
(deffacts items-list
  (line-item (order-number 300) (customer-id 102) (part-number 1234))
  (line-item (order-number 301) (customer-id 103) (part-number 2341) (quantity 10))
  (line-item (order-number 319) (customer-id 121) (part-number 1234) (quantity 2))
  (line-item (order-number 320) (customer-id 122) (part-number 3412) (quantity 5))
  (line-item (order-number 321) (customer-id 123) (part-number 2341) (quantity 3))
  ; Add line items for other orders as needed
)



;; Aqui se hace la manipulacion de fechiyas
(deffacts drivers
   (driver (name "Daniel Silva") (dateBorn "1985-03-04"))
   (driver (name "Carlos Santos") (dateBorn "2000-03-04")))
   