require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'
require './work_data.rb'

class Library
attr_accessor :books, :orders, :readers, :authors
include WorkData

  def initialize
    @books, @orders, @readers, @authors = [], [], [], []
    load_authors(@authors)
    load_readers(@readers)
    load_books(@books, @authors)
    load_orders(@orders, @books, @readers)
  end

  def get_who_often_takes_book(book) 
    book_orders = @orders.select { |order| order.book.title == book }
    book_orders = book_orders.group_by { |order| order.reader.name }
    book_orders.sort_by { |name, orders| orders.size }.last[0]
  end

  def get_most_popular_book 
    book_orders = @orders.group_by { |order| order.book.title }
    book_orders.sort_by { |title, orders| orders.size }.last[0]
  end

  def get_people_ordered_three_books
    book_orders = @orders.group_by { |order| order.book.title }
    three_books = book_orders.sort_by { |title, orders| orders.size }.last(3)
    three_book_orders = three_books.inject([], :concat).select { |e| e.is_a?(Array) }.inject([], :concat)
    three_book_orders.map { |order| order.reader.name }.uniq.size
  end

  def save_data
    save_authors(@authors)
    save_readers(@readers)
    save_orders(@orders)
    save_books(@books)     
  end
end