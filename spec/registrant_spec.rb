require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
    end

    it 'has attributes' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      expect(@registrant_2.name).to eq('Penny')
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.permit?).to eq(false)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#earn_permit' do
    it 'changes permit status from false to true' do
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be(true)
    end
  end

  describe  'administers a written test' do 
    describe 'administers a written test for registrant 1' do
      it 'checks license data' do 
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'checks permit status' do 
        expect(@registrant_1.permit?).to be(true)
      end

      it "does not offer administered written test as a service" do 
        expect(@facility_1.administer_written_test(@registrant_1)).to be(false)
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'adds administering written test as a service' do 
        expect(@facility_1.add_service('Written Test')).to eq(['Written Test'])
        expect(@facility_1.administer_written_test(@registrant_1)).to be(true)
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end
    end
  
    describe 'administers a written test for registrant 2' do
      before(:each) do
        @facility_1.add_service('Written Test')
        @registrant_2 = Registrant.new('Penny', 16 )
      end

        it '#age' do 
        expect(@registrant_2.age).to eq(16)
        end

        it '#permit?' do 
        expect(@registrant_2.permit?).to be(false)
        end

        it '#administer_written_test(registrant)' do 
        expect(@facility_1.administer_written_test(@registrant_2)).to be(false)
        end

        it 'only permit holders can be administered a written test' do 
          expect(@registrant_2.permit?).to be(false)
          @registrant_2.earn_permit
          expect(@facility_1.administer_written_test(@registrant_2)).to be(true)
          expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
        end
    end
  

    describe 'administers a written test for registrant 3' do 
      it '#age' do 
      expect(@registrant_3.age).to eq(15)
      end

      it '#permit?' do 
      expect(@registrant_3.permit?).to be(false)
      end

      it '#administer_written_test(registrant)' do 
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
      end

      it 'only permit holders can be administered a written test' do
        expect(@registrant_3.permit?).to be(false)
        @registrant_3.earn_permit
        expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
        expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    end
  end

  describe 'road test' do
    before(:each) do
      @facility_1.add_service('Written Test')
      @registrant_2 = Registrant.new('Penny', 16 )
      @facility_1.administer_written_test(@registrant_1)
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
    end

    describe 'does not offer road tests as a service for anyone' do
      it 'does not offer road tests as a service for permit-holders' do 
          expect(@facility_1.administer_road_test(@registrant_3)).to be(false)
          @registrant_3.earn_permit
          expect(@facility_1.administer_road_test(@registrant_3)).to be(false)
          expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end

      it 'does not offer road tests as a service to people with a passing written test' do
        expect(@facility_1.administer_road_test(@registrant_1)).to be(false)
      end

      it 'adds road test as a provided service' do 
        expect(@facility_1.add_service('Road Test')).to eq(["Written Test", "Road Test"])
      end
    end

    describe 'road test for registrant 1 and registrant 2' do
      before(:each) do
        @facility_1.add_service('Road Test')
      end

      it '#administer_road_test' do 
      expect(@facility_1.administer_road_test(@registrant_1)).to be(true)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end

      it 'adminsters road test for registrant 2 and updates license data' do
        expect(@facility_1.administer_road_test(@registrant_2)).to be(true)
        expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end

    end
  end

  describe 'renew license' do
    before (:each) do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
    end


    describe 'does not offer license renewal as a provided service' do
      it 'does not offer license renewal as a provided service' do
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be(false)
      end
    end


    describe 'adds license renewal service' do 
      it 'adds license renewal service ' do
        expect(@facility_1.add_service('Renew License')).to eq(['Written Test', 'Road Test', 'Renew License'])
      end
    end

    describe 'allows license holders who meet requirements to renew ' do
      before(:each) do
        @facility_1.add_service('Renew License')
      end

      it 'renews the license of registrant 1' do
        # expect(@facility_1.services).to eq(["Written Test", "Road Test", "Renew License"])
        expect(@facility_1.renew_drivers_license(@registrant_1)).to be(true)
        expect(@registrant_1.license_data).to eq({:license=>true, :renewed=>true, :written=>true})
      end

      it 'does not renew the license of registrant 3' do
        expect(@facility_1.services).to eq(["Written Test", "Road Test", "Renew License"])
        expect(@facility_1.renew_drivers_license(@registrant_3)).to be(false)
        expect(@registrant_3.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
        # expect(@registrant_1.license_data).to eq({:license=>true, :renewed=>true, :written=>true})
      end

    
    end 

    
  end


end