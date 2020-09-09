# create 20 books
20.times do
  title = Faker::Book.title
  author = Faker::Book.author
  genre = Faker::Book.genre
  Book.create(title:title, author:author, genre:genre)
end 


# run rake db:seed once fix category thing