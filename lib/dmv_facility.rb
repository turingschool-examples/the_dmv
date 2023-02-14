class DmvFacility
    attr_reader :location,
                :facility_instances

    def initialize
        @location = []
        @facility_instances = []
    end

    def create_facilities(all_locations)
        office_locations.map do |location| 
            if location.has_key?(:state) && location[:state] == ""
            @location << location
            end
        end
    end

    def create_facilities_or(facility_database)
        facility_database.each do |facility|
            facility.JSON.parse(facility_database)
            facility_instances.push(Facility.new({name: facility[:title], address: facility[:location_1][:human_address], phone: facility[:phone_number]}))
        end
        facility_instances
    end
end