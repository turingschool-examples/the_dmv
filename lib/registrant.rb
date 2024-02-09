class Registrant
  attr_reader :name, :age, :permit

  def initialize(name, age, permit = false)
    @name = name
    @age = age
  end

end
