class Registrant
    attr_reader :name, :age, :permit

    def initialize(name, age, permit)
        @name = name
        @age = age
        @permit = permit
        @license_data = {}
    end

    def permit?
        if permit == true
        return true
        else 
        return false
        end
    end

end