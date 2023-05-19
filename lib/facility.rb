require 'vehicle'

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    vehicle.determine_plate_type
    @registered_vehicles << vehicle
    calculate_collected_fees(vehicle)
  end

  # Vehicles 25 years old or older are considered antique and cost $25 to register
  # Electric Vehicles (EV) cost $200 to register
  # All other vehicles cost $100 to register
  # A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.
  def calculate_collected_fees(vehicle)
    @collected_fees = if vehicle.plate_type == :ev
                        200
                      elsif vehicle.plate_type == :antique
                        25
                      else
                        100
                      end
  end
end
