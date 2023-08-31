class Registrant 
  
  attr_reader :name, 
              :age,
              :license_data
              :permit

    def initialize(name, age, permit = false)
      @name = name
      @age = age
      @permit = permit
    end
end