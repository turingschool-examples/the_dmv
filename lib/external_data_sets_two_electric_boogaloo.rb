class FacilityObjects
  def initialize
    @facilities_list = []
  end
  
  def create_facilities(api_data)
    api_data.each do |facility_data|
      fac_data = dmv_state_check(facility_data)
      facility = Facility.new(fac_data)
      @facilities_list << facility
    end
    @facilities_list
  end

  def dmv_state_check(api_data)
    if api_data[:state] == "CO"
      dmv_co_state_nomenclature(api_data)
    elsif api_data[:state] == "NY"
      dmv_ny_state_nomenclature(api_data)
    else
      dmv_mo_state_nomenclature(api_data)
    end
  end

  def dmv_co_state_nomenclature(api_data)
    fac_data = {
      name: api_data[:dmv_office],
      address: "#{api_data[:address_li]}, #{api_data[:address__1]}",
      phone: api_data[:phone]
      }
  end

  def dmv_ny_state_nomenclature(api_data)
    fac_data = {
      name: api_data[:office_name],
      address: api_data[:street_address_line_1],
      phone: api_data[:public_phone_number]
      }
  end

  def dmv_mo_state_nomenclature(api_data)
    fac_data = {
      name: api_data[:name],
      address: api_data[:address1],
      phone: api_data[:phone]
      }
  end
  #require 'pry';binding.pry
end