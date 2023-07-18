class FacilityFactory
  def create_facilities(data)
    data.map { |facility| Facility.new(detail_builder(facility)) }
  end

  def addr_builder(facility)
    if facility[:state] == "CO"
      "#{facility[:address_li]}#{" " + "#{facility[:address__1]}" if facility[:address__1]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}"
    elsif facility[:state] == "NY"
      "#{facility[:street_address_line_1]}#{" " + "#{facility[:street_address_line_2]}" if facility[:street_address_line_2]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}"
    elsif facility[:state] == "MO"
      "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}"
    end
  end

  def detail_builder(facility)
    if facility[:state] == "CO"
      {name: facility[:dmv_office], address: addr_builder(facility), phone: facility[:phone]}
    elsif facility[:state] == "NY"
      {name: facility[:office_name], address: addr_builder(facility), phone: number_to_phone(facility[:public_phone_number])}
    elsif facility[:state] == "MO"
      {name: facility[:name], address: addr_builder(facility), phone: facility[:phone]}
    end
  end

  def number_to_phone(number)
    if number
      number_string = ""
      number_string << number
      number_string.insert(0, "(").insert(4, ")").insert(5, " ").insert(9, "-")
    end
  end
end