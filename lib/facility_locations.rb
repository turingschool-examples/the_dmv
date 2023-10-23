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
      # Check for hours of facilities
      if facility.keys.select {|key| key.name.include?("hour")}.count > 1
      # Create an array of hashes
        hash_of_hours = facility.select {|key,value| key.name.include?("hour")}
        facility.map do |key,value|
          if key.name.include?("hour")
            facility.delete(key)
          end
        end
        facility[:hours] = hash_of_hours
      else
        old_hours = facility.keys.select {|key| key.name.include?("hour")|| key.name.include?("daysopen")}[0]
      end
      # Make a new hash for @hours
      if facility.has_key?(:hours) == false
        old_hours = facility.keys.select {|key| key.name.include?("hour")|| key.name.include?("daysopen")}[0]
      end
      if facility.has_key?(:address) == false
        facility[:address] = facility.delete old_address
      end
      if facility.has_key?(:name) == false
        facility[:name] = facility.delete old_name
      end
      if facility.has_key?(:phone) == false
        facility[:phone] = facility.delete old_phone  
      end
      if facility.has_key?(:hours) == false
        facility[:hours] = facility.delete old_hours 
      end
      # Add in text for closed offices
      if facility[:hours] == nil
        facility[:hours] = facility[:located_in]
      end
      require 'pry'; binding.pry if facility[:hours] == nil
      facility = Facility.new(facility)
      @facilities << facility
    end
  end

end