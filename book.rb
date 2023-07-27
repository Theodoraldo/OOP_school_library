class Book
  attr_accessor :rentals, :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    rentals << rental
  end

  def rented_by
    rentals.map(&:person)
  end
end
