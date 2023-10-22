require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  it 'can initialize' do
    expect(@cruz).to be_an_instance_of(Vehicle)
    expect(@cruz.vin).to eq('123456789abcdefgh')
    expect(@cruz.year).to eq(2012)
    expect(@cruz.make).to eq('Chevrolet')
    expect(@cruz.model).to eq('Cruz')
    expect(@cruz.engine).to eq(:ice)
    #Iteration2
    expect(@cruz.registration_date).to eq(nil)
    expect(@cruz.plate_type).to eq(nil)
    expect(@bolt.registration_date).to eq(nil)
    expect(@bolt.plate_type).to eq(nil)
    expect(@camaro.registration_date).to eq(nil)
    expect(@camaro.plate_type).to eq(nil)
  end

  it 'can determine if a vehicle is an antique' do
    expect(@cruz.antique?).to eq(false)
    expect(@bolt.antique?).to eq(false)
    expect(@camaro.antique?).to eq(true)
  end

  it 'can determine if a vehicle is an ev' do
    expect(@cruz.electric_vehicle?).to eq(false)
    expect(@bolt.electric_vehicle?).to eq(true)
    expect(@camaro.electric_vehicle?).to eq(false)
  end

  #Iteration2
  it 'can have a registration date' do
    #@facility_1.register_vehicle(cruz)
    @cruz.set_registration_date
    @camaro.set_registration_date
    @bolt.set_registration_date

    expect(@cruz.registration_date).to be_an_instance_of(Date)
    expect(@camaro.registration_date).to be_an_instance_of(Date)
    expect(@bolt.registration_date).to be_an_instance_of(Date)
  end
  
  #Iteration2
  it 'can have a plate type' do
    #@facility_1.register_vehicle(cruz)
    @cruz.set_registration_date
    @camaro.set_registration_date
    @bolt.set_registration_date

    @cruz.assign_plate_type
    @camaro.assign_plate_type
    @bolt.assign_plate_type

    expect(@cruz.plate_type).to eq(:regular)
    expect(@camaro.plate_type).to eq(:antique)
    expect(@bolt.plate_type).to eq(:ev)
  end

end
