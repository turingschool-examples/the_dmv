class FacilityObjects
  def initialize
    @facilities_list = []
  end
  
  def create_facilities(api_data)
    api_data.each do |facility_data|
      fac_data = {
      name: facility_data[:dmv_office],
      address: "#{facility_data[:address_li]}, #{facility_data[:address__1]}",
      phone: facility_data[:phone]
      #services: facility_data[:services_p], 
      }
      facility = Facility.new(fac_data)
      @facilities_list << facility
    end
    @facilities_list
  end

  def dmv_state_check
  end

  def dmv_co_state_nomenclature
  end

  def dmv_ny_state_nomenclature
  end

  def dmv_mo_state_nomenclature
  end
  
  #require 'pry';binding.pry
  
  end