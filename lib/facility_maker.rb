class FacilityMaker
  attr_reader :add_facility, :facility, :add_facility, :facility_info, :name
  attr_accessor :name, :address, :phone, :facilities, :add_facility

  def new_facility(state_facilities)
    state_facilities.map do |state_facility|
      gen_facility = Facility.new({name: new_facility_name(state_facility), address: new_facility_address(state_facility), 
      city: state_facility[:city], state: state_facility[:state], zipcode: new_facility_zipcode(state_facility), 
      phone: new_facility_phone(state_facility)})
    end
  end

  def new_facility_name(state_facility)
    if state_facility[:website] && state_facility[:website].include?("oregon")
      state_facility[:title]
    elsif state_facility[:state] && state_facility[:state] == "NY"
      state_facility[:office_name]
    else state_facility[:state] && state_facility[:state] == "MO"
      state_facility[:name]
    end
  end

  def new_facility_address(state_facility)
    if state_facility[:website] && state_facility[:website].include?("oregon")
      JSON.parse(state_facility[:location_1][:human_address])
    elsif state_facility[:state] && state_facility[:state] == "NY"
      state_facility[:street_address_line_1]
    else state_facility[:state] && state_facility[:state] == "MO"
      state_facility[:address1]
    end
  end

  def new_facility_zipcode(state_facility)
    if state_facility[:state] && state_facility[:state] == "MO"
      state_facility[:zipcode]
    else state_facility[:state] && state_facility[:state] == "NY"
      state_facility[:zip_code]
    end
  end

  def new_facility_phone(state_facility)
    if state_facility[:website] && state_facility[:website].include?("oregon")
      state_facility[:phone_number]
    elsif state_facility[:state] && state_facility[:state] == "NY"
      state_facility[:public_phone_number]
    else state_facility[:state] && state_facility[:state] == "MO"
      state_facility[:phone]
    end
  end
end