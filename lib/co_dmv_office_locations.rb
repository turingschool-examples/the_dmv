class Dmv_Office
  attr_reader :offices

  def initialize
    @offices = []
  end

  def create_offices(co_dmv_office_locations)
    co_dmv_office_locations.each do |reg|
      @offices << Dmv.new(reg)
    end
    @offices
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
  end
end

  # For reference 
  # @facility_1 = Facility.new
  # ({name: 'DMV Tremont Branch',
  # address: '2855 Tremont Place Suite 118 Denver CO 80205',
  # phone: '(720) 865-4600'})
  