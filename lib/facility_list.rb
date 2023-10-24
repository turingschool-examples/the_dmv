class FacilityList
    attr_reader :facilities

    def initialize
        @facilities = []
    end

    def parse_facilities(facilities)
        facilities.each do |facility_api|
            facility_ours = Facility.new(facility_api)
            @facilities << facility_ours
        end
    end
end