class FacilityFactory

  attr_reader :facility_list
    def initialize
      @facility_list = []
    end

    def create_facilities(facilities)
      facilities.map do |facility|
      @facility_list << Facility.new({name: facility[:title] || facility[:office_name], 
                      address: facility[:website] || facility[:street_address_line_1] || facility[:address1], 
                      phone: facility[:phone_number] || facility [:public_phone_number] || facility[:phone]})
      end
    end
end
              


      # facilities.each do |facility|
      #   @facility_list << Facility.new({name: facility[:title] || facility[:agenc] || facility[:type], 
      #                                 address: facility[:human_address], 
      #                                 phone: facility[:phone_number]})
#       end
#     end
# end