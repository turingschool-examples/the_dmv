class FacilityFactory

  attr_reader :facility_list
    def initialize
      @facility_list = []
    end

    def create_facilities(facilities)
      facilities.each do |facility|
      facility_list << Facility.new({name: facility[:title] || facility[:office_name] || facility[:name], 
                      address: facility[:street_address_line_1] || facility[:address1] || facility[:location_1][:human_address], 
                      phone: facility[:phone_number] || facility [:public_phone_number] || facility[:phone]})
      end
    end
end