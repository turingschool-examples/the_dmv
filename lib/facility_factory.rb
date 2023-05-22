class FacilityFactory
    def initialize
        #
    end

    def create_facilities(facility_list)
        output = []
        facility_list.each do |facility|
            output << Facility.new({
                vin: facility[:vin_1_10], 
                year: facility[:model_year], 
                make: facility[:make], 
                model: facility[:model], 
                engine: :ev
                })
        end
        output
    end
end