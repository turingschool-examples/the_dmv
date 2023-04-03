class FacilityFactory
  attr_accessor :created_facilities

  def initialize
    @created_facilities = []
  end

  def create_oregon_facility(database)
    database.map do |facility|
      @created_facilities << Facility.new({
        name: facility[:title],
        address: facility[:location_1][:human_address], 
        phone: facility[:phone_number],
        zipcode: facility[:zip_code]
      })
    end
  end

  def create_new_york_facility(database)
    database.map do |facility|
      @created_facilities << Facility.new({
        name: facility[:office_name],
        address: [facility[:street_address_line_1], facility[:city], facility[:state]],
        phone: facility[:public_phone_number],
        zipcode: facility[:zip_code]
      })
    end
  end

  def create_missouri_facility(database)
    database.map do |facility|
      @created_facilities << Facility.new({
        name: facility[:name],
        address: [facility[:address1], facility[:city], facility[:state]],
        phone: facility[:phone],
        facility: [:zipcode]
      })
    end
  end
end