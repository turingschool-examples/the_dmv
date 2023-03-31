require 'spec_helper'

RSpec.describe Registrant do
  describe "Iteration 1" do
    it "exists" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1).to be_a(Registrant)
      expect(registrant_2).to be_a(Registrant)
    end

    it "has attributes" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_2.name).to eq('Penny')
      expect(registrant_1.age).to eq(18)
      expect(registrant_2.age).to eq(15)
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(false)
    end

    it "has list of license data" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it "can earn_permit" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      registrant_2.earn_permit

      expect(registrant_2.permit?).to eq(true)
    end
  end
  describe "iteration 2" do
    it "license_data :written updated" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)

      expect(registrant_1.license_data).to eq({:written => true, :license => false, :renewed => false})
      
      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to eq(false)

      registrant_2.earn_permit
      facility_1.administer_written_test(registrant_2)

      expect(registrant_2.permit?).to eq(true)
      expect(registrant_2.license_data).to eq({:written => true, :license => false, :renewed => false})

      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit?).to eq(false)

      registrant_3.earn_permit
      facility_1.administer_written_test(registrant_3)

      expect(registrant_3.license_data).to eq({:written => false, :license => false, :renewed => false})
    end

    it "license_data :license updated" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)

    end
  end
end






