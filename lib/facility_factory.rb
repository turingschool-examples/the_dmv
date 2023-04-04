class FacilityFactory
attr_reader :facilities

  def initialize()
    @facilities = []
  end

  def create_facilities(source)
    @facilities << source
    @facilities.flatten!(2)
    @facilities.each do |facility|
      # OR facilities
      if facility.has_key?(:location_1)
        facility[:name] = facility[:title]
        facility[:address] = facility[:location_1][:human_address]
        facility[:phone] = facility[:phone_number]   
      # MO facilities
      elsif facility.has_key?(:dorregionnumber)
        facility[:address] = "#{facility[:address1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zipcode]}"
      else
      # NY facilities:
        facility[:name] = facility[:office_name]
        facility[:address] = "#{facility[:street_address_line_1]}, #{facility[:street_address_line_2]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zip_code]}"
        facility[:phone] = facility[:public_phone_number]
      end
    end
    @facilities.each do |facility|
      if facility[:phone] == nil
        facility[:phone] = "no phone listed"
      end
    end
    @facilities.map! do |facility|
      Facility.new(facility)
    end
  end

  def create_facilities2
    @facilities.each do |facility|
      if facility[:phone] == nil
        facility[:phone] = "no phone listed"
      end
    end
    @facilities.map! do |facility|
      Facility.new(facility)
    end
  end

  def add_oregon_source(source)
    source.each do |facility|
      normalized_data = Hash.new(0)
      normalized_data[:name] = facility[:title]
      normalized_data[:address] = facility[:location_1][:human_address]
      normalized_data[:phone] = facility[:phone_number]   
      @facilities << normalized_data
    end
  end
end