class Registrant

    attr_reader :name,
                :age,
                :permit

    def initialize(name, age, permit)
        @name = name
        @age = age
        @permit = permit
    end

    def permit?
       permit == true
    end
end
