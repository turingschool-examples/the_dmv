class FacilityFactory
  attr_reader :locations

  def initialize
    @locations = []
  end

  def facility_creator(dmv)
    if dmv == DmvDataService.new.or_dmv_office_locations
      create_oregon_facility(dmv)
    elsif dmv == DmvDataService.new.ny_dmv_office_locations
      create_new_york_facility(dmv)
    elsif dmv == DmvDataService.new.mo_dmv_office_locations
      create_missouri_facility(dmv)
    end
    @locations
  end

  def create_oregon_facility(dmv_info)
      dmv_info.each do |info|
        address = JSON.parse(info[:location_1][:human_address])
        address = address.values.join(" ")
        or_dmv = {}
        or_dmv[:name] = info[:title] 
        or_dmv[:phone] = info[:phone_number] 
        or_dmv[:address] = address
        @locations << Facility.new(or_dmv)
      end
  end

  def create_new_york_facility(dmv_info)
      dmv_info.each do |info|
        ny_dmv = {}
        ny_dmv[:name] = info[:office_name]
        ny_dmv[:phone] = info[:public_phone_number] 
        ny_dmv[:address] = "#{info[:street_address_line_1]}, #{info[:city]}, #{info[:state]}, #{info[:zip_code]}"
        @locations << Facility.new(ny_dmv)
      end
  end

  def create_missouri_facility(dmv_info)
      dmv_info.each do |info|
        mo_dmv = {}
        mo_dmv[:name] = info[:name]
        mo_dmv[:phone] = info[:phone] 
        mo_dmv[:address] = "#{info[:address1]}, #{info[:city]}, #{info[:state]}, #{info[:zipcode]}"
        @locations << Facility.new(mo_dmv)
      end
  end
end


