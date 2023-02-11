class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
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

  def register_vehicle(car)
    if @services.include?('Vehicle Registration')
      car.registration_date = Date.today
      determine_vehicle_plate_and_fees(car)
      @registered_vehicles << car
    end
  end

  def administer_written_test(person)
    if @services.include?('Written Test')
      if person.permit? && person.age > 15
        person.license_data[:written] = true
      end
    end
  end

  def administer_road_test(person)
    if @services.include?('Road Test')
      if person.license_data[:written]
        person.license_data[:license] = true
      end
    end
  end

private #helper method
  def determine_vehicle_plate_and_fees(car)
    if car.antique?
      car.plate_type = :antique
      @collected_fees += 25
    elsif car.electric_vehicle?
      car.plate_type = :ev
      @collected_fees += 200
    else 
      car.plate_type = :regular
      @collected_fees += 100
    end
  end
end
