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
    or_dmv = DmvDataService.new.or_dmv_office_locations
    ny_dmv = DmvDataService.new.ny_dmv_office_locations
    mo_dmv = DmvDataService.new.mo_dmv_office_locations
    if state_facilities == or_dmv
      state_facilities.map do |facility|
        gen_facility = Facility.new({name: facility[:title], address: JSON.parse(facility[:location_1][:human_address]), phone: facility[:phone_number]}) 
        add_facility(gen_facility)
      end
    elsif state_facilities == ny_dmv
      state_facilities.map do |facility|
        gen_facility = Facility.new({name: facility[:office_name], address: facility[:street_address_line_1], city: facility[:city], state: facility[:state], zipcode: facility[:zipcode], phone: facility[:public_phone_number]})
        add_facility(gen_facility)
      end
    elsif state_facilities == mo_dmv
      state_facilities.map do |facility|
        gen_facility = Facility.new({name: facility[:number], address: facility[:address1], city: facility[:city], state: facility[:state], zipcode: facility[:zipcode], phone: facility[:phone]})
        add_facility(gen_facility)
      end
    end
  end
end
