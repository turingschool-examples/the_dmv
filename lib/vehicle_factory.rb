class WaVehicleFactory
  
  attr_reader :vehicles

    def initialize()
      @vehicles = []
    end

    def create_vehicles(source)
      @vehicles << source
      @vehicles.flatten!
      
      @vehicles.each do |vehicle|
        vehicle[:vin] = vehicle.delete :vin_1_10
        vehicle[:year] = vehicle.delete :model_year
        vehicle[:engine] = :ev   
      end
      @vehicles.map! do |vehicle|
        Vehicle.new(vehicle)
      end
    end
  end

      # @vehicles.map do |vehicle|
      #   vehicle.keep_if { |key, value|
      #   key == :vin ||
      #   key == :year ||
      #   key == :make ||
      #   key == :model ||
      #   key == :engine }
      # end


    # @vehicles.map do |vehicle|
      #   Vehicle.new(vehicle.each_pair {
      #     |key, value| puts "#{key}=>#{value},"
      #   }
      #   )
      # end

        # @registration_date = nil
        # @plate_type = nil