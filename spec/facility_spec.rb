require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @facility_1.add_service('Vehicle Registration')
    @registrant_1 = Registrant.new("Bruce", 18, true)
    @registrant_2 = Registrant.new("Penny", 16)
    @registrant_3 = Registrant.new("Tucker", 15)
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

  describe "#register_vehicle" do
    it "can register a new vehicle" do
      expect(@facility_1.registered_vehicles).to be_empty

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])

      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end

    it "sets the vehicles registration date during registration" do
      expect(@cruz.registration_date).to be nil

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
    end

    it "sets the vehicles plate type during registration" do
      expect(@cruz.plate_type).to be nil
      expect(@camaro.plate_type).to be nil

      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it "collects registration fees during registration" do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)
      
      expect(@facility_1.collected_fees).to eq(100)
      
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      
      expect(@facility_1.collected_fees).to eq(325)
    end

    it "can only register a vehicle if the facility offers registration service" do
      expect(@facility_2.registered_vehicles).to be_empty
      expect(@facility_2.services).to be_empty

      @facility_2.register_vehicle(@bolt)

      expect(@facility_2.registered_vehicles).to be_empty
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe "#set_plate_type" do
    it "sets the plate type based on vehicle age and EV status" do
      expect(@cruz.plate_type).to be nil
      expect(@bolt.plate_type).to be nil
      expect(@camaro.plate_type).to be nil

      @facility_1.set_plate_type(@cruz)
      @facility_1.set_plate_type(@bolt)
      @facility_1.set_plate_type(@camaro)

      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
    end
  end

  describe "#collect_registration_fees" do
    it "collects a fee based on vehicle age and EV status" do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.collect_registration_fees(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      
      @facility_1.collect_registration_fees(@bolt)
      expect(@facility_1.collected_fees).to eq(300)

      @facility_1.collect_registration_fees(@camaro)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe "#administer_written_test" do
    it "can only be done by a facility offering Written Test service" do
      expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
      expect(@registrant_1.permit?).to be true
      
      @facility_1.administer_written_test(@registrant_1)
      
      expect(@registrant_1.license_data).to eq({:written => false, :license => false, :renewed => false})
      
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      
      expect(@registrant_1.license_data).to eq({:written => true, :license => false, :renewed => false})
    end

    it "can only be administered to registrants with a permit" do
      @facility_1.add_service("Written Test")

      expect(@registrant_2.permit?).to be false
      
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.permit?).to be false
      
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({:written => true, :license => false, :renewed => false})
    end
    
    xit "can only be administered to registrants age 16 or older" do
      @facility_1.add_service("Written Test")
      @registrant_2.earn_permit
      @registrant_3.earn_permit
      
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_3.age).to eq(15)
      
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_written_test(@registrant_3)
      
      expect(@registrant_2.license_data).to eq({:written => true, :license => false, :renewed => false})
      expect(@registrant_3.license_data).to eq({:written => false, :license => false, :renewed => false})
    end
  end
end
