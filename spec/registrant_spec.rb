require './lib/registrant'
require './spec_helper'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true)
        @registrant_2 = Registrant.new('Penny', 16)
        @registrant_3 = Registrant.new('Tucker', 15)
        @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
        @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    end 

    describe '#initialize' do
        it 'can initialize' do
            expect(@registrant_1).to be_a(Registrant)
            expect(@registrant_2).to be_a(Registrant)
            expect(@registrant_3).to be_a(Registrant) 
            expect(@facility_1).to be_a(Facility) 
            expect(@facility_2).to be_a(Facility)  
        end
    end 

    describe '#check atributes for registrants' do
        it 'can check attributes for registrants' do
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_1.permit).to eq(true)
            expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

            expect(@registrant_2.name).to eq('Penny')
            expect(@registrant_2.age).to eq(16)
            expect(@registrant_2.permit).to eq(false)
            expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

            expect(@registrant_3.name).to eq('Tucker')
            expect(@registrant_3.age).to eq(15)
            expect(@registrant_3.permit).to eq(false)
            expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end 

    describe '#can change permit status when permit is earned' do
        it 'can change permit status when permit is earned' do 
            expect(@registrant_1.permit).to eq(true)   
            expect(@registrant_2.permit).to eq(false)
            expect(@registrant_3.permit).to eq (false)
            @registrant_2.earn_permit
            @registrant_3.earn_permit
            expect(@registrant_1.permit).to eq(true)   
            expect(@registrant_2.permit).to eq(true)
            expect(@registrant_3.permit).to eq(true) 
        end
    end

    describe '#administer written tests' do 
        it 'can administer a written test' do
             expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
             expect(@registrant_1.permit?).to eq(true)
             expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
             expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
             expect(@facility_1.add_service('Written Test')).to eq(["Written Test"])
             expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
             expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

             expect(@registrant_2.age).to eq(16)
             expect(@registrant_2.permit?).to eq(false)
             expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
             @registrant_2.earn_permit
             expect(@facility_1.administer_written_test(@registrant_2)).to eq(true) 
             expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

             expect(@registrant_3.age).to eq(15)
             expect(@registrant_3.permit?).to eq(false)
             expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
             @registrant_3.earn_permit
             expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
             expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end 
    end 

    describe '#administer road test' do
        it 'can administer a road test' do
            expect(@facility_1.administer_road_test(@registrant_1)).to eq(false)
            expect(@facility_1.add_service('Road Test')).to eq(["Written Test", "Road Test"])
            expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
            expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})

            expect(@facility_1.administer_road_test(@registrant_2)).to eq(true)
            expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
        end
    end 

    describe '#renew license' do 
        it 'can renew a license' do
            expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(false)
            expect(@facility_1.add_service('Renew License')).to eq(["Written Test", "Road Test", "Renew License"])
            expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(tue)
            expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})

            expect(@facility_1.renew_drivers_license(@registrant_3)).to eq(false)
            expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(@facility_1.renew_drivers_license(@registrant_2)).to eq(true)
            expect(@registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
        end
    end
end 