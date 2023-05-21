class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      vehicle.set_plate_type
      vehicle.set_registration_date
      collect_fee(vehicle)
    end
  end
  
  def collect_fee(vehicle)
    fee = 0
    if vehicle.plate_type == :antique
      fee = 25
    elsif vehicle.plate_type == :ev
      fee = 200
    else
      fee = 100
    end
    @collected_fees += fee
  end
  
  def administer_written_test(registrant)
    if @services.include?('Written Test') && (registrant.age >= 16)
      if registrant.permit?
        registrant.license_data[:written] = true
      else
        false
      end
    else
      false
    end
    
  end



end

