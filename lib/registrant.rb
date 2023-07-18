class Registrant
    attr_reader :name, :age, :license_data
    
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
    
    end