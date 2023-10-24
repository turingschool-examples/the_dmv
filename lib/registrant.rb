class Registrant
    attr_reader :age,
                :license_data,
                :name,
                :permit

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @license_data = {
            written: false,
            license: false,
            renewed: false
            }
        @permit = permit
               
    end

    def permit?
        @permit == @permit
    end

    def earn_permit
        if @permit == false
            @permit != false
        end
    end

end


