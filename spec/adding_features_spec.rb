require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @facility_1.add_service('Vehicle Registration')
  end
  
  it 'can add service' do
    expect(@facility_1.services).to eq(['Vehicle Registration'])
   end

  it 'can check registration date' do
    expect(@cruz.registration_date).to eq(nil)
  end

  it 'can collect fees' do
    expect(@facility_1.collected_fees).to eq(0)
  end

  it 'can register a cruz' do
    @facility_1.register_vehicle(@cruz)
    #require 'pry';binding.pry
    expect(@facility_1.registered_vehicles).to eq([@cruz])
    expect(@cruz.registration_date).to eq(2023)
    expect(@cruz.plate_type).to eq(:regular)
    expect(@facility_1.collected_fees).to eq(100)
  end

  it 'can register a Camaro' do
    @facility_1.register_vehicle(@cruz)
    @facility_1.register_vehicle(@camaro)
    #require 'pry';binding.pry
    expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
    expect(@camaro.registration_date).to eq(2023)
    expect(@camaro.plate_type).to eq(:antique)
    expect(@facility_1.collected_fees).to eq(125)
  end

  it 'can register a Bolt' do
    @facility_1.register_vehicle(@cruz)
    @facility_1.register_vehicle(@camaro)
    @facility_1.register_vehicle(@bolt)
    #require 'pry';binding.pry
    expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    expect(@bolt.registration_date).to eq(2023)
    expect(@bolt.plate_type).to eq(:ev)
    expect(@facility_1.collected_fees).to eq(325)
  end

  it 'has no registered cars at facility_2' do
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.services).to eq([])
    expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
    expect(@facility_2.collected_fees).to eq(0)
  end
end
#require 'pry';binding.pry