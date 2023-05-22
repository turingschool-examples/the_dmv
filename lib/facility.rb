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
    if @services.include?('Vehicle Registration')
      vehicle.register

      if vehicle.plate_type == :antique 
        @collected_fees += 25
      elsif vehicle.plate_type == :ev 
        @collected_fees += 200
      else
        @collected_fees += 100
      end

      @registered_vehicles << vehicle 
    end 
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit? && registrant.age >= 16
      true
      registrant.license_data[:written] = true
    else 
      false 
    end
  end

  def 
end
