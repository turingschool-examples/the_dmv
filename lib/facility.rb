class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @fee_by_plate = { antique: 25, ev: 200, regular: 100 }
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
  end

  def fee_assignment(vehicle)
    antique_fee = @fee_by_plate[:antique]
    ev_fee = @fee_by_plate[:ev]
    regular_fee = @fee_by_plate[:regular]
    if vehicle.antique? && vehicle.engine == :ev
        @collected_fees += (antique_fee + ev_fee)
      elsif
        vehicle.antique?
        @collected_fees += antique_fee
      elsif vehicle.engine == :ev
        @collected_fees += ev_fee
      else
        @collected_fees += regular_fee
    end
  end
#What if the value eventually changes? Can we make this more flexible?
  def plate_assignment(vehicle)
    antique_plate = @fee_by_plate.key(@fee_by_plate[:antique])
    ev_plate = @fee_by_plate.key(@fee_by_plate[:ev])
    regular_plate = @fee_by_plate.key(@fee_by_plate[:regular])
    if vehicle.antique?
        vehicle.plate_type = antique_plate
      elsif vehicle.engine == :ev
        vehicle.plate_type = ev_plate
      else
        vehicle.plate_type = regular_plate
    end

  end

  def administer_written_test(registrant)
    registrant.license_data[:written] = true
    if registrant.permit? && registrant.age >= 16 && @services.include?("Written Test")
      true
    else
      false
    end
  end
end
#NOTE: A facility must offer a service in order to perform it. Just because the DMV allows facilities to perform certain services, does not mean that every facility provides every service.

# First error: Test shows that facility only has 1 argument passing which was a hash. The first version had 3 arguments (name,address,phone). We need to put all of those arguments in one hash to create 1 argument.

# Second error: Mispelling of 'service' in 'add-service'