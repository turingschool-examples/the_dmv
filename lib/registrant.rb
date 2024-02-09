class Registrant

    attr_reader :name, 
                :age, 
                :permit, 
                :license_data

    def initialize(name, age, permit = false, license_data = {})
        @name = name
        @age = age
        @permit = permit
        @license_data = {
            :written => false,
            :license => false,
            :renewed => false
        }
    end

    # Methods

    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end

    def are_written_eligible?
        if @age >= 16 && @permit == true
            @license_data[:written] = true
        else
            return false
        end
    end

    def are_road_eligible?
        if @license_data[:written] = true
            @license_data[:license] = true
        else
            return false
        end
    end

    def are_renew_eligible?
        if @license_data[:license] == true
            @license_data[:renewed] = true
        else
            return false
        end
    end

end