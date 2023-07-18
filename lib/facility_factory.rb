class FacilityFactory
  def initialize
  end

  def create_factory(office_locations)
    office_locations.map do |office_data|
      Facility.new({
        name: office_data[:dmv_office] || office_data[:office_name] || office_data[:name],
        address: {
          street_add: office_data[:address_li] || office_data[:street_address_line_1] || office_data[:address1], 
          add_line_2: office_data[:address__1], 
          city: office_data[:city],
          state: office_data[:state],
          zip: office_data[:zip] || office_data[:zip_code] || office_data[:zipcode]
        },
        phone: office_data[:phone] || office_data [:public_phone_number]
        },
        office_data[:services_p] || []
        )
    end
  end
end

