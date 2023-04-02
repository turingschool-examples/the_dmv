class Registrant
attr_reader :name, :age, :permit
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
  end

  def permit?
    if @permit == true
      true
    else
      false
    end
  end
end
