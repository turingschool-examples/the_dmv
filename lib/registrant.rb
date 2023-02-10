class Registrant
  attr_reader :age, 
              :license_data,
              :name,
              :permit

  def initialize(name, age, permit=false)
    @age = age
    @name = name
    @permit = permit
    @license_data = {
      "written" => false,
      "license" => false,
      "renewed" => false
    }
  end

  def permit?
    if @permit == true
      return true
    else
      return false
    end
    
  end
end


