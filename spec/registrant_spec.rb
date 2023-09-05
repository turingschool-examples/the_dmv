require 'spec_helper'
require './lib/registrant'


RSpec.describe Registrant do
  before :each do
    @registrant = Registrant.new(@name, @age)
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.name).to eq("Penny")
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'has a permit' do
      expect(@registrant_1.permit?).to be(true)
      expect(@registrant_2.permit?).to eq(false)
    end

    it 'earns a permit' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to eq(true)
    end
  end
end

RSpec.describe 'getting a drivers license' do
    before :each do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

  describe 'written test' do
    it 'can license a driver' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_2)).to be(false)
      @registrant_2.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to be(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      @registrant_3.earn_permit
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  
  describe 'road test' do
    it 'give a road test' do
      expect(@facility_1.administer_road_test(@registrant_3)).to be(false)
      @registrant_3.earn_permit
      expect(@facility_1.administer_road_test(@registrant_3)).to be(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@facility_1.administer_road_test(@registrant_1)).to be(false)
      @facility_1.add_service('Written Test')
      expect(@facility_1.add_service('Road Test')).to eq(["Written Test", "Road Test"])
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_road_test(@registrant_1)).to be(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      expect(@facility_1.administer_road_test(@registrant_2)).to be(true)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
    
    it 'can add renew drivers license to a facility' do
      expect(@facility_1.renew_drivers_license(@registrant_1)).to be(false)
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      expect(@facility_1.add_service("Renew License")).to eq(["Written Test", "Road Test", "Renew License"]) 
    end

    it 'can renew a drivers license' do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 16 )
      @facility_1.add_service("Written Test")
      @facility_1.add_service("Road Test")
      @facility_1.add_service("Renew License")

      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)
      
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      expect(@facility_1.renew_drivers_license(@registrant_3)).to be(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)
      @facility_1.renew_drivers_license(@registrant_2)
      expect(@facility_1.renew_drivers_license(@registrant_2)).to eq(true)
      expect(@registrant_2.license_data).to eq(@registrant_2.license_data)

    end
  end
  end
end

