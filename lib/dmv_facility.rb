DATA_SOURCES = {
  co: { name:}
  ny: { }
  mo: { }
}

class DmvLocation
  attr_accessor :dmv_office, 
                :address, 
                :address_suite, 
                :city, 
                :state, 
                :zip, 
                :phone, 
                :hours, 
                :services

  def initialize(data)
    @dmv_office = data[:dmv_office]
    @address = data[:address_li]
    @address_suite = data[:address__1]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @phone = data[:phone]
    @hours = data[:hours]
    @services = data[:services_p]
  end
end

class DmvFacility
  attr_reader :dmv_api_data,
              :dmv_office_locations
              

  def initialize(data_source)
    @dmv_office_locations = []
    @dmv_data_service = DmvDataService.new

    case data_source
    when :co
      @dmv_api_data = @dmv_data_service.co_dmv_office_locations
    when :ny
      @dmv_api_data = @dmv_data_service.ny_dmv_office_locations
    when :mo
      @dmv_api_data = @dmv_data_service.mo_dmv_office_locations
    else
      return "Invalid data source"
    end
  end

  def create_dmv_facility
    dmv_api_data.each do |data|
      dmv_location = DmvLocation.new(data)
      @dmv_office_locations << dmv_location
    end
  end
end
