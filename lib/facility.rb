class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = facility_details[:collected_fees]
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.set_plate_type
      vehicle.collect_fees
      @registered_vehicles << vehicle
    end
  end

  def collect_fees
    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    else vehicle.plate_type == :standard
      @collected_fees += 100
    end
  end
end
