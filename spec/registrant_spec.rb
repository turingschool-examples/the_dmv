require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant)
    end
  end

  describe '#age' do
    it 'can print the age' do
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end
  end

  describe '#permit?' do
    it 'can show if registrant has a permit or not' do
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_2.permit?).to eq(false)
    end
  end

  describe '#earn_permit' do
    it 'can give a registrant a permit' do
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be(true)
    end
  end

  describe "#administer_written_test" do
    it "gives a written test to the registrant" do
      @facility_1.administer_written_test(@registrant_1)
      expect(@facility_1.administer_written_test(@registrant_1)).to be(false)

      @facility_1.add_service("Written Test")
      expect(@facility_1.administer_written_test(@registrant_1)).to be(true)
    end
  end
end

