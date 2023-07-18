class FacilityFactory
    attr_accessor :facility_list

    def initialize
        @facility_list = []
    end

    def create_facilities(locations)
        locations.each do |facility|
          details = {
            @name = facility[:dmv_office]
            @address = `#{facility[:address_li]}, #{facility[:address__1]}, #{facility[:city]}, #{facility[:state]} #{facility[:zip]}`
            @phone = facility[:phone]
          }
          @facility_list << Facility.new(details)
        end
    end
end