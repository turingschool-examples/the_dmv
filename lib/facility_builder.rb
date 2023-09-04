class FacilityBuilder
  attr_reader :facility_list
              :facility_details
  def build_facility_helper(data)
    @facility_list = data.map do |facility|
      facility = facility.slice(:dmv_office, :address_li, :address_1, :city, :state, :zip, :phone)
      full_address = []
      filter = [:address_li, :address__1, :city, :state, :zip]
      @facility_details = facility.map do |key, value|
        if key == :dmv_office
          key = :name, value = value
        elsif filter.include?(key)
          full_address << value
          key = :address, value = full_address.join(' ')
        else 
          key = key, value = value
        end
      end.to_h
    end
    @facility_list
  end
end