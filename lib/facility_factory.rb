class FacilityFactory

    def initialize
    end
    
    def create_facilitys(data)
        data.map do |office_data|
            facility_attributes = {}
            facility_attributes[:name] = office_data[:dmv_office] || office_data[:office_name]
            facility_attributes[:address] = office_data[:address_li] || office_data[:street_address_line_1]
            facility_attributes[:phone] = office_data[:phone] || office_data[:public_phone_number]

            Facility.new(facility_attributes)
        end

    end
end