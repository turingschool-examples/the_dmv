class Facility
  attr_reader :name, :address, :phone, 
              :services, :registered_vehicles,
              :collected_fees

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
    # if @services.include?('Vehicle Registration')
    vehicle.register
    # end
    if vehicle.plate_type == :antique 
      @collected_fees += 25
    elsif vehicle.plate_type == :ev 
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    @registered_vehicles << vehicle 
  end

  def administer_written_test(registrant)
    @services.each do |service|
      services.('Written Test')

    end
  end
end
