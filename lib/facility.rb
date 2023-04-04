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
      if registrant.permit? && registrant.age >= 16
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

  def create_facility(state)
    if state == "oregon"
      create_facility_oregon(state)
    elsif state == "new_york"
      create_facility_ny(state)
    elsif state == "missouri"
      create_facility_missouri(state)
    end
  end


  def create_facility_oregon(state)
    oregon = DmvDataService.new.or_dmv_office_locations
    new_facility_list1 = []
    oregon.each do |station|
      facility_or_hash = {name: nil, address: nil, phone: nil}
      facility_or_hash[:name] = station[:title]
      facility_or_hash[:address] = JSON.parse(station[:location_1][:human_address]).values.join(" ")
      facility_or_hash[:phone] = station[:phone_number]
      new_facility_1 = Facility.new(facility_or_hash)
      new_facility_list1 << new_facility_1
    end
    new_facility_list1
  end

  def create_facility_ny(state)
    new_york = DmvDataService.new.ny_dmv_office_locations
    new_facility_list2 = []
    new_york.each do |station|
      facility_ny_hash = {name: nil, address: nil, phone: nil}
      facility_ny_hash[:name] = station[:office_name]
      facility_ny_hash[:address] = station.values_at(:street_address_line_1, :city, :state, :zip_code).join(" ")
      facility_ny_hash[:phone] = station[:public_phone_number]
      new_facility_2 = Facility.new(facility_ny_hash)
      new_facility_list2 << new_facility_2
    end
    new_facility_list2
  end

  def create_facility_missouri(state)
    missouri = DmvDataService.new.mo_dmv_office_locations
    new_facility_list3 = []
    missouri.each do |station|
      facility_mo_hash = {name: nil, address: nil, phone: nil}
      facility_mo_hash[:name] = station[:name]
      facility_mo_hash[:address] = station.values_at(:address1, :city, :state, :zipcode).join(" ")
      facility_mo_hash[:phone] = station[:phone]
      new_facility_3 = Facility.new(facility_mo_hash)
      new_facility_list3 << new_facility_3
    end
    new_facility_list3
  end
end
