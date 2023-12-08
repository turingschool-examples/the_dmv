
class Registrant 
    attr_reader :name,
                    :age,
                    :permit,
                    :license_data

    def initialize(registrant_data)
        @name = registrant_data[:name]
        @age = registrant_data[:age]
        @permit = registrant_data[:permit]
        @license_data = {
            :written => false,
            :license => false,
            :renewed => false
        }
    end
    
    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end

end