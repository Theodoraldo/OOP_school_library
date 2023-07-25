require_relative 'nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(age, name = "Unknown", parent_permission: true)
    super()
    @id = Time.now.strftime('%Y%d%m%H%M%S%Z').to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # correct_name method simply return the name attribute
  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
