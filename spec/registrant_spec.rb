require 'spec_helper'

RSpec.describe Registrant do
  describe "#exists" do
    it "exists" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      
      expect(registrant_1).to be_a(Registrant)
    end
  end
  
  describe "#has_readable_attributes" do
    it "has readable attributes" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      expect(registrant_2.name).to eq("Penny")
      expect(registrant_2.age).to eq(15)
      expect(registrant_2.permit?).to eq(false)
      expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "#earn_permit" do
    it "can return value of true when registrant earns permit" do
      registrant_2 = Registrant.new('Penny', 15 )
      registrant_2.earn_permit

      expect(registrant_2.permit?).to eq(true)
    end
  end

  describe "#administer_written_test" do
    it "can return a value of true when registrant passes written test" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_1.permit?).to eq(true)
      expect(facility_1.administer_written_test(registrant_1)).to eq(false)
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      facility_1.add_service('Written Test')

      expect(facility_1.administer_written_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to eq(false)
      expect(facility_1.administer_written_test(registrant_2)).to eq(false)

      registrant_2.earn_permit

      expect(facility_1.administer_written_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})

      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit?).to eq(false)
      expect(facility_1.administer_written_test(registrant_3)).to eq(false)

      registrant_3.earn_permit

      expect(facility_1.administer_written_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe "#administer_road_test" do
    it "can return a value of true when registrant takes road test to get license" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      
      registrant_2.earn_permit
      
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_written_test(registrant_2)
      
      expect(facility_1.administer_road_test(registrant_3)).to eq(false)
      
      registrant_3.earn_permit

      expect(facility_1.administer_road_test(registrant_3)).to eq(false)
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(facility_1.administer_road_test(registrant_1)).to eq(false)
      
      facility_1.add_service('Road Test')

      expect(facility_1.administer_road_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      expect(facility_1.administer_road_test(registrant_2)).to eq(true)
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
  end

  describe "#renew_drivers_license" do
    it "can return a value of true when registrant renews their license" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )
      
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      
      registrant_2.earn_permit
      registrant_3.earn_permit
      
      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)
      facility_1.administer_written_test(registrant_2)

      facility_1.add_service('Road Test')
      facility_1.administer_road_test(registrant_1)
      facility_1.administer_road_test(registrant_2)

      expect(facility_1.renew_drivers_license(registrant_1)).to eq(false)
      
      facility_1.add_service('Renew License')
      facility_1.renew_drivers_license(registrant_1)

      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      
      facility_1.renew_drivers_license(registrant_3)
      
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      facility_1.renew_drivers_license(registrant_2)
      
      expect(registrant_2.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end
end