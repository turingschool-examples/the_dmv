class Dmv
attr_reader :facilities
  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end
# changed .find to .select to find all facilities matching service offers
  def facilities_offering_service(service)
    @facilities.select do |facility|
      facility.services.include?(service)
    end
  end
end
