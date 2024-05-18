require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
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

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "#register vehicle" do
    it "can register a :regular vehicle" do
      expect(@facility_1.register_vehicle(@cruz)).to eq false
      @facility_1.add_service("Vehicle Registration")
      expect(@cruz.registration_date).to be nil
      expect(@facility_1.registered_vehicles).to eq []
      expect(@facility_1.collected_fees).to be 0

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to be_a Date
      expect(@cruz.plate_type).to eq :regular
      expect(@facility_1.registered_vehicles).to eq [@cruz]
      expect(@facility_1.collected_fees).to be 100
    end

    it "can register an :antique vehicle" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@camaro)

      expect(@camaro.registration_date).to be_a Date
      expect(@camaro.plate_type).to eq :antique
      expect(@facility_1.collected_fees).to be 25
    end

    it "can register an :ev vehicle" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@bolt)

      expect(@bolt.registration_date).to be_a Date
      expect(@bolt.plate_type).to be :ev
      expect(@facility_1.collected_fees).to be 200
    end

    it "can accumulate registered vehicles and collected fees" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq [@cruz, @camaro, @bolt]
      expect(@facility_1.collected_fees).to be 325
    end

    it "will not register vehicle if service is not available at facility" do
      expect(@facility_2.registered_vehicles).to eq []
      expect(@facility_2.services).to eq []
      expect(@facility_2.register_vehicle(@bolt)).to be false
      expect(@facility_2.registered_vehicles).to eq []
      expect(@facility_2.collected_fees).to be 0
    end
  end

  describe "#administer_written_test" do
    it "can will not administer test if facility does not offer service" do
      expect(@facility_1.administer_written_test(@registrant_1)).to be false
      expect(@registrant_1.license_data).to eq ({written: false, license: false, renewed: false})
    end
      
    it "can administer to registrant with permit and age 16 or older" do
      expect(@registrant_1.license_data).to eq ({written: false, license: false, renewed: false})
      expect(@registrant_1.permit?).to eq true

      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      
      expect(@registrant_1.license_data).to eq ({written: true, license: false, renewed: false})
    end

    it "will not administer to registrant age 16 or older without a permit " do
      @facility_1.add_service("Written Test")
      
      expect(@registrant_2.age).to be 16
      expect(@registrant_2.permit?).to be false

      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data).to eq ({written: false, license: false, renewed: false})
    end

    it "can administer to registrant age 16 or older who has earned a permit" do
      @facility_1.add_service("Written Test")      
      @registrant_2.earn_permit      
      @facility_1.administer_written_test(@registrant_2)
      
      expect(@registrant_2.license_data).to eq ({written: true, license: false, renewed: false})
    end

    it "will not administer to registrant age 15 or younger" do
      @facility_1.add_service("Written Test")   

      expect(@registrant_3.age).to be 15
      expect(@registrant_3.permit?).to be false
      expect(@facility_1.administer_written_test(@registrant_3)).to be false
      
      @registrant_3.earn_permit
      
      expect(@facility_1.administer_written_test(@registrant_3)).to be false
      expect(@registrant_3.license_data).to eq ({written: false, license: false, renewed: false})
    end
  end

  describe "#administer_road_test" do
    #A road test can only be administered to registrants who have passed the written test
    #For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
  end

  describe "#renew_drivers_license" do
    # A license can only be renewed if the registrant has already passed the road test and earned a license
  end


  
  
  
  


end
