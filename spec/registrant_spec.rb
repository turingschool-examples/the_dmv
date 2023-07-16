require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant = Registrant.new('', 0, false)
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_1.add_services('New Drivers License')
    @facility_1.add_services('Renew Drivers License')
    @facility_2.add_services('New Drivers License')
    @facility_2.add_services('Road Test')
    @facility_2.add_services('Written Test')
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant).to be_an_instance_of(Registrant)
    end
  end

  describe '#has attributes' do
    it 'registrant 1 has attributes' do
      expect(@registrant_1).to eq(@registrant_1)
    end
  end

  describe '#has attributes' do
    it 'registrant 2 has attributes' do
      expect(@registrant_2).to eq(@registrant_2)
    end
  end

  describe '#earned permit method works' do
    it 'earned permit method works' do
      expect(@registrant_2.permit?).to be(false)
      @registrant_2.earn_permit
      # require 'pry' ; binding.pry
      expect(@registrant_2.permit?).to be(true)
    end
  end

  # Written Test Iteration 2 Portion

  describe '#registrant 1 license data returns all false' do
    it '#registrant 1 license data returns all false' do
      # require 'pry' ; binding.pry
      expect(@registrant_1.license_data).to include({written: false,
        license: false,
        renewed: false})
      expect(@registrant_1.permit?).to eq(true)
    end
  end

  describe '#facility 1 administers written test 1' do
    it '#facility 1 administers written test 1' do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      # require 'pry' ; binding.pry
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
    end
  end
end

# pull test