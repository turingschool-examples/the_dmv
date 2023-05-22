class Facility
  attr_reader :name,
              :address,
              :phone,
              :website,
              :type,
              :agency,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @website = data[:website]
    @type = data[:type]
    @agency = data[:agency]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def self.create_facility(state, facility_data)
    case state
    when 'OR' # Oregon
      create_facility_from_oregon(facility_data)
    when 'NY' # New York
      create_facility_from_new_york(facility_data)
    when 'MO' # Missouri
      create_facility_from_missouri(facility_data)
    else
      raise "Unsupported state: #{state}"
    end
  end

  def self.create_facility_from_oregon(facility_data)
    facility_data.map do |data|
      name = data[:title]
      address_json = JSON.parse(data[:location_1][:human_address])
      street = address_json['address']
      city = address_json['city']
      state = address_json['state']
      zip_code = address_json['zip']
      phone = data[:phone_number]
      website = data[:website]
      type = data[:type]
      agency = data[:agency]

      address = "#{street}, #{city}, #{state}, #{zip_code}" # Concatenate address components

      Facility.new(name: name, address: address, phone: phone, website: website, type: type, agency: agency)
    end
  end

  def self.create_facility_from_new_york(facility_data)
    facility_data.map do |data|
      name = data[:office_name]
      # address_json = JSON.parse(data)[:street_address_line_1]
      street = data[:street_address_line_1]
      city = data[:city]
      state = data[:state]
      zip_code = data[:zip_code]
      phone = 'undefined'
      website = 'undefined'
      address = "#{street}, #{city}, #{state}, #{zip_code}" # Concatenate address components

      Facility.new(name: name, address: address, phone: phone, website: website)
    end
  end

  def self.create_facility_from_missouri(facility_data)
    facility_data.map do |data|
      name = data[:name]
      # address_json = JSON.parse(data)[:street_address_line_1]
      street = data[:address1]
      city = data[:city]
      state = data[:state]
      zip_code = data[:zipcode]
      phone = data[:phone]
      website = 'undefined'
      address = "#{street}, #{city}, #{state}, #{zip_code}" # Concatenate address components

      Facility.new(name: name, address: address, phone: phone, website: website)
    end
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    raise 'Vehicle already registered.' if @registered_vehicles.include?(vehicle)

    return nil unless @services.include?('Vehicle Registration')

    vehicle.registration_date = Date.today
    vehicle.determine_plate_type
    @registered_vehicles << vehicle
    calculate_collected_fees(vehicle)
    @registered_vehicles
  end

  def calculate_collected_fees(vehicle)
    plate_type_fees = {
      ev: 200,
      antique: 25
    }

    @collected_fees += plate_type_fees[vehicle.plate_type] || 100
  end

  def earn_permit(registrant)
    raise 'Already has permit.' if registrant.permit?

    return nil unless registrant.age > 15

    registrant.earn_permit
  end

  def administer_written_test(registrant)
    raise 'Already took written test.' if registrant.written_test?

    return nil unless registrant.permit? && registrant.age > 15 && @services.include?('Written Test')

    registrant.administer_written_test
  end

  def administer_road_test(registrant)
    raise 'Already took road test and has license.' if registrant.road_test?

    return nil unless registrant.written_test? && @services.include?('Road Test')

    registrant.administer_road_test
  end

  def renew_drivers_license(registrant)
    raise 'Already renewed drivers license.' if registrant.renewed_drivers_license?

    return nil unless registrant.written_test? && registrant.road_test? && services.include?('Renew License')

    registrant.renew_drivers_license
  end
end
