class FacilityFactory
  attr_reader :facilities
  
  def initialize
    @facilities = []
  end

  def create_facilities(data_source) 
    #change to source from office_locations to match paramter DMVDataService 
    data_source.each do |reg|
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

  