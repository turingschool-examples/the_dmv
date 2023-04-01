class FacilityFactory
  def initialize
    
  end

  def create_facility(or_dmv)
    new_facilities = []
    or_dmv.each do |facility|
      new_facilities << Facility.new(
        name: facility[:title],
        address: facility[:human_address],
        phone: facility[:phone_number],
      )
    end
    new_facilities 
  end
end