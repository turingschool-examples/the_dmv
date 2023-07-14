require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      # require 'pry';binding.pry
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
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

  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @facility_1.add_service("Vehicle Registration")
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end

  describe "#register_vehicle" do
    it "can register vehicles" do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])
    end

    it "doesn't register a vehicle if the facility doesn't offer the service" do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])

      @facility_2.register_vehicle(@bolt)

      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe "#collect_fees" do
    it "can collect fees based on vehicle details" do
      expect(@facility_1.collect_fees(@cruz)).to eq(100)
      expect(@facility_1.collect_fees(@bolt)).to eq(300)
      expect(@facility_1.collect_fees(@camaro)).to eq(325)
    end
  end

  describe "#administer_written_test" do
    it "can't administer a written test until that service is offered" do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@facility_1.administer_written_test(@registrant_1)).to be false
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility_1.add_service("Written Test")

      expect(@facility_1.administer_written_test(@registrant_1)).to be true
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it "can only administer a written test to eligible registrants" do
      @facility_1.add_service("Written Test")
      
      expect(@facility_1.administer_written_test(@registrant_2)).to be false

      @registrant_2.earn_permit

      expect(@facility_1.administer_written_test(@registrant_2)).to be true
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      expect(@facility_1.administer_written_test(@registrant_3)).to be false

      @registrant_3.earn_permit

      expect(@facility_1.administer_written_test(@registrant_3)).to be false
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
end
