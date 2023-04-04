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
# helper method
  end

  # def oregon_


  def ny_transform(original_dataset)
    original_dataset.each do |original_datum|
      facility_details = {
        name: original_datum[:office_name],
        address: original_datum[:street_address_line_1],
        phone: original_datum[:public_phone_number]
      }
    # create_facility(facility_details)


      # original_datum[:name] = original_datum[:office_name]
      # original_datum[:address] = original_datum[:street_address_line_1]
      # original_datum[:phone] = original_datum[:public_phone_number]

    end
  end

  def mo_transform(original_dataset)
    original_dataset.find_all do |original_datum|
      original_datum[:name] = original_datum[:name]
      original_datum[:address] = original_datum[:address1]
      original_datum[:phone] = original_datum[:phone]
    end
  end
  


    # human_address = or_dmv_office_locations[1][:location_1][:human_address]
    # human_address.delete("{").delete("}")
    # human_address.join("")
    # human_address.delete("address").delete("city").delete("state").delete("zip")
    # human_address 
  

  # def rename_vehicles(vehicle_list)
  #   vehicle_list.find_all do |vehicle_data|
  #     vehicle_data[:vin] = vehicle_data.delete :dol_vehicle_id
  #     vehicle_data[:year] = vehicle_data.delete :model_year
  #     vehicle_data[:engine] = :ev
  #   end
  # end


#   or_dmv_office_locations[1][:location_1][:human_address]
#   {name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' }


  
end