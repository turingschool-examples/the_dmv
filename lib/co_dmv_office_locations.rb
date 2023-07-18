class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(source) #change to source from office_locations to match paramter DMVDataService 
    source.each do |reg|
      @facilities << Dmv.new(reg)
    end
    @facilities
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
      # CO Reference
      if details[:dmv_office] && details[:address_li] && details[:city] && details[:state] && details[:zip] && details[:phone] 
        @dmv_office = details[:dmv_office]
        @address_li = details[:address_li]
        @address__1 = details[:address__1]
        @city = details[:city]
        @state = details[:state]
        @zip = details[:zip]
        @phone = details[:phone]
      else 
        # New York Reference
        @dmv_office = details[:office_name]
        @address_li = details[:office_type]
        @phone = details[:public_phone_number]
        @address__1 = details[:street_address_line_1]
        @city = details[:city]
        @state = details[:state]
        @zip = details[:zip_code]
      end
    end
  end
end

  # For reference 
  # @facility_1 = Facility.new
  # ({name: 'DMV Tremont Branch',
  # address: '2855 Tremont Place Suite 118 Denver CO 80205',
  # phone: '(720) 865-4600'})
  
  # For reference from New York Data Set
  # :office_name=>"JAMAICA",
  # :office_type=>"DISTRICT OFFICE",
  # :public_phone_number=>"7189666155",
  # :street_address_line_1=>"168-46 91ST AVE., 2ND FLR",
  # :city=>"JAMAICA",
  # :state=>"NY",
  # :zip_code=>"11432"
