class FacilityFactory

  attr_reader :facility_list
    def initialize
      @facility_list = []
    end

    def create_facilities(facilities)
      facilities.each do |facility|
        @facility_list << Facility.new(facility)
        pry
      end
    end


end