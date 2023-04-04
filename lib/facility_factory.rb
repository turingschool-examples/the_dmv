class FacilityFactory
  #attr_reader: 

  # def initialize(facility)
    # @create_or_facility = create_or_facility 
    
  # end

  def create_or_facility(facility)
    facility = facility.slice(:title,: human_address, :phone_number)
    facility[:name] = facility.delete(:title)
    # facility[:address] = facility.delete(:human_address)
    facility[:phone] = facility.delete(:phone_number)
    Facility.new(facility)
  end

  def create_ny_facility(facility)
    facility.slice(:office_name,:street_address_line_1, :public_phone_number)
    facility[:name] =facility.delete(:office_name)
    facility[:address] = facility.delete(:street_address_line_1)
    facility[:phone] = facility.delete(:public_phone_number)
  end
  
  def create_mo_facility(facility)
    facility.slice(:name, :address1, :phone)
    facility[:address] = facility.delete(:address1)
  end
end