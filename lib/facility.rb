class Facility
  attr_reader :address,
              :name,
              :phone,
              :services,
              :collected_fees, 
              :registered_vehicles

  def initialize(office)
    @address = office[:address]
    @name = office[:name]
    @phone = office[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today.year
      @registered_vehicles << vehicle
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
    else
      p "Facility does not currently offer this service"
    end
  end

  def add_service(service)
    @services << service
  end
end
