class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facilities(dmv_locations)
    dmv_locations.each do |location|
       @facilities.push(Facility.new(location))
    end
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end
end
