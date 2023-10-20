class Registrant
    attr_accessor :name, :age, :permit, :license_data

    def initialize(name, age, permit)
        @name = name
        @age = age
        @permit = permit
        @license_data = {
            written: false,
            license: false,
            renewed: false
        }
    end
end