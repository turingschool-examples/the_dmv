require './lib/registrant'

RSpec.describe Registrant do
  let(:registrant_1) { Registrant.new('Bruce', 18, true ) }
  let(:registrant_2) { Registrant.new('Penny', 15 ) }

  describe '#initialize' do
    it 'exitsts' do
      expect(registrant_1).to be_an_instance_of(Registrant)
      expect(registrant_2).to be_an_instance_of(Registrant)
    end

    it 'has attributes' do
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to be(true)

      expect(registrant_2.name).to eq('Penny')
      expect(registrant_2.age).to eq(15)
      expect(registrant_2.permit?).to be(false)
    end

    it 'licensed_data is all false by default' do
      expect(registrant_1.license_data).to eq({ 
        written: false, 
        license: false, 
        renewed: false 
      })
    end
  end
end