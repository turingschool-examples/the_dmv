class FacilityFactory
  def initialize
    
  end

  def create_facility(dmv)
    new_facilities = []
    dmv.each do |facility|
      new_facilities << Facility.new(
        name: facility[:title],
        address: facility[:human_address],
        phone: facility[:phone_number],
        zipcode: facility[:zip_code]
      )
    end
    new_facilities 
  end
end