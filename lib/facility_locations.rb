class FacilityLocations
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(dmv_data)
      dmv_data.each do |facility| 
      old_name = facility.keys.select {|key| key.name.include?("name") || key.name.include?("office")}[0]
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
        facility[:hours] = facility.delete old_hours 
      end
      # Add in text for closed offices
      notice = nil
      if facility[:hours] == nil
        facility.select do |key, value|
          if value != nil && (value.include?("CLOSED UNTIL") || value.include?("closed until"))
          notice = value
          end
        end
        facility[:hours] = notice
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
      require 'pry'; binding.pry if facility[:hours] == nil
      holidays_closed(dmv_data)
      facility = Facility.new(facility)
      @facilities << facility
    end
  end

  def holidays_closed(dmv_data)
    dmv_data.each do |facility| 
      old_holidaysclosed = facility.keys.select {|key| key.name.include?("holidaysclosed")}[0] 
      # require 'pry'; binding.pry if facility.values.include?("117A NORTH MAIN",) || facility.values.include?("101 WEST 3RD STREET") || facility.values.include?("222")
      if facility.has_key?(:holidays_closed) == false
      facility[:holidays_closed] = facility.delete old_holidaysclosed
      end
      # require 'pry'; binding.pry if facility.keys.include?(:daysopen) && facility[:holidays_closed] == nil
    end
  end
end