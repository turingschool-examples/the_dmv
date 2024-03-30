class FacilityFactory

    def create_facilities(facility_data)
        facility_data.map do |facility|
            facility_details = {
                name: facility[:dmv_office],
                address: format_co_address(facility[:address_li], facility[:address__1], 
                facility[:city], facility[:state], facility[:zip]),
                phone: facility[:phone]
            }
            Facility.new(facility_details)
        end
    end

    def format_co_address(address_1, address_2, city, state, zip)
        "#{address_1} #{address_2} #{city} #{state} #{zip}"
    end
end