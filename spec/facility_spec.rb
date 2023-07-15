require 'spec_helper'
require "./lib/facility"
require "./lib/vehicle"

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  #ITERATION2 TESTS & EXPECTS
  describe "#register_vehicle" do
    it "can register a vehicle" do
    end
  end


  
  expect(facility_1.registered_vehicles).to eq([])
  expect(facility_1.collected_fees).to eq(0)
  expect(facility_1.register_vehicle(cruz)).to eq([])

  expect(cruz.registration_date).to eq(date j0s0n)
  expect(cruz.plate_type).to eq(:regular)

  require 'pry';binding.pry


  expect(facility_1.registered_vehicles).to eq([])
  expect(facility_1.collected_fees).to eq(100)

  expect(facility_1.register_vehicle(camaro)).to eq([vehicle,vehicle])
  expect(camaro.registration_date).to eq(date j0s0n)
  expect(camaro.plate_type).to eq(:antique)

  expect(facility_1.register_vehicle(bolt)).to eq([vehicle,vehicle, vehicle])
  expect(bolt.registration_date).to eq(date j0s0n)
  expect(bolt.plate_type).to eq(:ev)

  expect(facility_1.registered_vehicles).to eq([:vehicle, :vehicle, :vehicle])
  expect(facility_1.collected_fees).to eq(325)

  expect(facility_2.registered_vehicles).to eq([])
  expect(facility_2.services).to eq([])
  expect(facility_2.register_vehicle(bolt)).to eq(nil)
  expect(facility_2.registered_vehicles).to eq([])
  expect(facility_2.collected_fees).to eq(0)

end