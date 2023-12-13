require 'spec_helper'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @registrant = Registrant.new("Bruce", 18, true)
    @regular_vehicle = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @antique_vehicle = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @ev_vehicle = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
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
   
    it 'registers a new vehicle and assigns plate type' do
      @facility.register_vehicle(@registrant, @regular_vehicle)
      expect(@regular_vehicle).to be_an_instance_of(Vehicle)
      expect(@registrant.vehicles).to eq([@regular_vehicle])
      expect(@regular_vehicle.plate_type).to eq(:regular)
      expect(@registrant.balance).to eq(100)
      expect(@registrant.permit?).to be true
    end

    # it 'registers an antique vehicle' do
    #   @facility.register_vehicle(@registrant, @antique_vehicle)
    #   expect(@registrant.vehicles).to eq([@antique_vehicle])
    #  # expect(@antique_vehicle).to be_an_instance_of(Vehicle)
    #   #expect(@antique_vehicle.plate_type).to eq(:antique)
    #   expect(@registrant.balance).to eq(25)
    #   #expect(@registrant.permit?).to be true
    # end

    it ' registers an electric vehicle' do
      @facility.register_vehicle(@registrant, @ev_vehicle)
      expect(@ev_vehicle).to be_an_instance_of(Vehicle)
      expect(@registrant.vehicles).to eq([@ev_vehicle])
      expect(@registrant.balance).to eq(200)
      expect(@ev_vehicle.plate_type).to eq(:ev)
      #expect(@registrant.permit?).to be true
    end
  end








end
