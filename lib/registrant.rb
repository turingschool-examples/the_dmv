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

end


