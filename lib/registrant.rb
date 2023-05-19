class Registrant
  attr_reader :name, :age, :permit

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
  end

  def permit?
    return true if @permit == true

    false
  end
end
