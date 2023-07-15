class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(database)
    database.each do |facility|
      if facility[:state] == "CO"
        @facilities << Facility.new({
          name: facility[:dmv_office],
          address: facility[:address_li],
          phone: phone_number_formatter(facility[:phone])
        })
      elsif facility[:state] == "NY"
        @facilities << Facility.new({
          name: facility[:office_name],
          address: facility[:street_address_line_1],
          phone: phone_number_formatter(facility[:public_phone_number])
        })
      elsif facility[:state] == "MO"
        @facilities << Facility.new({
          name: facility[:name],
          address: facility[:address1],
          phone: phone_number_formatter(facility[:phone])
        })
      end
    end
    @facilities
  end

  def phone_number_formatter(string)
    if string != nil
      string.delete("^0-9").insert(6, "-").insert(3, ") ").prepend("(")
    else
      "No phone number listed"
    end
  end

  def name_formatter(string)
    if !string.nil?
      string_array = string.split.map do |word|
        if word.downcase == "dmv"
          word.upcase
        else
          word.downcase.capitalize
        end
      end
      string_array.join(" ")
    else
      "No name listed"
    end
  end
end