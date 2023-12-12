class FacilityFactory

    def initialize
    end

    def construct_co_facility_attr_helper(office_data)
        facility_attributes = {}

        facility_attributes[:name] = office_data[:dmv_office]
        facility_attributes[:address] = office_data[:address_li] 
        facility_attributes[:phone] = office_data[:phone]

        facility_attributes
    end

    def construct_ny_facility_attr_helper(office_data)
        facility_attributes = {}

        facility_attributes[:name] = office_data[:office_name]
        facility_attributes[:address] = office_data[:street_address_line_1]
        facility_attributes[:phone] = office_data[:public_phone_number]

        facility_attributes
    end

    def construct_mo_facility_attr_helper(office_data)
        facility_attributes = {}

        facility_attributes[:name] = office_data[:name]
        facility_attributes[:address] = office_data[:address1]
        facility_attributes[:phone] = office_data[:phone]

        facility_attributes
    end
    
    def create_facilitys(data)
        data.map do |office_data|
            if office_data[:state] == "CO"
                Facility.new(construct_co_facility_attr_helper(office_data))
            elsif office_data[:state] == "NY"
                Facility.new(construct_ny_facility_attr_helper(office_data))
            else
                Facility.new(construct_mo_facility_attr_helper(office_data))
            end
        end
    end
end