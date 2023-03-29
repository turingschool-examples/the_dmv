class Registrant
  attr_reader :name, :age, :permit, :licence_data
  def initialize (name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @licence_data = licence_data
   
  end

  def permit?
    @permit
  end

end