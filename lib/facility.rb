class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.register_now
      issue_plate_fees(vehicle)
      @registered_vehicles << vehicle
    end
  end

  def add_service(service)
    @services << service
  end

  #helper UNTESTED
  def issue_plate_fees(vehicle)
    if vehicle.antique?
      vehicle.antique_plate
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      vehicle.ev_plate
      @collected_fees += 200
    else
      vehicle.regular_plate
      @collected_fees += 100
    end
  end






end
