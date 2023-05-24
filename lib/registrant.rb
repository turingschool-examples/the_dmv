require 'pry'
class Registrant
    attr_reader :name, :age, :permit, :licence_data, :written, :licence, :renewed 
    def initialize(name,age,permit=false)
        @name = name
        @age = age
        @permit = permit
        @licence_data = {:written => false,
                    :licence => false,
                    :renewed => false,
                    }
    end
    
    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end

    def write_test
    @licence_data[:written] = true
    end

    def test_written?
    @licence_data[:written] 
    end

    def road_test
        @licence_data[:licence] = true
    end

    def road_test?
        @licence_data[:licence]
    end

    def renew_licence
        @licence_data[:renewed] = true
    end  
end