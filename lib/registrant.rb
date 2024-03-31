
class Registrant 
    attr_reader :name, :age, :permit, :license_data

    def initialize(registrant_details)
        @name = registrant_details[:name]
        @age = registrant_details[:age]
        @permit = registrant_details[:permit]
        @license_data = {written: false, license: false, renewed: false}

    end

    def permit?
        @permit == true # checks if permit is true and returns boolean accordingly 
    end

    def earn_permit
        @permit = true if @permit != true || @permit = true 
        # checks if permit is not equal to true, if it is, then it changes it to true
    end


end
