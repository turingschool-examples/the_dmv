class FacilityFactory
    attr_reader :co_facilities_created

  def initialize

    @co_facilities_created = []    
  end

  def create_facilities(data)
    data.each do |dmv_data|
      @co_facilities_created << Facility.new({
      name: dmv_data[:dmv_office],
      address: ("#{dmv_data[:address_li]} #{dmv_data[:address__1]} #{dmv_data[:city]} #{dmv_data[:state]} #{dmv_data[:zip]}"),
      phone: dmv_data[:phone]
      })
    end 
    @co_facilities_created
  end
end
