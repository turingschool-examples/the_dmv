class Registrant
    attr_reader :name, :age, :permit

    def initialize(name, age, permit=false)
        @name = name
        @age = age
        @license_data = {written: false, license: false, renewed: false}
    end

    def earn_permit
        @permit = true
    end
end