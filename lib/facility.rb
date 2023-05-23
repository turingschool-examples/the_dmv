# Helper module to title case strings.
module Helper
  def self.title_case(input_string)
    words = input_string.split
    title_words = words.map do |word|
      if exempt_words.include?(word.upcase)
        word.upcase
      else
        word.capitalize
      end
    end
    title_words.join(' ')
  end

  def self.exempt_words
    %w[DMV NY MD OR SE NE NW SW]
  end
end

class Facility
  attr_reader :name,
              :address,
              :phone,
              :website,
              :services,
              :registered_vehicles,
              :collected_fees

  # Initializes a facility
  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @website = data[:website]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  # Determines which state the facility is in and calls the appropriate method
  def self.create_facility(state, facility_data)
    case state
    when 'OR' # Oregon
      create_facility_from_oregon(facility_data)
    when 'NY' # New York
      create_facility_from_new_york(facility_data)
    when 'MO' # Missouri
      create_facility_from_missouri(facility_data)
    else
      # Returns an error if the state is not supported
      raise "Unsupported state: #{state}"
    end
  end

  # Creates a facility if the first argument in Facility.create_facility is 'OR'
  def self.create_facility_from_oregon(facility_data)
    facility_data.map do |data|
      name = Helper.title_case(data[:title])
      address_json = JSON.parse(data[:location_1][:human_address])
      street = Helper.title_case(address_json['address'])
      city = Helper.title_case(address_json['city'])
      state = address_json['state']
      zip_code = address_json['zip']
      phone = data[:phone_number]
      website = data[:website]

      address = "#{street}, #{city}, #{state}, #{zip_code}" # Concatenate address components

      Facility.new(name: name, address: address, phone: phone, website: website)
    end
  end

  # Creates a facility if the first argument in Facility.create_facility is 'NY'
  def self.create_facility_from_new_york(facility_data)
    facility_data.map do |data|
      name = Helper.title_case(data[:office_name])
      street = Helper.title_case(data[:street_address_line_1])
      city = Helper.title_case(data[:city])
      state = data[:state]
      zip_code = data[:zip_code]
      phone = data[:public_phone_number]
      # New York does not provide a website for each facility.
      # Spoke with Kat who said this was fine. Could also be left as nil.
      website = 'undefined'
      address = "#{street}, #{city}, #{state}, #{zip_code}" # Concatenate address components

      Facility.new(name: name, address: address, phone: phone, website: website)
    end
  end

  # Creates a facility if the first argument in Facility.create_facility is 'MO'
  def self.create_facility_from_missouri(facility_data)
    facility_data.map do |data|
      name = Helper.title_case(data[:name])
      street = Helper.title_case(data[:address1])
      city = Helper.title_case(data[:city])
      state = data[:state]
      zip_code = data[:zipcode]
      phone = data[:phone]
      website = data[:facebook_url]
      address = "#{street}, #{city}, #{state}, #{zip_code}" # Concatenate address components

      Facility.new(name: name, address: address, phone: phone, website: website)
    end
  end

  # Adds a service to the facility
  def add_service(service)
    @services << service
  end

  # Registers a vehicle if the facility offers the service
  # and the vehicle is not already registered
  def register_vehicle(vehicle)
    raise 'Vehicle already registered.' if @registered_vehicles.include?(vehicle)

    return nil unless @services.include?('Vehicle Registration')

    vehicle.registration_date = Date.today
    vehicle.determine_plate_type
    @registered_vehicles << vehicle
    calculate_collected_fees(vehicle)
    @registered_vehicles
  end

  # Calculates the fees collected for a vehicle registration
  def calculate_collected_fees(vehicle)
    plate_type_fees = {
      ev: 200,
      antique: 25
    }

    @collected_fees += plate_type_fees[vehicle.plate_type] || 100
  end

  # Registers a registrant if the facility offers the service and the registrant doesn't already
  # have a permit.
  def earn_permit(registrant)
    raise 'Already has permit.' if registrant.permit?

    return nil unless registrant.age > 15

    registrant.earn_permit
  end

  # Administers a written test if the facility offers the service,
  # if the registrant has a permit, if the registrant is over 15,
  # and has not already taken a written test.
  def administer_written_test(registrant)
    raise 'Already took written test.' if registrant.written_test?

    return nil unless registrant.permit? && registrant.age > 15 && @services.include?('Written Test')

    registrant.administer_written_test
  end

  # Administers a road test if the facility offers the service,
  # if the registrant took the written test,
  # and if the registrant has not already taken a road test.
  def administer_road_test(registrant)
    raise 'Already took road test and has license.' if registrant.road_test?

    return nil unless registrant.written_test? && @services.include?('Road Test')

    registrant.administer_road_test
  end

  # Renews a drivers license if the facility offers the service,
  # if the registrant has taken the written test and road test,
  # and if the registrant has not already renewed their license.
  def renew_drivers_license(registrant)
    raise 'Already renewed drivers license.' if registrant.renewed_drivers_license?

    return nil unless registrant.written_test? && registrant.road_test? && services.include?('Renew License')

    registrant.renew_drivers_license
  end
end
