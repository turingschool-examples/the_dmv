class Registrant
  attr_reader name

  def initialize(name, age, permit?)
    @name = name
    @age = age
    @permit = false
    
  end
end