class FacilityLocations
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(dmv_data)
      dmv_data.each do |facility|

      old_name = facility.keys.select {|key| key.name.include?("name")}[0]
      if old_name == nil
        old_name = facility.keys.select {|key| key.name.include?("office")}[0]
      end
      old_address = facility.keys.select {|key| key.name.include?("address")}[0]
      old_phone = facility.keys.select {|key| key.name.include?("phone")}[0]

      if facility.has_key?(:address) == false
        facility[:address] = facility.delete old_address
      end
      if facility.has_key?(:name) == false
        facility[:name] = facility.delete old_name
      end
      if facility.has_key?(:phone) == false
        facility[:phone] = facility.delete old_phone
      else     
      end
      facility = Facility.new(facility)
      @facilities << facility
    end
  end

end