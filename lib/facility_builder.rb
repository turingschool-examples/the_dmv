require 'json'

class FacilityBuilder

attr_reader :state_facility_list

  def create_facilities(facility_data)
    @state_facility_list = []
    for i in 0..facility_data.count - 1
      current_hash = facility_data[i]
      facility_hash = {name: current_hash[:title],
                       address: or_address_cleaner(current_hash[:location_1][:human_address]),
                       phone: current_hash[:phone_number]}
      @state_facility_list << facility_hash
    end
    @state_facility_list
  end

  def or_address_cleaner(ugly_address)
    JSON.parse(ugly_address)["address"]
  end
end