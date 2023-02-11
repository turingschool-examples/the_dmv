class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services
  attr_accessor :registered_vehicles,
                :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
       @registered_vehicles << vehicle
       vehicle.registration_date = ("Date: 2023-01-12")
          if vehicle.antique?
            vehicle.plate_type = :antique
            @collected_fees += (25)
          elsif vehicle.electric_vehicle?
            vehicle.plate_type = :ev
            @collected_fees += (200)
          else vehicle.plate_type = :regular
            @collected_fees += (100)
          end
      @registered_vehicles
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit?
      registrant.license_data[:written] = true
      return true
    end
      false
  end
end
