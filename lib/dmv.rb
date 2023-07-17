class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  # def top_make
  #   registered_vehicles = []
  #   registered_vehicles << @facilities.map do |facility|
  #     facility.registered_vehicles
  #   end

  #   makes = []
  #   makes << registered_vehicles.map do |vehicle|
  #     vehicle.make
  #   end
  # end
end
