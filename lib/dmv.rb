class Dmv
  #call facilities
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end
  #use .select to select all elements of condition
  def facilities_offering_service(service)
    @facilities.select do |facility|
      facility.services.include?(service)
    end
  end
end
