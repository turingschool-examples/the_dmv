class Registrant 
    attr_reader :name,
                :age,
                :license_data

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @permit = permit
        @license_data = {:license=>false, :renewed=>false, :written=>false}
    end

    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end
end