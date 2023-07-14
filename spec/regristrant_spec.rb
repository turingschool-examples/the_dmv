require 'spec_helper'

RSpec.describe Registrant do
  describe "iteration 1" do
    before (:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true )
      @registrant_2 = Registrant.new('Penny', 15 )
    end

    it "exists" do
      expect(@registrant_1).to be_a(Registrant)
      expect(@registrant_2).to be_a(Registrant)
    end

    it "has readable attributes" do
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.name).to eq("Penny")
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.permit?).to eq(false)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to eq(true)
    end
  end

  # describe "iteration 2.2" do
  #   before (:each) do
  #     @registrant_1 = Registrant.new('Bruce', 18, true )
  #     @registrant_2 = Registrant.new('Penny', 16 )
  #     @registrant_3 = Registrant.new('Tucker', 15 )
  #     #is there a quick way to use entered code accross spec files
  #     @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  #     @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  #   end

  #   it ".administer_written_test" do
  #     expect(@registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
  #     expect(@registrant_1.permit?).to eq(true)
  #     expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
  #   end

  end

end
