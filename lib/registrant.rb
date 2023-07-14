class Registrant
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = false
    require 'pry';binding.pry
  end
end