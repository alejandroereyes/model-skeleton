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

##9) Added a user and order for new user

    [96] pry(main)> User.create(first_name: 'Alex', last_name: 'Reyes', email: 'here@tiy.com')

    [98] pry(main)> Order.create(user_id: 51, item_id: 33, quantity: 4, created_at: '')

##10) Item(s) ordered the most Ergonomic Concrete Gloves

      group all items by item ids
      [104] pry(main)> OI_group_item_id = Order.joins('JOIN items ON items.id = Orders.item_id').group(:item_id)
      [105] pry(main)> results = OI_group_item_id.count
      [106] pry(main)> results.max_by{ |k, v| v}
      id = 10, value = 9
      [130] pry(main)> Item.where(id: 10)


##11) Highest grossing item is the Incredible Granite Car $525240

      results = OI_group_item_id.sum('price * quantity')
      results.max_by{ |k, v| v }
      id = 65, value = 525240
      [129] pry(main)> Item.where(id: 65)

##12) User who spent the most is Hassan Runte

      oui_user_id = Order.joins('JOIN users ON users.id = orders.user_id').joins('JOIN items ON items.id = orders.item_id').group(:user_id)
      results = oui_user_id.sum('quantity * price')
      results.max_by{ |k, v|, v }
      id = 19, value 639386
      [143] pry(main)> User.where(id: 19)

##13) Top 3 grossing categories
      - Music, Sports & Clothing, $525240
      - Beauty, Toys & Sports, $449496
      - Sports, $448410

      oi_category = Order.joins('JOIN items ON items.id = orders.item_id').group(:category)
      results = oi_category.sum('quantity * price')
      Below x3
      results.max_by{ |k, v| v }
      results.delete(key returned from above)

##14) Created a new table named reviews

      ```▶ rake db:migrate
      == 20150527221706 CreateReviews: migrating ====================================
      -- create_table(:reviews)
      -> 0.0016s
      == 20150527221706 CreateReviews: migrated (0.0029s) ===========================```

##15) Created a review for new reviews table

      ```[2] pry(main)> Review.create(user_id: 51, item_id: 33, rating: 5, comment: "Great for skydiving!")```








