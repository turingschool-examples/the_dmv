class FacilityFactory

  def initialize
  end

  def create_facility(dmv_info)
    if dmv_info == @co_dmv_office_locations
      dmv_info.map do |dmv_info|
        facility_info = {}
        facility_info[:name] = dmv_info[:dmv_office]
        facility_info[:address] = dmv_info[:address_li]
        facility_info[:phone] = dmv_info[:phone]
        facility_info[:services] = dmv_info[:services_p]
        facility_info[:registered_vehicles] = dmv_info[] if dmv_info[nil]
        facility_info[:collected_fees] = dmv_info[] if dmv_info[nil]
        Facility.new(facility_info)
      end 

    elsif dmv_info == @ny_dmv_office_locations
      dmv_info.map do |dmv_info|
        facility_info = {}
        facility_info[:name] = dmv_info[:office_name]
        facility_info[:address] = dmv_info[[:street_address_line1, :city, :state, :zip_code]]
        facility_info[:phone] = dmv_info[:public_phone_number]
        facility_info[:services] = dmv_info[] if dmv_info[nil]
        facility_info[:registered_vehicles] = dmv_info[] if dmv_info[nil]
        facility_info[:collected_fees] = dmv_info[] if dmv_info[nil]
        Facility.new(facility_info)
      end

    else dmv_info == @mo_dmv_office_locations
      dmv_info.map do |dmv_info|
        facility_info = {}
        facility_info[:name] = dmv_info[:name]
        facility_info[:address] = dmv_info[[:address1,:city, :state, :zipcode]]
        facility_info[:phone] = dmv_info[:phone]
        facility_info[:services] = dmv_info[] if dmv_info[nil]
        facility_info[:registered_vehicles] = dmv_info[] if dmv_info[nil]
        facility_info[:collected_fees] = dmv_info[] if dmv_info[nil]
        Facility.new(facility_info)
      end
    end
  end
end