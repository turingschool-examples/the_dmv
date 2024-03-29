class Registrant
    attr_reader :name,
                :age,
                :license_data

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @permit = permit
        @license_data = {:written=>false, :license=>false, :renewed=>false}
    end

    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end

    def pass_written_test
        @license_data[:written] = true
    end
end