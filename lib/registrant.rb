class Registrant
  attr_reader :name, :age, :permit
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
  end

  def permit?
    return true if @earn_permit == true || @permit == true
    false
  end

  def license_data
    license_info = {
      :written=>false, 
      :license=>false, 
      :renewed=>false}
  end

  def earn_permit
    true
  end
end