require 'spec_helper'
#start with negative tests to simplify process
RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
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
  describe '#registered_vehicle' do
    it 'can register all vehicle types' do

      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today.year)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@cruz.plate_type).to eq(:regular)

      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to eq(Date.today.year)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
      expect(@camaro.plate_type).to eq(:antique)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to eq(Date.today.year)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@bolt.plate_type).to eq(:ev)

    end

    it "wont register vehicle if it doesnt have the service" do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@cruz.plate_type).to eq(nil)
  end

    
  end

  describe '#collected fees' do
  it 'starts with no collected fees' do
    
    expect(@facility_1.collected_fees).to eq(0)

  end
  it "collects $25 for antique vehicle registration" do
  @facility_1.add_service("Vehicle Registration")
  @facility_1.register_vehicle(@camaro)
  expect(@facility_1.collected_fees).to eq(25)
  end
  it "collects $100 for regular vehicle registration" do
    @facility_1.add_service("Vehicle Registration")
    @facility_1.register_vehicle(@cruz)
    expect(@facility_1.collected_fees).to eq(100)
  end
  it "collects $200 for ev vehicle registration" do
    @facility_1.add_service("Vehicle Registration")
    @facility_1.register_vehicle(@bolt)
    expect(@facility_1.collected_fees).to eq(200)
  end
end

  describe "#plate_type" do
  it 'gives an antique plate to antique cars' do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
      end
      it "gives regular plate to regular vehicle registration" do
        @facility_1.add_service("Vehicle Registration")
        @facility_1.register_vehicle(@cruz)
        expect(@cruz.plate_type).to eq(:regular)
      end
      it "gives eve plate for ev vehicle registration" do
        @facility_1.add_service("Vehicle Registration")
        @facility_1.register_vehicle(@bolt)
        expect(@bolt.plate_type).to eq(:ev)
      end
    end
    describe '#administer written test' do
    it "will not administer a written test if it does not have service" do
    @facility_1.administer_written_test(@registrant_1)
    expect(@registrant_1.license_data[:written]).to eq(false)
    end
    it "will administer written test if service available" do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
    expect(@registrant_1.license_data[:written]).to eq(true)
    end
    it "will not administer to someone without a permit" do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data[:written]).to eq(false)
    end

    it "will administer written test to someone with permit" do
      @registrant_2.earn_permit
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data[:written]).to eq(true)
    end
    it "wont administer written test if not of age" do
      @registrant_3.earn_permit
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.license_data[:written]).to eq(false)
    end

    #written and has service
    describe "#administer road test" do
    it "will not administer road test if no service available" do
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq(false)
      end

      it "will not administer if no written test" do
        @facility_1.add_service("Road Test")
        @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq(false)
      end

      it "will administer road test if services availalbe and written test is passed" do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.add_service("Road Test")
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq(true)
      end

      it "will not administer if service is not available but written is passed" do
      @facility_1.add_service("Written Test")
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq(false)
      end

      it "will not administer if service is available but written not passed" do
      @facility_1.add_service("Road Test") 
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq(false)
      end
    end
  end

  
  describe "#renew drivers license" do
  it "will not renew if service not offered" do
    @facility_1.add_service("Road Test") 
    @facility_1.add_service("Written Test") 
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.administer_road_test(@registrant_1)
    @facility_1.renew_drivers_license(@registrant_1)
    expect(@registrant_1.license_data[:renewed]).to eq(false)
  end

  it "will not renew if road test was not administered" do
    @facility_1.add_service("Road Test") 
    @facility_1.add_service("Written Test") 
    @facility_1.add_service("Renew License")
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.renew_drivers_license(@registrant_1)
    expect(@registrant_1.license_data[:renewed]).to eq(false)
  end

  it "will renew license when road test has been administered and facility has service" do
    @facility_1.add_service("Road Test") 
    @facility_1.add_service("Written Test") 
    @facility_1.add_service("Renew License")
    @facility_1.administer_written_test(@registrant_1)
    @facility_1.administer_road_test(@registrant_1)
    @facility_1.renew_drivers_license(@registrant_1)
    expect(@registrant_1.license_data[:renewed]).to eq(true)
  end
end


end








