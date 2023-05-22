

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  # facility_details = { :name, :address, :phone}

  def initialize(facility_details)
    @name = facility_details [:name]
    @address = facility_details [:address]
    @phone = facility_details [:phone]
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
      @registered_vehicles << vehicle
        if vehicle.engine == :ev
          @collected_fees += 200
        elsif vehicle.plate_type == :antique
          @collected_fees += 25
        else
          @collected_fees += 100
        end
      else
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? == true && registrant.age > 15
      registrant.take_written_test
    else false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written] == true
      registrant.take_road_test
    else false
    end
  end
end
