require 'faraday'
require 'json'

class DmvDataService
  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def wa_ev_registrations
    # ||= replaces variable if variable is not truthy
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
end

# describe '#register_antique' do
# it 'can assign plate type to :antique' do
#   expect(@camaro.plate_type).to be nil

#   @facility_1.register_ev(@camaro)

  
# end

# it 'can collect $25 in registration fees' do

# end
# end