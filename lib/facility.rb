class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_information)
    @name = facility_information[:name]
    @address = facility_information[:address]
    @phone = facility_information[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def collected_fees
  @registered_vehicles.each do |registered_vehicle|
    if registered_vehicle.plate_type == [:antique]
      @collected_fees += 25
    elsif registered_vehicle.plate_type == [:ev]
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end
  return @collected_fees
  end

  def register_vehicle(vehicle)
      if @services.include? 'Vehicle Registration'
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      return @registered_vehicles
    end
  end

  def administer_written_test(registrant)
    if registrant.permit? == true && registrant.age >= 16
      true
      registrant.license_data[:written] = true
    else
      false
      registrant.license_data[:written] = false
    end
  end





end
