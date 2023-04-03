class FacilityFactory

  attr_reader #:facility_list
    def initialize
      # @facility_list = []
    end

    def create_facilities(facilities)
      facility_list = facilities.map do |facility|
        Facility.new({name: facility[:title] || facility[:agenc] || facility[:type], 
                      address: facility[:human_address], 
                      phone: facility[:phone_number]
                    })
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