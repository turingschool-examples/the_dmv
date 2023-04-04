require 'json'
class Dmv
  attr_reader :facilities, :facility, :add_facility, :facility_info, :name
  attr_accessor :name, :address, :phone, :add_facility, :facilities, :new_facility
  def initialize(facilities = [])
    @facilities = facilities
  end

  def add_facility(gen_facility)
      @facilities << gen_facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end
end
