# What is this class doing?
# It receives no arguments when initialized
# 

class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  # add_facility takes `facility` as arg and shoves into @facilities []
  def add_facility(facility)
    @facilities << facility
  end

  # facilities_offering_service takes `service` as arg
  # Looks like this checks to see if a facility offers a specific service
  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end
end
