class Registrant
    attr_reader :name, :age, :permit, :license_data

    def initialize(name, age, permit)
        @name = name
        @age = age
        @permit = permit
        @license_data = {:written => false, :license => false, :renewed => false}
    end


    def permit?(permit)
        permit == false
    end

    def earn_permit
        permit == true
    end


end