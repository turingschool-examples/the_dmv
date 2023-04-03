require 'json'
class Dmv
  attr_reader :facilities, :facility, :add_facility, :facility_info, :name
  attr_accessor :name, :address, :phone
  def initialize
    @facilities = []
  end

  def add_facility(gen_facility)
      @facilities << gen_facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def new_facility(state_facilities)
    state_facilities.map do |facility|
      gen_facility = Facility.new(name: facility[:title], address: JSON.parse(facility[:location_1][:human_address], phone: facility[:phone_number]))
      add_facility(gen_facility)
    end
  end
  
end
