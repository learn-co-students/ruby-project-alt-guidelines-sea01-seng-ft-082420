Book.destroy_all
Bookshelf.destroy_all 
Genre.destroy_all 

# create 5 books
5.times do
  book_title = Faker::Book.title
  book_author = Faker::Book.author
  book_genre = Faker::Book.genre
  g1 =Genre.create(name:Faker::Book.genre)
  bs =Bookshelf.create(name:Faker::Name.name)
  Book.create(title:book_title, author:book_author, genre_id:g1.id, bookshelf_id:bs.id)
end 


# run rake db:seed once fix genre thing