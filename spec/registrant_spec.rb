require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 16 )
        @registrant_3 = Registrant.new('Tucker', 15 )
        @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
        @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

    end
    describe '#initialize' do
        it 'can initialize' do
            expect(@registrant_1).to be_an_instance_of Registrant
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end
    describe '#permit?' do
        it 'returns true if the registrant has permit' do
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.permit?).to eq(false)
        end
    end
    describe '#earn_permit' do
        it "updates 'permit' to true" do
            expect(@registrant_2.permit?).to eq(false)
            @registrant_2.earn_permit
            expect(@registrant_2.permit?).to eq(true)
        end

        it 'cannot #earn_permit if age < 16' do
            @facility_1.add_service('Written Test')
            expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)

            @registrant_3.earn_permit
            expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
            expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end

end