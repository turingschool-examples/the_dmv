class FacilityFactory

    def create_facilities(facility_data)
        facility_data.map do |facility|
            facility_details = {
                name: facility[:dmv_office],
                address: facility[:address_li],
                phone: facility[:phone]
            }
            Facility.new(facility_details)
        end
    end
end