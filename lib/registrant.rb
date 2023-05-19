class Registrant

    attr_reader :name, :age, :permit

    def initialize(name, age, permit=true)
        @name = name
        @age = age
        @permit = permit
    end
end