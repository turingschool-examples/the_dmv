require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Facility do
  before(:each) do
    @facility_info = { name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600' }
    @facility = Facility.new(@facility_info)
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )


    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
  end


  describe 'initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end



  describe 'add_service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      @facility.add_service('Written Test')
      @facility.add_service ('Renew License')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration','Written Test','Renew License'])
    end
  end



  describe 'register vehicle' do
    it 'registers a vehicle' do
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to include(@cruz)
    end
  end


  describe 'registration date' do
    it 'sets the registration date to today' do
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end


  describe 'collected_fees' do
    it 'returns $25 for antique vehicles (25 years old or older)' do
      @facility.register_vehicle(@camaro)
      expect(@facility.collected_fees).to eq(25)
    end

    it 'returns $200 for electric vehicles' do
      @facility.register_vehicle(@bolt)
      expect(@facility.collected_fees).to eq(200)
    end

    it 'returns $100 for all other vehicles' do
      @facility.register_vehicle(@cruz)
      expect(@facility.collected_fees).to eq(100)
    end
  end


  describe 'administer_written_test'do
      it 'decides if the written test will be taken' do
      expect(@facility.administer_written_test(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data[:written]).to eq(true)
    end
  end

  
  describe 'administer road test' do
    it 'decides if a road test will be taken' do
      @facility.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:license]).to eq(false)
    end
  end

  describe 'renew drivers license' do
    it 'describes if a license can be renewed' do
        @registrant_1.license_data[:written] = true
        @registrant_1.license_data[:license] = true
      
        expect(@facility.renew_drivers_license(@registrant_1)).to eq(false)
      
        @registrant_1.license_data[:renewed] = false
      
        expect(@facility.renew_drivers_license(@registrant_1)).to eq(true)
      
        expect(@facility.renew_drivers_license(@registrant_3)).to eq(false)
      
        expect(@facility.renew_drivers_license(@registrant_2)).to eq(false)
    end
end




  

  
end
