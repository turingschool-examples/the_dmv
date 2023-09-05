class FacilityLocation
  def initialize

  end
  def create_offices_helper(api_data)
    @office_list = api_data.map do |office|
      office_data = { name: data[:dmv_office], address: data[:address_li, :address__1, :city, :state, :zip], phone: data[:phone], services_p: data[:services_p]}

    end
  end

  def create_offices(api_data)
    self.create_offices_helper
    offices = @office_list.map do |office|
      FacilityLocation.new(office)
    end
  end
end