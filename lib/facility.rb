class Facility
  attr_reader :name, :address, :phone, :services, :facility_details, :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.register
      collect_fees(vehicle)
    else
      nil
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
    if services.include?("Written Test") && registrant.age >= 16 && registrant.permit?
      registrant.pass_written
      true
    else
      false
    end
  end
end
