#probably needs update
require 'spec_helper'

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

  describe '#register_vehicle' do
    it 'regects registration if service is not offered' do
      @facility_1.register_vehicle(cruz)
      expect(@facility_1.register_vehicle(cruz)).to eq("try a different branch")
    end

    it 'tracks collected fees' do
      @facility.add_service('Vehicle Registration')
      @facility_1.register_vehicle(cruz)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.register_vehicle(camaro)
      expect(@facility_1.collected_fees).to eq(125)
      @facility_1.register_vehicle(bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'stores registered vehicles' do
      @facility.add_service('Vehicle Registration')
      @facility_1.register_vehicle(cruz)
      @facility_1.register_vehicle(camaro)
      @facility_1.register_vehicle(bolt)
      expect(@facility_1.instance_variable_get(:@registered_vehicles).length).to eq(3)
      expect(@facility_1.instance_variable_get(:@registered_vehicles)).to all be_a(Vehicle)
    end
#upon successful registration
    it 'assigns plate_type to vehicles' do
      @facility.add_service('Vehicle Registration')
      @facility_1.register_vehicle(cruz)
      @facility_1.register_vehicle(camaro)
      @facility_1.register_vehicle(bolt)
      expect(cruz.plate_type).to eq('ice')
      expect(camaro.plate_type).to eq('antique')
      expect(bolt.plate_type).to eq('ev')
    end
  end
end
