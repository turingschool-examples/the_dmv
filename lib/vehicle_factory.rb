require 'pry'

class VehicleFactory
    attr_reader :vehicles

    def initialize
        @vehicles = []
    end
end