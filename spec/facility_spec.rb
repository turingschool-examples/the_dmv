require 'spec_helper'
require 'pry'
require './lib/dmv'
require './lib/facility'
require './lib/registrant'
require './lib/vehicle'
require './lib/dmv_data_service'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})

    end
  end

  describe '#initialize' do
    it 'can initialize' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      expect(facility_1).to be_a(Facility)
      expect(facility_1.name).to eq('DMV Tremont Branch')
      expect(facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(facility_1.phone).to eq('(720) 865-4600')
      expect(facility_1.services).to eq([])

    end
  end

  describe '#add service' do
    it 'can add available services' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      expect(facility_1.services).to eq([])
      facility_1.add_service('New Drivers License')
      facility_1.add_service('Renew Drivers License')
      facility_1.add_service('Vehicle Registration')
      expect(facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])

    end

    it "counts registered vehicles" do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      expect(facility_1.registered_vehicles).to eq([])
    end

    it "counts collected fees" do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      expect(facility_1.collected_fees).to eq(0)
    end

    it "registers a vehicle" do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      facility_1.add_service('New Drivers License')
      facility_1.add_service('Renew Drivers License')
      facility_1.add_service('Vehicle Registration')

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(bolt)
      facility_1.register_vehicle(camaro)

      expect(facility_1.collected_fees).to eq(325)
    end

    it "can administer written test" do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      facility_1.add_service('Written Test')
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 16)
      registrant_2.earn_permit
      registrant_3 = Registrant.new('Tucker', 15)

      facility_1.administer_written_test(registrant_1)

      expect(facility_1.administer_written_test(registrant_1)).to be true
    end

    it "can administer road test" do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Written Test')
      facility_1.add_service('Road Test')
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 16)
      registrant_3 = Registrant.new('Tucker', 15)

      facility_1.administer_written_test(registrant_1)
      facility_1.administer_road_test(registrant_1)

      expect(facility_1.administer_road_test(registrant_1)).to be true
    end

    it "can renew one's license" do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_1.add_service('Written Test')
      facility_1.add_service('Road Test')
      facility_1.add_service('Renew License')
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 16)
      registrant_2.earn_permit
      registrant_3 = Registrant.new('Tucker', 15)

      facility_1.administer_written_test(registrant_1)
      facility_1.administer_road_test(registrant_1)
      facility_1.renew_drivers_license(registrant_1)
      facility_1.administer_written_test(registrant_2)
      facility_1.administer_road_test(registrant_2)
      facility_1.administer_written_test(registrant_3)
      facility_1.administer_road_test(registrant_3)

      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end

    it "has access to DMV Colorado locations" do
      colorado_facilities = DmvDataService.new.co_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(colorado_facilities).to be_a(Array)
    end

    it "has access to DMV New York locations" do
      colorado_facilities = DmvDataService.new.co_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(new_york_facilities).to be_a(Array)
    end

    it "has access to DMV Missouri locations" do
      colorado_facilities = DmvDataService.new.co_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(missouri_facilities).to be_a(Array)
    end

    it "can create facility instances from DMV data" do
      facility_list = Facility.new({})
      colorado_facilities = DmvDataService.new.co_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      facility_list.create_facility(colorado_facilities)
      binding.pry
      expect(facility_new.create_facility(colorado_facilities)).to be_a(Array)
    end

end
