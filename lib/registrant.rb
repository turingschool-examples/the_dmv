# require 'pry'
class Registrant

    attr_reader :name, :age
    attr_accessor :license_data, :permit

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @license_data = {:written=>false, :license=>false, :renewed=>false}
        @permit = permit
    end

    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end
end





# binding.pry