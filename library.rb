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

  def get_reader #Who often takes the book
    get_stat("reader")
  end

  def get_book #What is the most popular book
    get_stat("book")
  end

  def get_people #How many people ordered one of the three most popular books
    popular_book = get_stat("book")
    people = orders.select { |order| order.book.title == popular_book }
    people.map { |order| order = order.reader.name }.uniq
  end

  def save_data
    save_authors(authors)
    save_readers(readers)
    save_orders(orders)
    save_books(books)     
  end

  private
    def get_stat(rate_by)
      stat = {}
      frequency = []
      case rate_by 
        when "reader"
          orders.each { |order| frequency.push(order.reader.name) }
        when "book"
          orders.each { |order| frequency.push(order.book.title) }
      end
      frequency.uniq.each { |name| stat[name] = frequency.count(name) }
      stat.sort_by { |name, count| count }.last[0]
    end 
end

=begin
  def who_often_takes_the_book
    often_take = {}
    reader_names = []
    orders.each { |order| reader_names.push(order.reader.name) }
    reader_names.uniq.each { |name| often_take[name] = reader_names.count(name) }
    often_take.sort_by { |name, count| count }.last[0]
=end

=begin
def get_the_most_popular_book
    most_popular = {}
    books_titles = []
    orders.each { |order| books_titles.push(order.book.title) }
    books_titles.uniq.each { |title| most_popular[title] = books_titles.count(title) }
    most_popular.sort_by { |title, count| count }.last[0]
=end