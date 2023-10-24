class FacilityList
    attr_reader :facilities

    def initialize
        @facilities = []
    end

    def parse_facilities(facilities)
        facilities.each do |facility_api|
            facility_ours = Facility.new(facility_api)
            facility_ours.name = facility_api[:dmv_office]
            address_1, address_2, city, state, zip = facility_api.values_at(:address_li, :address__1, :city, :state, :zip)
            facility_ours.address = "#{address_1} #{address_2} #{city} #{state} #{zip}"
            facility_ours.address.gsub(/  /, " ")
            @facilities << facility_ours
        end
    end
end