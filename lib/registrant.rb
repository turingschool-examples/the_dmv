class Registrant
    attr_reader :name,
                :age,
                :permit,
                :license_data

    def initialize(
        name, 
        age, 
        permit = false, 
        license_data = {
            :written=>false, 
            :license=>false, 
            :renewed=>false
        }
        ) 
        @name = name
        @age = age
        @permit = permit
        @license_data = license_data
    end

    def permit?
        @permit
    end

    def earn_permit 
        @permit = true if @permit == false
        
    end
end

# Administer a written test
# A written test can only be administered to registrants with a permit and 
# who are at least 16 years of age

# Administer a road test
# A road test can only be administered to registrants who have passed 
# the written test
# For simplicity’s sake, Registrants who qualify for the road test 
# automatically earn a license

# Renew a driver’s license
# A license can only be renewed if the registrant has already passed 
# the road test and earned a license