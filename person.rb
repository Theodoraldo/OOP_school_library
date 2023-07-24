class Person

  attr_accessor(:id, :name, :age, :parent_permission)

  def initialize(name = 'Unknown', age, parent_permission: true)
    @id =  Time.now.strftime("%Y%d%m%H%M%S%Z").to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  private

  def of_age?
    @age >= 18 ? true : false  
  end
end
