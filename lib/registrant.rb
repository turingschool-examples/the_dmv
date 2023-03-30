class Registrant
  attr_reader :name,
              :age,
              :permit,
              :license_data
  def initialize(name, age, permit = false)
    @name = name
    
    @permit = permit
    @license_data = {
      :written => false, 
      :license => false, 
      :renewed => false
    }
    @age = age
  end

  def permit? 
    @permit
  end

end