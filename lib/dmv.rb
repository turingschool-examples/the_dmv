class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    results = @facilities.find_all do |facility|
      facility.services.include?(service)
    end
    results.empty? ? 'No facility found.' : results
  end
end
