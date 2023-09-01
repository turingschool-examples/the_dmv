req 'spec_helper'

RSpec.describe Registrant do
  let(:registrant_1) { Registrant.new('Bruce', 18, true)}
  let(:registrant_2) { Registrant.new('Penny', 15)}

  describe '#initialize' do
    it "can initialize" do
      expect(registrant_1).to be_instance_of(Registrant)
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit).to eq(true)
      expect(registrant_1.license_data).to be_instance_of(Hash)
    end
  end

  describe '#permit?' do
    it "Returns the value of a registrants permit attribute" do
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(false)
    end
  end

  describe '#earn_permit' do
    it 'has a permit that defaults to false' do
      expect(registrant_2.permit?).to eq(false)
    end

    it 'will change the value of permit to true' do
      registrant_2.earn_permit
      expect(registrant_2.permit?).to eq(true)
    end
  end

end