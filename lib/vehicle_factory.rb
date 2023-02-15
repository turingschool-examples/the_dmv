class VehicleFactory
  attr_accessor :registration_date
  attr_reader   :vehicles

  def initialize
    @vehicles = []
  end
  
  def create_vehicles(registrations)
    registrations.map do |vehicle|
      @vehicles << vehicle = Vehicle.new(registrations)

require 'pry'; binding.pry  
    end
  end

  def all_electric
    @engine == :ev
  end
end
# @vin = vehicle_details[:vin]
# @year = vehicle_details[:year]
# @make = vehicle_details[:make]
# @model = vehicle_details[:model]
# @engine = vehicle_details[:engine]