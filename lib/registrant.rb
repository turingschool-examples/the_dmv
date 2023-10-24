class Registrant
    attr_reader :age,
                :license_data,
                :name,
                :permit

    def initialize(name, age, permit)
        @name = name
        @age = age
        @license_data = {
            written: false,
            license: false,
            renewed: false
            }
        @permit
               
    end

    def permit?
        @permit == false?
    end

end


