class Registrant
    attr_reader :name, :age, :permit, :license_data

    def initialize(args)
        @name = args[:name]
        @age = args[:age]
        @permit
        @license_data = args[{:written => false, :license => false, :renewed => false}]
    end

    def earn_permit
        @permit == true
    end


end