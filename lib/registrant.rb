class Registrant 
    attr_reader :age,
                :name

    attr_accessor :license_data

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @permit = permit
        @license_data = {written: false, 
                        license: false, 
                        renewed: false}
    end

    def permit?
        @permit = @permit
    end

    def earn_permit
        if @permit == false
            return @permit = true
        else
            @permit
        end

    end
end

#