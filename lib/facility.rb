class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(details)
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today.inspect
      @registered_vehicles << vehicle
    else
      nil
    end
  end

  def collected_fees
    total_fees = 0
    @registered_vehicles.each do |vehicle|
      if vehicle.plate_type == :ev
        total_fees += 200
      elsif vehicle.plate_type == :antique
        total_fees += 25
      elsif vehicle.plate_type == :regular
        total_fees += 100
      end
    end
    total_fees
  end
end
