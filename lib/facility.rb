class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') && vehicle.registration_date.nil?
      vehicle.registration_date = Date.today
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :electric
        @collected_fees += 200
      else
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
      @registered_vehicles << vehicle
    end
  end
end
