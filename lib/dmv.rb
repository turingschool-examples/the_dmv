class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facilities(dmv_locations)
    dmv_locations.each do |location|
      facility_hold = {
        name: format_name(location),
        address: format_address(location),
        phone: format_phone(location)
      }
      @facilities.push(Facility.new(facility_hold))
    end
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def format_name(facility_hash)
    if facility_hash[:name]
      formated_name = facility_hash[:name].split.map{|word| word.capitalize}.join(" ").tr("Dmv", "DMV")
    elsif facility_hash[:title]
      formated_name = facility_hash[:title].split.map{|word| word.capitalize}.join(" ").tr("Dmv", "DMV")
    elsif facility_hash[:office_name]
      formated_name = facility_hash[:office_name].split.map{|word| word.capitalize}.join(" ")
    end
  end

  def format_address(facility_hash)
    if facility_hash[:address]
      facility_hash[:address]
    elsif facility_hash[:location_1]
      new_hash = JSON.parse(facility_hash[:location_1][:human_address])
      new_hash.values.join(" ")
    elsif facility_hash[:street_address_line_1] && facility_hash[:street_address_line_2]
      "#{facility_hash[:street_address_line_1].tr(".","").split.map{|word| word.capitalize}.join(" ")} #{facility_hash[:street_address_line_2].capitalize} #{facility_hash[:city].capitalize} #{facility_hash[:state]} #{facility_hash[:zip_code]}"
    elsif facility_hash[:street_address_line_1]
      "#{facility_hash[:street_address_line_1].tr(".","").split.map{|word| word.capitalize}.join(" ")} #{facility_hash[:city].capitalize} #{facility_hash[:state]} #{facility_hash[:zip_code]}"
    elsif facility_hash[:address1]
      "#{facility_hash[:address1].split.map{|word| word.capitalize}.join(" ")} #{facility_hash[:city].split.map{|word| word.capitalize}.join(" ")} #{facility_hash[:state]} #{facility_hash[:zipcode]}"
    end
  end

  def format_phone(facility_hash)
    if (facility_hash[:phone] && facility_hash[:address]) || (facility_hash[:phone_number] && facility_hash[:title])
      facility_hash[:phone] || facility_hash[:phone_number]
    elsif facility_hash[:public_phone_number]
      "#{facility_hash[:public_phone_number][0..2]}-#{facility_hash[:public_phone_number][3..5]}-#{facility_hash[:public_phone_number][6..9]}"
    elsif facility_hash[:phone]
      facility_hash[:phone].tr("()", "").tr(" ","-")
    end
  end
  
end
