require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV NorthEast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
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
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'] )
    end
  end

  describe '#register vehicle helper' do
    before(:each) do 
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle_helper 
      @facility_2.register_vehicle_helper
    end
    it 'creates an array to store registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it 'will only add an array if the facility offers vehicle registration' do
      expect(@facility_2.registered_vehicles).to eq(nil)
    end
  end

  describe '#collected_fees_helper' do
    it 'creates a variable to store collected fees' do
      @facility_1.collected_fees_helper
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  xdescribe '#register vehicle' do
    context 'before vehicles have been registered' do
      before(:each) do 
        @facility_1.add_service('Vehicle Registration')
      end
      it 'has an array to store registered vehicles' do
        expect
      end   
    end
  end
      
      
end
    # it 'keeps an array for registered Vehicles' do
    #   expect(facility.registered_vehicles).to eq([])
    # end 

    # it 'keep track of collected_fees' do
    #   expect(facility.registered_vehicles).to eq(0)
    # end

    # it 'will add registered Vehicles to the array' do
    #   @facility_1.register_vehicle(cruz)
    #   expect(facility.registered_vehicles).to eq([cruz])
    #   @facility_1.register_vehicle(bolt)
    #   expect(facility.registered_vehicles).to eq([cruz, bolt])
    # end

    # it 'will give the Vehicle a registration date' do
    #   @facility_1.register_vehicle(cruz)
    #   expect(cruz.registration_date).to be_an_instance_of(Date)
    # end

    # it 'assigns plates by type' do
    #   @facility_1.register_vehicle(cruz)
    #   @facility_1.register_vehicle(bolt)
    #   @facility_
    #   expect(cruz.plate_type).to eq(:regular)
    #   expect(bolt.plate_type).to eq(:ev)
    # end