# We should also be able to change a permit from false to true after a Registrant has earned their permit. 
# There is no age limit to when someone can earn their permit.

require 'pry'
require 'pry-reload'
# require './lib/facility'

class Registrant
    attr_reader :name, :age, :permit, :license_data

    def initialize(name, age, permit=false)
        @name = name
        @age = age
        @permit = permit
        @license_data = {
            written: false,
            license: false,
            renewed: false
        }
    end

    def permit?
        return @permit
    end

    def earn_permit
        @permit = true
    end
end

binding.pry

# new_registrant = Registrant('John', 25, 'Some license data')
# new_registrant.permit = 0 (default argument)

# Truthy / Falsey

    # 0 => Truthy
    # [] => Truthy
    # "" => Truthy