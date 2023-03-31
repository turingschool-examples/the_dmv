class FacilityCreator
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def create_facilities(json)
    json.each do |facility|
      hash = facility[:"location_1"]
      long_address = hash[:human_address]
      hash_address = JSON.load( long_address.gsub(/(?<=\")=>/, ":") )
      address = "#{hash_address["address"]} #{hash_address["city"]} #{hash_address["state"]} #{hash_address["zip"]}"

      new_facility = Facility.new({name: facility[:"title"], address: address, phone: facility[:"phone_number"]})
      @facilities << new_facility
    end
  end
end