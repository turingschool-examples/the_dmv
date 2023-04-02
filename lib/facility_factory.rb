class FacilityFactory

  def create_facilities(facilities)
    until facilities.empty?
      facilities.map do |facility|
        require 'pry'; binding.pry
        new_facility = Facility.new(facility)
        new_facility.name = facility[:title]
      end
    end
  end
end