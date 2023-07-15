class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(database)
    # @name = facility_details[:name]
    # @address = facility_details[:address]
    # @phone = facility_details[:phone]

    database.each do |facility|
      if facility[:state] == "CO"
        @facilities << @facility = Facility.new({
          name: facility[:dmv_office],
          address: facility[:address_li],
          phone: facility[:phone]
        })
      elsif facility[:state] == "NY"
        @facilities << @facility = Facility.new({
          name: facility[:office_name],
          address: facility[:street_address_line_1],
          phone: facility[:public_phone_number]
        })
      end
    end
    @facilities
  end
end