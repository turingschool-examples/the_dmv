class FacilityFactory
  def initialize
  end

  def create_facility(api)
    api.map do |facility|
      Facility.new({
        name: facility[:title],
        address: facility[:location_1][:human_address],
        phone: facility[:phone_number] 
      })
    end
  end

  def format_name(facility)
    if facility[:state] && facility[:state] == "MO"
      facility[:name].rstrip
    elsif facility[:state] && facility[:state] == "NY"
      facility[:office_name]
    else facility[:website] && facility[:website].include?('oregon')
      facility[:title]
    end

  end

  def format_address(facility)
    if facility[:state] && facility[:state] == "MO"
      facility[:name].rstrip
    elsif facility[:state] && facility[:state] == "NY"
      facility[:office_name]
    else facility[:website] && facility[:website].include?('oregon')
      require 'pry'; binding.pry
      address = JSON.parse(facility[:location_1][:human_address], symbolize_names: true)
    end
  end
  
end