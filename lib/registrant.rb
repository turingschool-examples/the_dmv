class Registrant 
    attr_reader :name, 
                :age,
                :license_data
    def initialize(name, age, permit_status = false)
        @name = name
        @age = age
        @permit_status = permit_status
        @license_data = {:written=>false, :license=>false, :renewed=>false}
    end

    def permit?
        @permit_status
    end

    def earn_permit
        @permit_status = true
    end

    def pass_written_test
        @license_data[:written] = true
    end

    def earn_license
        @license_data[:license] = true if @license_data[:written] == true
    end

    def renew_license
        @license_data[:renewed] = true if @license_data[:license] == true
    end
end