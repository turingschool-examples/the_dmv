class FacilityFactory
              
  def initialize
  end

  def create_facility(facility_list)
    facility_list.map do |facility_data|
      Facility.new(facility_data)
    end
  end
end