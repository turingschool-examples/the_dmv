class FacilityList
    attr_reader :facilities

    def initialize
        @facilities = []
    end

    def parse_facilities(facilities)
        facilities.each do |facility_api|
            facility_ours = Facility.new(facility_api)

            if facility_api[:state] == "CO"
                facility_ours.name = facility_api[:dmv_office]
                address_1, address_2, city, state, zip = facility_api.values_at(:address_li, :address__1, :city, :state, :zip)
                facility_ours.address = "#{address_1} #{address_2} #{city} #{state} #{zip}"
                facility_ours.address.gsub(/  /, " ")

            elsif facility_api[:state] == "NY"
                facility_ours.name = facility_api[:office_name]
                address_1, city, state, zip = facility_api.values_at(:street_address_line_1, :city, :state, :zip_code)
                facility_ours.address = "#{address_1} #{city} #{state} #{zip}"
                facility_ours.address.gsub(/  /, " ")
                facility_ours.phone = facility_api[:public_phone_number]


            elsif facility_api[:state] == "MO"
                address_1, city, state, zip = facility_api.values_at(:address1, :city, :state, :zipcode)
                facility_ours.address = "#{address_1} #{city} #{state} #{zip}"
                facility_ours.address.gsub(/  /, " ")

            end
            @facilities << facility_ours
        end
    end
end