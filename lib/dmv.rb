require "./spec/spec_helper"

# Dmv class is a container for facilities objects. It initializes with
# the @facilities attribute as an empty array, and Facility objects
# are added using the add_facility method. You can check the facilities
# offering a given service using the dmv.facilities_offering_service(service)
# method.
# Syntax:
#
# dmv = Dmv.new
#
# Methods:
#
# dmv.add_facility(Facility.new)
# dmv.facilities_offering_service("Example service")
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
end
