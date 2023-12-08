require './lib/registrant'

describe Registrant do
   before(:each) do
      @bruce = Registrant.new('Bruce', 18, true)
      @penny = Registrant.new('Penny', 15)
      @tucker = Registrant.new('Tucker', 15)
   end

   describe 'initialize' do
      it 'exists' do
         expect(@bruce).to be_a Registrant
      end

      it 'has a name' do
         expect(@bruce.name).to eq "Bruce"

         expect(@penny.name).to eq "Penny"
      end

      it 'has an age' do
         expect(@bruce.age).to eq 18

         expect(@penny.age).to eq 15
      end

      it 'can have a permit' do 
         expect(@bruce.permit?).to eq true

         expect(@penny.permit?).to eq false
      end

      it 'has license-data' do
         expect(@bruce.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
      end
   end

   describe '#earn_permit' do
      it 'allow registrant to get permit' do
         expect(@penny.permit?).to eq false

         @penny.earn_permit

         expect(@penny.permit?).to eq true
      end
   end

   describe 'can update its license data' do
      it 'can administer a written test' do
         facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
         facility_1.add_service('Written Test')
         expect(facility_1.administer_written_test(@bruce)).to eq true
         expect(@bruce.license_data).to eq ({:written=>true, :license=>false, :renewed=>false})
      end

      it 'can administer a road test' do
         facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
         facility_1.add_service('Written Test')
         expect(facility_1.administer_written_test(@bruce)).to eq true
         expect(@bruce.license_data).to eq ({:written=>true, :license=>false, :renewed=>false})
         
         facility_1.add_service('Road Test')
         expect(facility_1.administer_road_test(@bruce)).to eq true
         expect(@bruce.license_data).to eq ({:written=>true, :license=>true, :renewed=>false})
      end
   end
end