class FacilityFactory
attr_reader :facilities

  def initialize()
    @facilities = []
  end

  def create_facilities
    @facilities.map! do |facility|
      Facility.new(facility)
    end
  end

  def add_oregon_source(source)
    source.each do |facility|
      normalized_data = Hash.new
      normalized_data[:name] = facility[:title]
      normalized_data[:address] = facility[:location_1][:human_address]
      normalized_data[:phone] = facility[:phone_number]   
      @facilities << normalized_data
    end
  end

  def add_mo_source(source)
    source.each do |facility|
      normalized_data = Hash.new
      normalized_data[:name] = facility[:name]
      normalized_data[:address] = "#{facility[:address1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zipcode]}"
      normalized_data[:phone] = facility[:phone]
      @facilities << normalized_data
    end
  end

  def add_ny_source(source)
    source.each do |facility|
      normalized_data = Hash.new
      normalized_data[:name] = facility[:office_name]
      normalized_data[:address] = "#{facility[:street_address_line_1]}, #{facility[:street_address_line_2]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zip_code]}"
      normalized_data[:phone] = facility[:public_phone_number]
      if normalized_data[:phone] == nil
        normalized_data[:phone] = "no phone number listed"
      end
      @facilities << normalized_data
    end
  end
end