require 'faraday'
require 'json'

class DmvDataService
  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def wa_ev_registrations
    @wa_ev_registrations ||= load_data('https://data.wa.gov/resource/rpr4-cgyd.json')
  end

  def co_dmv_office_locations
    @co_dmv_office_locations ||= load_data('https://data.colorado.gov/resource/dsw3-mrn4.json')
  end

  def ny_dmv_office_locations
    @ny_dmv_office_locations ||= load_data('https://data.ny.gov/resource/9upz-c7xg.json')
  end

  def mo_dmv_office_locations
    @mo_dmv_office_locations ||= load_data('https://data.mo.gov/resource/835g-7keg.json')
  end

  # def create_facility_objects(data)
  #   facilities = []

  #   data.map do |facility|
  #     facility_details = {
  #       the_geom: data[:the_geom],
  #       dmv_id: data[:dmv_id],
  #       dmv_office: data[:dmv_office],
  #       address_li: data[:address_li],
  #       address__1: data[:address__1],
  #       city: data[:city],
  #       state: data[:state],
  #       zip: data[:zip],
  #       phone: data[:phone],
  #       hours: data[:hours],
  #       services_p: data[:services_p],
  #       photo: data[:photo],
  #       address_id: data[:address_id]
        
  #   }
  #   end
  # end
  def create_facility_objects(data)
    facilities = []

    data.map do |facility|
      facility_details = {

        name: facility[:name],
        address: facility[:address],
        city: facility[:city],
        state: facility[:state],
        zip: facility[:zip],
        phone: facility[:phone],
        hours: facility[:hours],
        services: facility[:services]

    }
    end
  end
end
