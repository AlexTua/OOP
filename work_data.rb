require 'csv'

module WorkData
  
  def save_authors(authors)
    CSV.open('db/authors.csv', 'w') do |file|
      authors.each do |author|
        file << [author.name, author.biography]
      end
    end 
    puts "Authors has been saved."
  end

  def save_readers(readers)
    CSV.open('db/readers.csv', 'w') do |file|
      readers.each do |reader|
        file << [reader.name, reader.email, reader.city, reader.street, reader.house]
      end
    end 
    puts "Readers has been saved."
  end

  def save_orders(orders)
    CSV.open('db/orders.csv', 'w') do |file|
      orders.each do |order|
        file << [order.book.title, order.reader.name, order.date]
      end
    end 
    puts "Orders has been saved."
  end

  def save_books(books)
    CSV.open('db/books.csv', 'w') do |file|
      books.each do |book|
       file << [book.title, book.author.name]
      end
    end 
    puts "Books has been saved."
  end

  def load_authors(array)
    CSV.foreach('db/authors.csv', 'r') do |row|
      array << Author.new(row[0], row[1])
    end
    puts "Authors has been loaded."
  end

  def load_readers(array)
    CSV.foreach('db/readers.csv', 'r') do |row|
      array << Reader.new(row[0], row[1], row[2], row[3], row[4])
    end
    puts "Reader has been loaded."
  end

  def load_books(array, authors)
    CSV.foreach('db/books.csv', 'r') do |row|
      author = authors.select { |author| author.name == row[1] }.pop
      array << Book.new(row[0], author)
    end
    puts "Books has been loaded." 
  end

  def load_orders(array, books, readers)
    CSV.foreach('db/orders.csv', 'r') do |row|
      book = books.select { |book| book.title == row[0] }.pop
      reader = readers.select { |reader| reader.name == row[1] }.pop
      array << Order.new(book, reader, row[2])
    end
    puts "Orders has been loaded." 
  end
end