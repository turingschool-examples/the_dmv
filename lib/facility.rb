class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services
  attr_accessor :registered_vehicles, :collected_fees

  def initialize(options = {})
    @name = options[:name]
    @address = options[:address]
    @phone = options[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    while vehicle.registration_date.nil?
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

      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    end
  end
 
end
