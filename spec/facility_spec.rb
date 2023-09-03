require './spec/spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    # @facility_1 = Facility.new
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
    @registrant_1 = Registrant.new('Matt', 18)
    @registrant_2 = Registrant.new('Kristen', 16, true)
    @co_facilities = DmvDataService.new.co_dmv_office_locations
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

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('Vehicle Registration')
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew License')
      expect(@facility.services).to eq(['Vehicle Registration', 'Written Test', 'Road Test', 'Renew License'])
    end
  end
  describe 'Registering a vehicle' do
    it 'can #register_vehicle if facility provides a `Vehicle Registration` service' do
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles.include?(@cruz)).to be false
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles.include?(@cruz)).to be true
    end
    it 'records the date of registration' do
      @facility.add_service('Vehicle Registration')
      expect(@cruz.registration_date).to be nil
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to_not be nil
      expect(@cruz.registration_date).to eq(Date.today)
    end
    it 'gives a vehicle@platetype of :antique, :ev, or :regular' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
      @facility.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
      @facility.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
    end
    it 'collects fees from each vehicle registered' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@facility.collected_fees).to eq(100)
      @facility.register_vehicle(@bolt)
      expect(@facility.collected_fees).to eq(300)
      @facility.register_vehicle(@camaro)
      expect(@facility.collected_fees).to eq(325)
    end
    it 'keeps a record of all registered vehicles' do
      @facility.add_service('Vehicle Registration')
      expect(@facility.registered_vehicles).to eq([])
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles.include?(@cruz)).to be true
      @facility.register_vehicle(@bolt)
      expect(@facility.registered_vehicles.include?([@cruz, @bolt]))
      @facility.register_vehicle(@camaro)
      expect(@facility.registered_vehicles.include?([@cruz, @bolt, @camaro]))
    end
  end
  describe 'it can issue driver\'s licenses to qualifying registrants' do
    before(:each) do
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew License')
    end
    it 'can #administer_written_test if registrant has a permit' do
      expect(@facility.administer_written_test(@registrant_1)).to be false
      expect(@facility.administer_written_test(@registrant_2)).to be true
      @registrant_1.earn_permit
      expect(@facility.administer_written_test(@registrant_1)).to be true
    end
    it 'records whether a registrant has passed their written test' do
      expect(@registrant_2.license_data[:written]).to be false
      @facility.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data[:written]).to be true
    end
    it 'can #administer_road_test for registrants who have passed their written test' do
      expect(@facility.administer_road_test(@registrant_2)).to be false
      @facility.administer_written_test(@registrant_2)
      expect(@facility.administer_road_test(@registrant_2)).to be true
    end
    it 'records whether a registrant has passed their road test' do
      @facility.administer_written_test(@registrant_2)
      @facility.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data[:license]).to be true
    end
    it 'will #renew_drivers_license if registrant has passed written and road tests' do
      @facility.administer_written_test(@registrant_2)
      expect(@facility.renew_drivers_license(@registrant_2)).to be false
      @facility.administer_road_test(@registrant_2)
      expect(@facility.renew_drivers_license(@registrant_2)).to be true
    end
    it 'it will renew a registrant\'s license if it offers \'Renew License\' service and registrant has passed written and road tests' do
      @facility.administer_written_test(@registrant_2)
      @facility.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data[:renewed]).to be false
      @facility.renew_drivers_license(@registrant_2)
      expect(@registrant_2.license_data[:renewed]).to be true
    end
  end
    # it 'can be instantiated with external data from an api' do
    #   colorado_facility = Facility.new(@co_facilities[0])
    #   p colorado_facility
    #   # expect(colorado_facility)[0].name.to eq('DMV Tremont Branch')
    # end
end
