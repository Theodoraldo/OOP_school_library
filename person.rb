require './nameable'
require './capitalize_decorator'
require './timmer_decorator'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(age = nil, name = 'Unknown', parent_permission: true)
    super()
    @id = Time.now.strftime('%Y%d%m%H%M%S%Z').to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # correct_name method simply return the name attribute
  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    @age >= 18
  end
end
