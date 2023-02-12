class Registrant
  attr_reader :name, :age
  attr_accessor :license_data, :permit

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit 
    @license_data = {:written=>false, :license=>false, :renewed=>false} 
  end

  def earn_permit
    if @age >=16
    @permit = true
    else
      false 
    end
  end

  def permit?
   @permit
  end
end