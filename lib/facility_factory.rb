class FacilityFactory

    def initialize
    end

    def create_facility(api)
        api.map do |dmv|
            facility_details = {
                name: dmv[:dmv_office],
                address: dmv[:address_li],
                phone: dmv[:phone],
                services: []
            }
            Facility.new(facility_details)
        end
    end
end