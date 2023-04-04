class FacilityFactory
  #attr_reader: 

  # def initialize(facility)
    # @create_or_facility = create_or_facility 
    
  # end

  def create_or_facility(facility)
    facility = facility.slice(:title, :phone_number)
    facility[:name] = facility.delete(:title)
    facility[:address] = facility.delete(:human_address)
    facility[:phone] = facility.delete(:phone_number)
    Facility.new(facility)
  end

  def create_ny_facility(facility)
    facility.slice(:office_name, :str)
  end
end