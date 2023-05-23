class Dmv
  attr_reader :facilities

  # Initializes DMW with an empty array of facilities
  def initialize
    @facilities = []
  end

  # Adds a facility to the array of facilities
  def add_facility(facility)
    @facilities << facility
  end

  # Returns an array of facilities that offer the given service
  def facilities_offering_service(service)
    @facilities.select do |facility|
      facility.services.include?(service)
    end
  end
end
