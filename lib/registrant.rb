class Registrant
  attr_reader :name, :age, :permit, :earn_permit
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
  end

  def permit?
    if @permit == true || @earn_permit == true
      return true
    else
      return false
    end
  end    

  def license_data
    license_info = {
      :written=>false, 
      :license=>false, 
      :renewed=>false
    }
  end

  def earn_permit
    @permit = true
  end
end