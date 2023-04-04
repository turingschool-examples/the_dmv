class FacilityFactory
              
  def initialize
  end

  def create_facility(facility_list)
    facility_list.map do |facility_data|
      Facility.new(facility_data)
    end
  end

  def oregon_transform(original_dataset)
    original_dataset.find_all do |original_datum|
      original_datum[:name] = original_datum[:title]
      original_datum[:address] = original_datum[:location_1][:human_address] 
      original_datum[:phone] = original_datum[:phone_number]
    end
  end
  
  def ny_transform(original_dataset)
    original_dataset.each do |original_datum|
      original_datum[:name] = original_datum[:office_name]
      original_datum[:address] = original_datum[:street_address_line_1]
      original_datum[:phone] = original_datum[:public_phone_number]
    end
  end

  def mo_transform(original_dataset)
    original_dataset.each do |original_datum|
      original_datum[:name] = original_datum[:name]
      original_datum[:address] = original_datum[:address1]
      original_datum[:phone] = original_datum[:phone]
    end
  end
end