class Registrant
  attr_reader :name, :age
  
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
  end
end