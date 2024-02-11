require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    
    @new_york_facilities = Facility.new(DmvDataService.new.ny_dmv_office_locations)
    @facility_co = Facility.new(DmvDataService.new.co_dmv_office_locations)
    @facility_mo = Facility.new(DmvDataService.new.mo_dmv_office_locations)
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@new_york_facilities).to be_an_instance_of(Facility)
      expect(@@new_york_facilities.name).to eq()
      expect(@@new_york_facilities.address).to eq()
      expect(@@new_york_facilities.phone).to eq()
      expect(@@new_york_facilities.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@@new_york_facilities.services).to eq([])
      @@new_york_facilities.add_service('New Drivers License')
      @@new_york_facilities.add_service('Renew Drivers License')
      @@new_york_facilities.add_service('Vehicle Registration')
      expect(@@new_york_facilities.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register vehicle' do
    it 'contains registery of vehicles' do
      expect(@@new_york_facilities.registered_vehicles).to eq([])
    end

    it 'collects fees' do
      expect(@@new_york_facilities.collected_fees).to eq(0)
    end

    it 'can register vehicles' do
      day = Date.today
     
      @@new_york_facilities.add_service('Vehicle Registration')
      expect(@@new_york_facilities.register_vehicle(@cruz)).to eq([@cruz])
      expect(@cruz.registration_date).to eq(day)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@@new_york_facilities.registered_vehicles).to eq([@cruz])
      expect(@@new_york_facilities.collected_fees).to eq(100)
    end

  end

end
