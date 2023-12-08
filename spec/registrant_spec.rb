require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end
  
    describe '#initialize' do
      it 'can initialize' do
        expect(@registrant_1).to be_an_instance_of(Registrant)
      end

      it 'has an name' do
        expect(@registrant_2.name).to eq ("Penny")
      end

      it 'has an age' do
        expect(@registrant_1.age).to eq (18)
      end

      it 'has license data' do
        expect(@registrant_2.license_data).to eq ({written:false, license:false, renewed:false})
      end
    end

    describe '#permit?' do
        it 'does it have a permit?' do
            expect(@registrant_1.permit?).to eq (true)
        end
    end
end