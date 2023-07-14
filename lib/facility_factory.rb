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
      end
    end
    @facilities
  end
end