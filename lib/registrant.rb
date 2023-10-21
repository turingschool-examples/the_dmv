class Registrant
  attr_reader :name, 
  :age, 
  :permit
  

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def permit? 
    @permit
  end

  def license_data
    @license_data
  end

  def earn_permit
    if @permit == false
      @permit = true
    end
  end

end
