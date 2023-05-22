require 'spec_helper'


factory = VehicleFactory.new
wa_ev_registrations = DmvDataService.new.wa_ev_registrations

describe VehicleFactory do

  it 'formats data to pass to Vehicle class' do
    vehicle = {'electric_vehicle_type':'Battery Electric Vehicle (BEV)','vin_1_10':'7SAYGDEF6N','model_year':'2022','make':'TESLA','model':'Model Y'}

    vehicle_formatted = {vin: '7SAYGDEF6N', year: '2022', make: 'TESLA', model: 'Model Y', engine: :ev}
    expect(factory.format(vehicle)).to eq([vehicle_formatted])
  end

  it 'creates vehicles' do
    vehicles = factory.create_vehicles(wa_ev_registrations)

    expect(vehicles).to be_a(Array)
    expect(vehicles.first).to be_a(Vehicle)
    expect(vehicles.first.vin).to eq('7SAYGDEF6N')
    expect(vehicles.first.year).to eq('2022')
    expect(vehicles.first.make).to eq('TESLA')
    expect(vehicles.first.model).to eq('Model Y')
    expect(vehicles.first.engine).to eq(:ev)
    expect(vehicles.first.plate_type).to eq(nil)
    expect(vehicles.first.registration_date).to eq(nil)
  end

end