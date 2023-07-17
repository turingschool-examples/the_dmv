class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(database)
    database.each do |facility|
      if facility[:state] == "CO"
        @facilities << Facility.new({
          name: name_formatter(facility[:dmv_office]),
          address: name_formatter("#{facility[:address_li]} #{facility[:address__1]}, #{facility[:city]}, #{facility[:state]} #{facility[:zip]}"),
          phone: phone_number_formatter(facility[:phone])
        })
      elsif facility[:state] == "NY"
        @facilities << Facility.new({
          name: name_formatter(facility[:office_name]),
          address: name_formatter("#{facility[:street_address_line_1]} #{facility[:street_address_line_2]}, #{facility[:city]}, #{facility[:state]} #{facility[:zip_code]}"),
          phone: phone_number_formatter(facility[:public_phone_number])
        })
      elsif facility[:state] == "MO"
        @facilities << Facility.new({
          name: name_formatter(facility[:name]),
          address: name_formatter("#{facility[:address1]} #{facility[:address2]}, #{facility[:city]}, #{facility[:state]} #{facility[:zipcode]}"),
          phone: phone_number_formatter(facility[:phone])
        })
      end
    end
    @facilities
  end

  def phone_number_formatter(string)
    if !string.nil?
      string.delete("^0-9").insert(6, "-").insert(3, ") ").prepend("(")
    else
      "Not listed"
    end
  end

  def name_formatter(string)
    if !string.nil?
      string_array = string.downcase.split.map do |word|
        if word == "dmv"
          word.upcase
        elsif word == "co"
          word.upcase
        elsif word == "ny"
          word.upcase
        elsif word == "mo"
          word.upcase
        else
          word.capitalize
        end
      end
      string_array.join(" ").sub(" ,", ",")
    else
      "Not listed"
    end
  end
end