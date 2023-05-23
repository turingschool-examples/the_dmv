class FacilityFactory

  def initialize
    
  end

  def create_facility(dmv_info)
    dmv_info.map do |info|
      Facility.new({name: info[:title], phone:    info[:phone_number], address: info[:location_1][:human_address]})
    end
  end
end