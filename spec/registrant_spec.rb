require './lib/registrant'

RSpec.describe Registrant do
    before(:each) do
      @registrant1 = Registrant.new('Bruce', 18, true)
      @registrant2 = Registrant.new('Penny', 15)
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
end