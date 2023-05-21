class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles =[]
    @collected_fees = 0
  end
              
  def add_service(service)
    @services << service
  end
              
  def register_vehicle(vehicle)
    vehicle.add_registration_date(Date.today)
    vehicle.add_plate_type
    @registered_vehicles << vehicle unless vehicle_registered?(vehicle) || vehicle.registered?
    vehicle.register
  end
              
  def collect_fees
    @registered_vehicles.each do |vehicle|
      if vehicle.plate_type == :regular
        @collected_fees += 100
      elsif vehicle.plate_type == :antique
        @collected_fees += 25
      else
        @collected_fees += 200
      end
    end
  end

  def vehicle_registered?(vehicle)
    @registered_vehicles.include?(vehicle)
  end

end

