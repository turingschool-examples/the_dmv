class FacilityFactory

    def initialize
    end

    def create_facilities(facilities)
        facilities.map do |facility|
            Facility.new(facility)
        end
    end
end
