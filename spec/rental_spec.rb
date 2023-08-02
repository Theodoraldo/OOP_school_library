require_relative '../person'
require_relative '../book'
require_relative '../rental'

RSpec.describe Rental do
  let(:date) { '2023-08-01' }
  let(:person) { Person.new(24, 'Olu') }
  let(:book) { Book.new('The Hearers', 'Atta Gyamfi') }

  describe 'Entry for rentals' do
    it 'Providing values for rental date, person, and book' do
      rental = Rental.new(date, person, book)
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'Adding rented items to array' do
      rental = Rental.new(date, person, book)
      expect(person.rentals).to include(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
