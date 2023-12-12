class FacilityLocations
    def initialize; end

    def co_dmv_offices(site)
        site.map do |site_details|
            Facility.new({
            name: site_details[:dmv_office],
            address: site_details.values_at(:address_li, :address__1, :city, :state, :zip).join(" "),
            phone: site_details[:phone]
            })
        end
    end
end