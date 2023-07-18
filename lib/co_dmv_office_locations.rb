require 'net/http'
require 'json'


class Dmv_Office
  attr_reader :offices

  def initialize
    @offices = []
  end

  def create_offices(office_locations)
    office_locations.each do |reg|
      @offices << Dmv.new(reg)
    end
    @offices
  end

  def fetch(https://data.colorado.gov/resource/dsw3-mrn4.json)
    u = U(https://data.colorado.gov/resource/dsw3-mrn4.json)
    response = Net: :HTTP.get(u)
    JSON.parse(feedback)
  end

  
  private

  class Dmv
    attr_reader :dmv_office,
                :address_li,
                :address__1,
                :city,
                :state,
                :zip,
                :phone
                
    def initialize(details)
      @dmv_office = details[:dmv_office]
      @address_li = details[:address_li]
      @address__1 = details[:address__1]
      @city = details[:city]
      @state = details[:state]
      @zip = details[:zip]
      @phone = details[:phone]
    end
    @result = @office.create_offices(@co_dmv_office_locations)
  end
end

  # For reference 
  # @facility_1 = Facility.new
  # ({name: 'DMV Tremont Branch',
  # address: '2855 Tremont Place Suite 118 Denver CO 80205',
  # phone: '(720) 865-4600'})
  