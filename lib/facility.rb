class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services
  attr_accessor :registered_vehicles,
                :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @other_office_locations = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
       @registered_vehicles << vehicle
       vehicle.registration_date = ("Date: 2023-01-12")
          if vehicle.antique?
            vehicle.plate_type = :antique
            @collected_fees += (25)
          elsif vehicle.electric_vehicle?
            vehicle.plate_type = :ev
            @collected_fees += (200)
          else vehicle.plate_type = :regular
            @collected_fees += (100)
          end
      @registered_vehicles
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
      return true
    end
    false
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written]
      registrant.license_data[:license] = true
      return true
    end
    false
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
      return true
    end
    false
  end

  def other_office_locations(details)
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    or_dmv_office_locations.each do |each|
      details = {
        name: info[:title]
        address: info[:human_address]
        phone: info[:phone_number]
        services: []
        registered_vehicles: []
        collected_fees: 0
      }
      other_office_locations << (offices = Facility.new(details))
    end
    @other_office_locations
  end
end
