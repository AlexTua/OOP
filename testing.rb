require_relative './library.rb'

puts "------------------------------------------------------------------------"

library = Library.new

puts ""
puts "The most popular book is #{library.get_book}."
puts "Reader who often takes \"Dead Souls\" is #{library.get_reader("Dead Souls")}."
puts "People ordered one of the three most popular books: #{library.get_people.join(", ")}"
puts ""

library.save_data
puts "------------------------------------------------------------------------"

=begin
Pushkin = Author.new("Alexander Sergeyevich Pushkin", "Russian poet and novelist")
Gogol = Author.new("Nikolai Vasilievich Gogol", "Russian dramatist, novelist and short story write")
Bunin = Author.new("Ivan Alekseyevich Bunin", "First Russian writer to win the Nobel Prize for Literature.")

book1 = Book.new("Dead Souls", Gogol)
book2 = Book.new("Taras Bulba", Gogol)
book3 = Book.new("Boris Godunov", Pushkin)
book4 = Book.new("The Captain's Daughter", Pushkin)
book5 = Book.new("Bird's Shadow", Bunin)
book6 = Book.new("Chalice of Life", Bunin)

reader1 = Reader.new("Adlan Pashaev", "pashaev@gmail.com", "Dnepr", "Babushkina", "12")
reader2 = Reader.new("Danil Lazarev", "lazarev@gmail.com", "Dnepr", "Machtovaya", "7")
reader3 = Reader.new("Dima Krasnov", "krasnov@gmail.com", "Dnepr", "Rabochaya", "99")

order1 = Order.new(book1, reader1, "22.03.2016")
order2 = Order.new(book1, reader3, "27.03.2016")
order3 = Order.new(book1, reader2, "02.03.2016")
order4 = Order.new(book2, reader3, "03.04.2016")
order5 = Order.new(book3, reader2, "11.02.2016")
order6 = Order.new(book2, reader2, "21.03.2016")
order7 = Order.new(book3, reader1, "25.04.2016")
order8 = Order.new(book5, reader2, "14.03.2016")
order9 = Order.new(book1, reader1, "22.03.2016")
order10 = Order.new(book2, reader1, "27.03.2016")
order11 = Order.new(book2, reader2, "02.05.2016")
order12 = Order.new(book2, reader3, "28.02.2016")
order13 = Order.new(book4, reader1, "01.01.2016")
order14 = Order.new(book5, reader1, "23.02.2016")
order15 = Order.new(book2, reader1, "30.05.2016")
order16 = Order.new(book6, reader2, "19.07.2016")

library = Library.new
library.orders.push(order1, order2, order3, order4, order5, order6, order7, order8)
library.orders.push(order9, order10, order11, order12, order13, order14, order15, order16)
library.books.push(book1, book2, book3, book4, book5, book6)
library.authors.push(Pushkin, Gogol, Bunin)
library.readers.push(reader1, reader2, reader3)
puts "The most popular book is #{library.get_book}.\n\n"
puts "Reader who often takes books is #{library.get_reader}.\n\n"
puts "People ordered one of the three most popular books: #{library.get_people}"
=end