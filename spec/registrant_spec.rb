require './lib/registrant'

RSpec.describe Registrant do
  let(:registrant_1) { Registrant.new('Bruce', 18, true) }
  let(:registrant_2) { Registrant.new('Penny', 15) }
  let(:registrant_3) { Registrant.new('Tucker', 15) }
  let(:facility_1) { Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'}) }
  let(:facility_2) { Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'}) }

  describe '#initialize' do
    it 'is an instance of Registrant' do
      expect(registrant_1).to be_a (Registrant)
    end

    it 'has a name' do
      expect(registrant_1.name).to eq ("Bruce")
    end

    it 'has an age' do
      expect(registrant_1.age).to eq (18)
    end

    it 'has a license data' do
      expect(registrant_1.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#permit?' do
    it "has a permit that set to true if specified" do
      expect(registrant_1.permit?).to eq (true)
    end

    it "has a permit that set to false by default" do
      expect(registrant_2.permit?).to eq (false)
    end
  end

  describe '#earn_permit' do
    it "change a permit from false to true" do
      registrant_2.earn_permit
      expect(registrant_2.permit).to eq (true)
    end
  end
end
