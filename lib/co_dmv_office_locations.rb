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
      elsif details[:office_name] && details[:office_type] && details[:public_phone_number] && details[:street_address_line_1] && details[:city] && details[:state] && details[:zip_code]
        # New York Reference
        @dmv_office = details[:office_name]
        @address_li = details[:office_type]
        @phone = details[:public_phone_number]
        @address__1 = details[:street_address_line_1]
        @city = details[:city]
        @state = details[:state]
        @zip = details[:zip_code]
      else
        # Missouri Reference
        @dmv_office = details[:type]
        @address_li = details[:county]
        @phone = details[:phone]
        @address__1 = details[:address1]
        @city = details[:city]
        @state = details[:state]
        @zip = details[:zipcode]
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

  # For reference from Missouri Data Set

  # Dexter

  # :number=>"086",
  # :dorregionnumber=>"14",
  # :type=>"1MV",
  # :name=>"DEXTER",
  # :address1=>"119 VINE ST",
  # :city=>"DEXTER",
  # :state=>"MO",
  # :zipcode=>"63841",
  # :county=>"Stoddard",
  # :phone=>"(573) 624-8808",
  # :fax=>"(573) 624-8724",
  # :size=>"2",
  # :email=>"DEXTERAGENTOFFICE@DOR.MO.GOV",
  # :agent=>"STODDARD COUNTY LICENSE OFFICE",
  # :officemanager=>"RAY ROWLAND",
  # :daysopen=>"Monday - Friday - 8:30 to 4:30",
  # :holidaysclosed=> Skip

  # Princeton
  # :number=>"090",
  # :dorregionnumber=>"2",
  # :type=>"1MV",
  # :name=>"PRINCETON",
  # :address1=>"703 HICKLAND SUITE B",
  # :city=>"PRINCETON",
  # :state=>"MO",
  # :zipcode=>"64673",
  # :located_in=>"THE FAMOUS BUILDING",
  # :county=>"Mercer",
  # :phone=>"(660) 748-4445"