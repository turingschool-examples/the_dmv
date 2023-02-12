class FacilityBuilder

attr_reader :state_facility_list

  def create_facilities(facility_data)
    @state_facility_list = []
    for i in 0..facility_data.count - 1
      current_hash = facility_data[i]
      facility_hash = {name: current_hash[:title]}
      @state_facility_list << facility_hash
    end
    @state_facility_list
  end
end
#                  address: facility_data[]
#                  phone: facility_data[]}