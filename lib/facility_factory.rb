class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(database)
    database.each do |facility|
      if facility[:state] == "CO"
        @facilities << Facility.new({
          name: facility[:dmv_office],
          address: facility[:address_li],
          phone: facility[:phone]
        })
      elsif facility[:state] == "NY"
        @facilities << Facility.new({
          name: facility[:office_name],
          address: facility[:street_address_line_1],
          phone: facility[:public_phone_number]
        })
      elsif facility[:state] == "MO"
        @facilities << Facility.new({
          name: facility[:name],
          address: facility[:address1],
          phone: facility[:phone]
        })
      end
    end
    @facilities
  end
end