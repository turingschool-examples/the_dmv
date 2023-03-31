class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

  def initialize(facility_info)
    @name                = facility_info[:name]
    @address             = facility_info[:address]
    @phone               = facility_info[:phone]
    @services            = []
    @registered_vehicles = []
    @collected_fees      = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if self.services.include?("Vehicle Registration")
    @registered_vehicles << vehicle
    change_registration_date(vehicle)
    make_plate_type(vehicle)
    collect_fees(vehicle)
    @registered_vehicles
    else
      return nil
    end
  end

  def change_registration_date(vehicle)
    vehicle.registration_date = Date.today
  end
    
  def make_plate_type(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else 
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    if self.services.include?('Written Test')
      if registrant.permit? && registrant.age >= 16
        registrant.license_data[:written] = true
      else 
        false
      end
      true
    else
      false
    end
  end 

end
