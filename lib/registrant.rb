require 'pry'

class Registrant
    attr_reader :name, 
                :age, 
                :permit, 
                :license_data

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @permit = permit
        @license_data = {written: false, 
                         license: false,
                         renewed: false}
    end

    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end

    def pass_written_test
        if permit? && @age >= 16
            @license_data[:written] = true
        end
    end

    def written?
        @license_data[:written]
    end

    def pass_road_test
        if written?
            @license_data[:license] = true
        end
    end

    def license?
        @license_data[:license]
    end

    def renew_license
        if license?
            @license_data[:renewed] = true
        end
    end
end