class FacilityFactory

    def initialize
    end

    def create_co_facility(api)
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

    def create_ny_facility(api)
        api.map do |dmv|
            facility_details = {
                name: dmv[:office_name],
                address: dmv[:street_address_line_1],
                phone: dmv[:public_phone_number],
                services: []
            }
            Facility.new(facility_details)
        end
    end

    def create_mo_facility(api)
        api.map do |dmv|
            facility_details = {
                name: dmv[:number],
                address: dmv[:address1],
                phone: dmv[:phone],
                services: []
            }
            Facility.new(facility_details)
        end
    end
end