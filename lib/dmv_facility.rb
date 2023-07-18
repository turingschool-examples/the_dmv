class DmvFacility
  attr_reader :dmv_id, :dmv_office, :address, :city, :state, :zip, :phone, :hours, :services, :parking, :photo

  def initialize(data = {})
    @dmv_id = data[:dmv_id]
    @dmv_office = data[:dmv_office]
    @address = "#{data[:address_li]}, #{data[:address__1]}"
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @phone = data[:phone]
    @hours = data[:hours]
    @services = data[:services_p]
    @parking = data[:parking_no]
    @photo = data[:photo]
  end

  def create_facilities(dmv_facilities_data)
    dmv_facilities_data.map do |data|
      DmvFacility.new(data)
    end
  end
end
