require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe "instances of Facility" do 
    it "creates new facilities" do 
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
    end    
  end
  describe "#method add_service" do
    it "can add service to facility" do
      expect(@facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
    end 
  end 
  
  describe "#method collected fees" do 
    xit "can collect_fees" do
      @facility_1.collected_fees
      expect(@facility_1.collected_fees).to eq(0)
    end 
  end 

  describe '#add service' do
    xit 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end



describe "#registered_vehicles" do 
  xit  "registers vehicle" do 
    expect(facility_1.registered_vehicles).to eq([])
  end 
end 

describe "#collected fees" do 
  xit "collects fees" do 
    expect(facility_1.collected_fees).to eq(0)
  end 
end 
describe "#register_vehicle" do 
  it "registers a vehicle" do
    # setup 
    expect(@cruz.registration_date).to eq(nil)
    expect(@facility_1.collected_fees).to eq(0)
    expect(@facility_1.registered_vehicles).to eq([])
    #action
    @facility_1.register_vehicle(@cruz)
    #result
    expect(@cruz.registration_date).to be_a(Date)
    expect(@facility_1.collected_fees).to eq(100)
    expect(@facility_1.registered_vehicles).to eq([@cruz])
  end 
end 

end