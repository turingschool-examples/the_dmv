require 'spec_helper'


factory = VehicleFactory.new
wa_ev_registrations = DmvDataService.new.wa_ev_registrations

describe VehicleFactory do

  it 'formats data to pass to Vehicle class' do
    vehicle = {'electric_vehicle_type':'Battery Electric Vehicle (BEV)','vin_1_10':'7SAYGDEF6N','model_year':'2022','make':'TESLA','model':'Model Y'}

    vehicle_formatted = {vin: '7SAYGDEF6N', year: '2022', make: 'TESLA', model: 'Model Y', engine: :ev}
    expect(factory.format(vehicle)).to eq([vehicle_formatted])
  end

end