class FacilityOffice 
  attr_reader :office_list
  def initialize(office)
    @office = office
  end

  def create_offices_helper(api_data)
    @office_list = api_data.map do |office|
     @office_data = { 
      name: "#{office[:dmv_id]} #{office[:dmv_office]}", 
      address: "#{office[:address_li]} #{office[:address__1]} #{office[:city]} #{office[:state]} #{office[:zip]}", 
      phone: office[:phone], services: office[:services_p] }
    end
  end


  def create_offices(api_data)
    self.create_offices_helper(api_data)
    offices = @office_list.map do |office|
    FacilityOffice.new(office)
      
    end
    offices
  end

end