require "./spec/spec_helper"

# Documentation for class Dmv
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
      facility if facility.services.include?(service)
    end
  end
end
