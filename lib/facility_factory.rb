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
      original_datum[:name] = original_datum.delete :title
      original_datum[:address] = original_datum.delete :location_1 
      original_datum[:phone] = original_datum.delete :phone_number
    end
  end

  # def oregon_transform_2(new_dataset)
  #   new_dataset.find_all do |new_datum|
  #     new_datum[:address] = new_datum.delete :human_address
  #   end
  # end

  def ny_transform(original_dataset)
    original_dataset.find_all do |original_datum|
      original_datum[:name] = original_datum.delete :office_name
      original_datum[:address] = original_datum.delete :street_address_line_1
      original_datum[:phone] = original_datum.delete :public_phone_number
    end
  end

  def mo_transform(original_dataset)
    original_dataset.find_all do |original_datum|
      original_datum[:name] = original_datum.delete :name
      original_datum[:address] = original_datum.delete :address1
      original_datum[:phone] = original_datum.delete :phone
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