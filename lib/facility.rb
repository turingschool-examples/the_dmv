class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

  def initialize(facility_info)
    @name                = facility_info[:name]
    @address             = facility_info[:address]
    @phone               = facility_info[:phone]
    @services            = []
    @registered_vehicles = []
    @collected_fees      = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if self.services.include?("Vehicle Registration")
    @registered_vehicles << vehicle
    change_registration_date(vehicle)
    make_plate_type(vehicle)
    collect_fees(vehicle)
    @registered_vehicles
    else
      return nil
    end
  end

  def change_registration_date(vehicle)
    vehicle.registration_date = Date.today
  end
    
  def make_plate_type(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
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
    if self.services.include?('Written Test')
      if registrant.permit? || registrant.age > 16
        registrant.license_data[:written] = true
      else
        false
      end
    else
      false
    end
  end 

  def administer_road_test(registrant)
    if self.services.include?('Road Test')
      if registrant.permit? || registrant.age > 16
        registrant.license_data[:license] = true
      else
        false
      end
    else
      false
    end
  end 

  def renew_drivers_license(registrant)
    if self.services.include?('Renew License')
      if registrant.permit? || registrant.age > 16
        registrant.license_data[:renewed] = true
      else
        false
      end
    else
      false
    end
  end 

  # def create_vehicles(location)
  #   new_car_list = []
  #   location.each do |vehicle|
  #     car_hash = {vin: nil, year: nil, make: nil, model: nil, engine: :ev}
  #     car_hash[:vin] = vehicle[:vin_1_10]
  #     car_hash[:year] = vehicle[:model_year]
  #     car_hash[:make] = vehicle[:make]
  #     car_hash[:model] = vehicle[:model]
  #     new_vehicle = Vehicle.new(car_hash)
  #     new_car_list << new_vehicle
  #   end
  #   new_car_list
  # end

  def create_facility(oregon)
    new_facility_1 = []
    oregon.each do |station|
      or_facility_hash = {name: nil, address: nil, phone: nil}
      
  end

  def create_facility(new_york)
  end

  def create_facility(missouri)
  end



end
