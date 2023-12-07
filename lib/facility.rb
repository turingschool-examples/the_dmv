class Facility
  attr_reader :name, :address, :phone, :services, :vehicle, :registered_vehicle, :collected_fees

  def initialize(facility_information)
    @name = facility_information[:name]
    @address = facility_information[:address]
    @phone = facility_information[:phone]
    @services = []
    @registered_vehicle = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicle << vehicle
      collect_fees(vehicle)
    end
  end

  def administer_written_test(registrant)
    if registrant.age >= 16 && @services.include?("Written Test") && registrant.permit?
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end

  # def administer_road_test(registrant)

  # end

  # def renew_drivers_license

  # end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

end
