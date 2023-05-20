class Registrant
  attr_reader :name, :age, :permit
  attr_accessor :license_data
  
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = 
      {:written=>false, 
      :license=>false, 
      :renewed=>false}
  end

  def permit?
    if permit == true
      true
    else
      false
    end
  end

  def earn_permit
    @permit = true
  end
end

