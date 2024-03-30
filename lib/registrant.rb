
class Registrant 
    attr_reader 

    def initialize(registrant_details)
        @name
        @age
        @permit
        @license_data = {:written => false, :license => false, :renewed => false}

    end

    def permit?
        @permit == true
    end

    def earn_permit
        @permit = true if @permit!= true
    end




end
