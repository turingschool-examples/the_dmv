class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities.append(facility)
  end

  def facilities_offering_service(service)
    @facilities.find do |facility|
      facility.services.include?(service)
    end
  end
end
