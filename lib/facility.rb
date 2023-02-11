class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees,
              :facility_2
  
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
    return nil unless services.include?('Vehicle Registration')
    vehicle.registration_date = Date.today
    registration_fees = 0
    if vehicle.antique?
      registration_fees = 25
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      registration_fees = 200
      vehicle.plate_type = :ev 
    else
      registration_fees = 100
      vehicle.plate_type = :regular
    end

      @registered_vehicles << vehicle
      @collected_fees += registration_fees
  end

  def administer_written_test(registrant)
    if registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true   ##if above true, ^registrant license data hash updates :written(key) value from false true
      true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if registrant.license_data[:written] == true 
      registrant.license_data[:license] = true
      true
    else
      false
    end
  end


end
