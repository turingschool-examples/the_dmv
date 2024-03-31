
class Registrant 
    attr_reader :name, :age, :permit, :license_data

    def initialize(registrant_details)
        @name = registrant_details[:name]
        @age = registrant_details[:age]
        @permit = registrant_details.fetch(:permit, false) # uses fetch method to retrieve value from hash based on given key,
        @license_data = {written: false, license: false, renewed: false} # then specifies default value to return if key does not exist in hash

    end

    def permit?
        @permit == true # checks if permit is true and returns boolean accordingly 
    end

    def earn_permit
        @permit = true if @permit != true || @permit = true 
        # checks if permit is not equal to true, if it is, then it changes it to true
    end


end
