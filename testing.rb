require_relative './library.rb'

puts "------------------------------------------------------------------------"

library = Library.new

puts ""
puts "The most popular book is #{library.get_most_popular_book}."
puts "Reader who often takes \"Chalice of Life\" is #{library.get_who_often_takes_book("Chalice of Life")}."
puts "People ordered one of the three most popular books: #{library.get_people_ordered_three_books}"
puts ""

library.save_data
puts "------------------------------------------------------------------------"