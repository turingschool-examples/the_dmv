class FacilityFactory
              
  def initialize
  end

  def create_facility(facility_list)
    facility_list.map do |facility_data|
      Facility.new(facility_data)
    end
  end

  def oregon_transform(original_dataset)
    original_dataset.each do |original_facility|
      original_facility[:name] = original_facility[:title]
      original_facility[:address] = original_facility[:location_1][:human_address] 
      original_facility[:phone] = original_facility[:phone_number]
    end
  end

  def ny_transform(original_dataset)
    original_dataset.each do |original_facility|
      original_facility[:name] = original_facility[:office_name]
      original_facility[:address] = original_facility[:street_address_line_1] +" "+ original_facility[:city] +" "+ original_facility[:state] +" "+ original_facility[:zip_code]
      original_facility[:phone] = original_facility[:public_phone_number]
    end
  end

  def mo_transform(original_dataset)
    original_dataset.each do |original_facility|
      original_facility[:name] = original_facility[:name]
      original_facility[:address] = original_facility[:address1]
      original_facility[:phone] = original_facility[:phone]
    end
  end
end