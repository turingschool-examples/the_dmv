class Registrant
  attr_reader :name, :age

  def initialize(name, age, has_permit = false)
    @name = name
    @age = age
    @has_permit = has_permit
  end

  def permit?
    @has_permit
  end
end
