class FacilityFactory
  attr_accessor :created_facilities

  def initialize
    @created_facilities = []
  end

  oregon_facilites = DmvDataService.new.or_dmv_office_locations
  new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  missouri_facilities = DmvDataService.new.mo_dmv_office_locations

  def create_oregon_facility(database)
    database.map do |facility|
      @created_facilities << Facility.new({
        name: facility[:title],
        address: JSON.parse(facility.dig(:location_1, :human_)).values.join(' '),
        phone: facility[:phone_number]
      })
    end
  end

  def create_new_york_facility(database)
    database.map do |facility|
      @created_facilities << Facility.new({
        name: facility[:office_name],
        address: facility.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(' '),
        phone: facility[:public_phone_number]
      })
    end
  end

  def create_missouri_facility(database)
    database.map do |facility|
      @created_facilities << Facility.new({
        name: facility[:name],
        address: facility.fetch_values(:address1, :city, :state, :zipcode).join(' '),
        phone: facility[:phone]
      })
    end
  end
end