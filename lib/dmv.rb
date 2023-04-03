class Dmv
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    facilities_including = []
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end
end
