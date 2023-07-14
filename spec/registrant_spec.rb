require './lib/registrant'
require './lib/facility'

RSpec.describe Registrant do
    before(:each) do
      @registrant1 = Registrant.new('Bruce', 18, true)
      @registrant2 = Registrant.new('Penny', 16)
      @registrant3 = Registrant.new('Tucker', 15 )

      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end
    describe '#initialize' do
      it 'can initialize' do
        expect(@registrant1).to be_an_instance_of(Registrant)
        expect(@registrant1.name).to eq('Bruce')
        expect(@registrant1.age).to eq(18)
        expect(@registrant1.permit).to eq(true)
        expect(@registrant1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    end

    describe '#permit?' do
      it 'can return the state of the permit' do
        expect(@registrant1.permit?).to eq(true)
      end
    end

    describe '#earn_permit' do
      it 'can earn permit' do
        expect(@registrant2.permit?).to eq(false)

        @registrant2.earn_permit
        expect(@registrant2.permit?).to eq(true)
      end
    end

    describe '#administer_written_test' do
      it 'can administer a written test only if: person is 16yo>=, have a permit and the facility offers the service' do
        expect(@facility_1.administer_written_test(@registrant1)).to eq(false)
        expect(@registrant1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

        @facility_1.add_service("Written Test")
        expect(@facility_1.administer_written_test(@registrant1)).to eq(true)
        expect(@registrant1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end

      it 'can utilize one facility for multiple people' do 
        @facility_1.add_service("Written Test")
        expect(@facility_1.administer_written_test(@registrant1)).to eq(true)
        expect(@registrant1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

        expect(@facility_1.administer_written_test(@registrant2)).to eq(false)
        @registrant2.earn_permit
        expect(@facility_1.administer_written_test(@registrant2)).to eq(true)
        expect(@registrant2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

        expect(@facility_1.administer_written_test(@registrant3)).to eq(false)
        @registrant3.earn_permit
        expect(@facility_1.administer_written_test(@registrant3)).to eq(false)
        expect(@registrant3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      end
    end
end