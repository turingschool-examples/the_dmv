class FacilityFactory 
    attr_reader :facilities

    def initialize
        @facilities = []
    end

    def create_facilities(locations)
        locations.each do |location|
         details = {}
            details[:name] = location[:dmv_office]
            #require 'pry'; binding.pry
            details[:address] = (location[:address_li].to_s)+" "+location[:address__1]+" "+location[:city]+" "+location[:zip]
            details[:phone] = location[:phone]
            facility = Facility.new(details)
            facility.add_service(location[:services])
            @facilities << facility
        end
    end
end