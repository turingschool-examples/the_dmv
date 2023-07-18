require 'spec_helper'
require "./lib/registrant"

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new(name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600')
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
    it "adds vehicle to facilities registered vehicles list" do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      expect(@facility.register_vehicle(@cruz)).to eq("This facility does not register vehicles.")
      expect(@facility.collected_fees).to eq(0)
      @facility.add_service('Vehicle Registration')    
      
      expect(@facility.register_vehicle(@cruz)).to eq([@cruz])
      expect(@facility.collected_fees).to eq(100)
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe "#administer_written_test" do
    it "changes written data" do
      reg_1 = Registrant.new("Bruce", 18, true)
      
      expect(reg_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @facility.add_service('Written Test')
      @facility.administer_written_test(reg_1)

      expect(reg_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end

  describe "#administer_road_test" do
    it "changes license data" do
      reg_1 = Registrant.new("Bruce", 18, true)
      @facility.add_service('Written Test')
      @facility.administer_written_test(reg_1)

      expect(reg_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      @facility.add_service('Road Test')
      @facility.administer_road_test(reg_1)

      expect(reg_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe "#renew_drivers_license" do
    it "changes renewed data" do
      reg_1 = Registrant.new("Bruce", 18, true)
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.administer_written_test(reg_1)
      @facility.administer_road_test(reg_1)

      expect(reg_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})

      @facility.add_service('Renew License')
      @facility.renew_drivers_license(reg_1)

      expect(reg_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end

  describe '#create_facility' do
    it "creats new facility from API data" do
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      new_co_facilities = @facility.create_facility(co_dmv_office_locations) 

      expect(new_facilities).to eq([co_dmv_office_locations])
    end
  end
end
