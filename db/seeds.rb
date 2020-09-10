Book.destroy_all
Bookshelf.destroy_all 
Genre.destroy_all 

jackson = Bookshelf.create(:name => "Jackson")
rita = Bookshelf.create(:name => "Rita")

# create 5 books for Jackson's shelf
5.times do
  book_title = Faker::Book.title
  book_author = Faker::Book.author
  book_genre = Faker::Book.genre
  g1 =Genre.create(name:Faker::Book.genre)
  #bs =Bookshelf.create(name:Faker::Name.name)
  Book.create(title:book_title, author:book_author, genre_id:g1.id, bookshelf_id:jackson.id)
end 


# create 5 books for Rita's shelf
5.times do
  book_title = Faker::Book.title
  book_author = Faker::Book.author
  book_genre = Faker::Book.genre
  g1 =Genre.create(name:Faker::Book.genre)
  #bs =Bookshelf.create(name:Faker::Name.name)
  Book.create(title:book_title, author:book_author, genre_id:g1.id, bookshelf_id:rita.id)
end 



# run rake db:seed to seed with dummy data