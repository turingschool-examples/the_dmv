class FacilityLocations
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(dmv_data)
      dmv_data.each do |facility|
      old_name = facility.keys.select {|key| key.name.include?("name")}.join.to_sym
      old_address = facility.keys.select {|key| key.name.include?("address")}.join.to_sym
      old_phone = facility.keys.select {|key| key.name.include?("phone")}.join.to_sym
      facility[:address] = facility.delete old_address
      facility[:name] = facility.delete old_name
      facility[:phone] = facility.delete old_phone
      facility = Facility.new(facility)
      @facilities << facility
    end
  end

end