class Facility
  attr_reader :name, 
  :address,
  :phone,
  :services,
  :registered_vehicles,
  :collected_fees,
  :registration_date

  def initialize(info = {})
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
  end

  # can probably refactor this in to the initialization
  def add_service(services)
    @services << services
  end

  def registered_vehicles
    @registered_vehicles = []
  end

  def collected_fees
    @collected_fees = 0
  end

  def register_vehicle(vehicle)
    @registered_vehicles << (vehicle)
    @registration_date = Date.today

    if electric_vehicle?
      plate_type = :ev
      collected_fees = 200
    elsif antique?
      plate_type = :antique
      collected_fees = 25
    elsif regular
      plate_type = :regular
      collected_fees = 100
    end
    
    @collected_fees += collected_fees
    @registered_vehicles
  end
end
