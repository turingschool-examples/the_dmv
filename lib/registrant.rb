class Registrant
  attr_reader :name,
              :age,
              :permit
              
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {
      written: false, 
      license: false, 
      renewed: false
    }
    
  end

  def permit? 
    @permit
  end

  def earn_permit
    @permit = true
  end

  def read_license_data
    @license_data
  end

  def written_pass
    @license_data[:written] = true
  end

end