class FacilityFactory

    def initialize
    end
    
    def create_facilitys(data)
        data.map do |office_data|
            # require 'pry' ; binding.pry
            facility_attributes = {}
            facility_attributes[:name] = office_data[:dmv_office]
            facility_attributes[:address] = office_data[:address_li]
            facility_attributes[:phone] = office_data[:phone]

            Facility.new(facility_attributes)
        end

    end
end