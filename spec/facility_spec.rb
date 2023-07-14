require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )}
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )}
    @camero = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )}
  end
  describe '#initialize' do
    it 't1 can initialize' do
      expect(@facility1).to be_an_instance_of(Facility)
      expect(@facility1.name).to eq('DMV Tremont Branch')
      expect(@facility1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility1.phone).to eq('(720) 865-4600')
      expect(@facility1.services).to eq([])
    end
  end

  describe '#add service' do
    it 't2 can add available services' do
      expect(@facility1.services).to eq([])
      @facility1.add_service('New Drivers License')
      @facility1.add_service('Renew Drivers License')
      @facility1.add_service('Vehicle Registration')
      expect(@facility1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "i2.a facility can handle a car" do
    it "t4 vehicles can recieve plate time stamped" do
      expect(@facility_1.add_service("Vehicle Registration")).to eq("Vehicle Registration")
      expect(@cruz.registration_date).to be(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to include(2023)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.registered_vehicles).to eq(@cruz)
    end

    it "t5 can store registered vehicals" do
      expect(@facility_1.add_service("Vehicle Registration")).to eq("Vehicle Registration")

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq(@cruz)
    end
    
    it "t6 can collect fees" do
      expect(facility_1.add_service("Vehicle Registration")).to eq("Vehicle Registration")
      
      facility_1.register_vehicle(@cruz)
      
      expect(@facility_1.collected_fees).to eq(100)
    end
  end

  describe "i2.a facility can handle multiple cars" do
    
    it "t7 can give vehicles different plates" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @acility_1.register_vehicle(@bolt)
      
      expect(camaro.plate_type).to eq(:antique)
      expect(bolt.plate).to eq(:ev)
    end
    
    it "t8 can collect and get a sum of fees" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @acility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe "i2.a facilities cannot offer services they don't have" do
    it "t9 not allow a facility to register a vehicle unless it has that service" do
      @facility_1.register_vehicle(@bolt)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
    
      expect(@facility_2.registered_vehicle(@bolt)).to eq(nil)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describle "i2.b facilities can give tests to registrants" do
    describle "Written test" do
    end
  end














end
