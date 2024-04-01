class Registrant
    attr_reader :name, :age, :permit, :license_data
    def initialize(name, age, permit = nil)
        @name = name
        @age = age
        @permit = permit unless permit.nil? do
        end
        @license_data = {:written => false, :license => false, :renewed => false}
    end

    def permit?
        if permit == nil
        return false
        else 
            permit == true
        return true
        end
    end

    def earn_permit
        if @permit == nil || @permit == false
            return true
        end
    end
end