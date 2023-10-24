class FacilityFactory
  attr_reader :create_facilities

  def initialize
    @created_facility = []
  end

  def create_facilities(state_locations)
    @created_facilities = state_locations.map do |facility|
      Facility.new(
        name: facility[:dmv_office] || facility[:office_name] || facility[:name],
        address: [ facility[:address_li] || facility[:address__1] || facility[:street_address_line_1] || facility[:address1],
        facility[:city],
        facility[:state],
        facility[:zip] || facility[:zip_code] || facility[:zipcode] ].join(" "),
        phone: facility[:phone] || facility[:public_phone_number],
        services: facility[:services_p])
    end
  end
end