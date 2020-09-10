
Customer.destroy_all
Winery.destroy_all
WineDeal.destroy_all

c1 = Customer.create(name: "Retsuko", wine_preference: "bubbly")
c2 = Customer.create(name: "Fenneko", wine_preference: "rose")
c3 = Customer.create(name: "Haida", wine_preference: "red")
c4 = Customer.create(name: "Gori", wine_preference: "white")
c5 = Customer.create(name: "Washimi", wine_preference: "white")
c6 = Customer.create(name: "Tadano", wine_preference: "red")
# c7 = Customer.create(name: "Okasan", wine_preference: "bubbly")
# c8 = Customer.create(name: "Ton", wine_preference: "red")
# c9 = Customer.create(name: "Komiya", wine_preference: "red")
# c10 = Customer.create(name: "Tsunoda", wine_preference: "bubly")


w1 = Winery.create(name: "Bubbly Wubbly", wine_type: "bubbly")
w2 = Winery.create(name: "Rose All Day", wine_type: "rose")
w3 = Winery.create(name: "Bright White", wine_type: "white")
w4 = Winery.create(name: "Red Meat Red", wine_type: "red")

WineDeal.create(name: "first", customer_id: c1.id, winery_id: w1.id)
WineDeal.create(name: "second", customer_id: c2.id, winery_id: w2.id)
WineDeal.create(name: "third", customer_id: c3.id, winery_id: w4.id)
WineDeal.create(name: "fourth", customer_id: c4.id, winery_id: w3.id)
WineDeal.create(name: "fifth", customer_id: c5.id, winery_id: w3.id)
WineDeal.create(name: "sixth", customer_id: c6.id, winery_id: w4.id)
WineDeal.create(name: "seventh", customer_id: c1.id, winery_id: w1.id)
WineDeal.create(name: "eight", customer_id: c3.id, winery_id: w4.id)
WineDeal.create(name: "ninth", customer_id: c3.id, winery_id: w4.id)
WineDeal.create(name: "tenth", customer_id: c2.id, winery_id: w1.id)