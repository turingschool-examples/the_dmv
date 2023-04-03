class VehicleFactory

  attr_reader :vehicles_list
    def initialize
      @vehicles_list = []
    end

    def create_vehicles(vehicles)
      vehicles.each do |vehicle|
        @vehicles_list << Vehicle.new(vehicle)
      end
    end


end