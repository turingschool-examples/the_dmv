class FacilityFactory
  attr_accessor :facility_instances

  def initialize
    @facility_instances = []
  end

  def create_facilities(facilities_data)
    @facility_instances = facilities_data.map do |facility|
      Facility.new(
        name: facility[:dmv_office] || facility[:office_name] || facility[:name],
        address: facility[:address_li] || facility[:street_address_line_1] || facility[:address1],
        phone: facility[:phone] || facility[:public_phone_number] || facility[:phone]
      )
    end
  end
end