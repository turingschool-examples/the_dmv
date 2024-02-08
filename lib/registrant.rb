class Registrant
    attr_reader :name, 
                :age, 
                :permit, 
                :license_data

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @permit = permit
        @license_data = {written: false, 
                         license: false,
                         renewed: false
                        }
    end
end

@registrant_1 = Registrant.new('Bruce', 18, true)
puts @registrant_1.license_data