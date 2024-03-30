class FacilityFactory

    def initialize
    end

    def create_factory(facilities)
        facilities.map do |facility|
            Facility.new(facility)
        end
    end
end
