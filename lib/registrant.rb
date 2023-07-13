class Registrant
  attr_reader :name, :age, :permit
  def initialize(name, age, permit = nil)
    @name = name
    @age = age
    @permit = permit
  end

  def permit?
    @permit
  end
end