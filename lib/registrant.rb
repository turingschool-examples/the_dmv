class Registrant
  attr_reader :name, :age

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    # require 'pry';binding.pry
  end

  def permit?
    @permit
  end

end