require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'
require './work_data.rb'

class Library
attr_accessor :orders, :books, :readers, :authors
include WorkData

  def initialize
    @orders, @books, @readers, @authors = [], [], [], []
    load_data

  end

  def get_who_often_takes_book(book) 
    book_orders = @orders.select { |order| order.book.title == book }
    book_orders = book_orders.group_by { |order| order.reader.name }
    book_orders.sort_by { |name, orders| orders.size }.last[0]
  end

  def get_most_popular_book 
    get_book_by_rate(1)[0][0]
  end

  def get_people_ordered_three_books
    three_books = get_book_by_rate(3)
    three_books.map { |e| e[1] }.flatten.map { |order| order.reader.name }.uniq.size
  end
  
  private
    def get_book_by_rate(count)
      book_orders = @orders.group_by { |order| order.book.title }
      book_orders.sort_by { |title, orders| orders.size }.last(count)
    end
end