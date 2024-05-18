class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  def initialize(facilities_info)
    @name = facilities_info[:name]
    @address = facilities_info[:address]
    @phone = facilities_info[:phone]
    @services = []
    @registered_vehicles = []
  end
  def add_service(service)
    @services << service
  end

  def register_vehicles(vehicle)
    @registered_vehicles << vehicle
  end

  def collected_fees

    total_fees = 0
    @registered_vehicles.each do |vehicle|
      total_fees += calculate_registration_fee(vehicle)
    end
    
    total_fees
  end

  def calculate_registration_fee(vehicle)
    # Implement your logic to calculate registration fee based on vehicle details
    # For example, you might have different fees for different vehicle types or years
    # This is just a placeholder implementation
    case vehicle.year
    when 2010..2022
      100
    else
      150
    end
  end




end

