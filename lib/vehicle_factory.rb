require 'dmv_data_service'
require 'vehicle'

class VehicleFactory
  attr_accessor :rendered_data_array, :made_vehicles

  def initialize
    @rendered_data_array = []
    @made_vehicles = []
  end

  def render_data(list)
    list.each do |spec|
      rendered_data = {
        vin: (spec[:vin_1_10]),
        year: (spec[:model_year]),
        make: (spec[:make]),
        model: (spec[:model]),
        engine: :ev
      }
      @rendered_data_array << rendered_data
    end
  end

  def create_vehicles(list)
    self.render_data(list)
    @rendered_data_array.each do |vehicle_details1|
      @made_vehicles << Vehicle.new(vehicle_details1)
    end
  end
    
end