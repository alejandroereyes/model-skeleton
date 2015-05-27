#Using Active Record
-------------------

##1) There are 50 users

  [5] pry(main)> User.count
   => 50

##2) 5 most expensive items
  - Small Cotton Gloves $9984
  - Small Wooden Computer $9859
  - Awesome Granite Pants $9790
  - Sleek Wooden Hat $9390
  - Ergonomic Steel Car $9341

  [16] pry(main)> Item.order(price: :desc).limit(5)

##3) Cheapest book is Ergonomic Granite Chair $1496

   [17] pry(main)> Item.where(category: 'Books').order(price: :asc).limit(1)

##4) Corrine Little has lives at 6439 Zetta hills

  [47] pry(main)> User.joins("JOIN addresses WHERE addresses.street = '6439 Zetta Hills' AND users.id = addresses.user_id")

  And has a second address at 54360 Wolff Forges

  [49] pry(main)> Address.where(user_id: 40)

##5) Virginie's addresses have been updated

  [50] pry(main)> User.where(first_name: "Virginie")
  [56] pry(main)> Address.where(user_id: 39).update_all(city: "New York", zip: 10108)

##6) It would cost $7383 to buy one of each tool

  [58] pry(main)> Item.where(category: 'Tools').sum(:price)

##7) 2125 items were sold

  [60] pry(main)> Order.sum(:quantity)

##8) Total spent on books $420566

  book_orders = Item.joins('JOIN orders ON orders.item_id = items.id').where(category: 'Books')
  [95] pry(main)> book_orders.sum('price * quantity')


