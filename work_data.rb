require 'csv'

module WorkData
  
  def save_data
    self.instance_variables.each do |var|
      case var
        when :@authors
          CSV.open('db/authors.csv', 'w') do |file|
            self.instance_variable_get(:@authors).each do |author|
             file << [author.name, author.biography]
            end
          end 
          puts "Authors has been saved."

        when :@readers
          CSV.open('db/readers.csv', 'w') do |file|
            self.instance_variable_get(:@readers).each do |reader|
              file << [reader.name, reader.email, reader.city, reader.street, reader.house]
            end
          end 
          puts "Readers has been saved."
        
        when :@orders
          CSV.open('db/orders.csv', 'w') do |file|
            self.instance_variable_get(:@orders).each do |order|
              file << [order.book.title, order.reader.name, order.date]
            end
          end 
          puts "Orders has been saved."
        
        when :@books
          CSV.open('db/books.csv', 'w') do |file|
            self.instance_variable_get(:@books).each do |book|
              file << [book.title, book.author.name]
            end
          end 
          puts "Books has been saved."
      end
    end
  end

  def load_data
    self.instance_variables.each do |var|
      case var
        when :@authors
          CSV.foreach('db/authors.csv', 'r') do |row|
             self.instance_variable_get(:@authors) << Author.new(row[0], row[1])
          end
          puts "Authors has been loaded."

        when :@readers
          CSV.foreach('db/readers.csv', 'r') do |row|
            self.instance_variable_get(:@readers) << Reader.new(row[0], row[1], row[2], row[3], row[4])
          end
          puts "Reader has been loaded."

        when :@books
          CSV.foreach('db/books.csv', 'r') do |row|
            author = self.instance_variable_get(:@authors).select { |author| author.name == row[1] }.pop
            self.instance_variable_get(:@books) << Book.new(row[0], author)
           end
           puts "Books has been loaded." 

        when :@orders
          CSV.foreach('db/orders.csv', 'r') do |row|
            book = self.instance_variable_get(:@books).select { |book| book.title == row[0] }.pop
            reader = self.instance_variable_get(:@readers).select { |reader| reader.name == row[1] }.pop
            self.instance_variable_get(:@orders) << Order.new(book, reader, row[2])
          end
          puts "Orders has been loaded." 
      end
    end
  end
end