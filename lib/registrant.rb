class Registrant
    attr_reader

    def initialize(name, age, permit=false)
        @name = name
        @age = age
        @license_data = hash[written:, license:, renewed:]
    end

    def earn_permit
        @permit = true
    end
end