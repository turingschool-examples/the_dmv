require 'spec_helper'

RSpec.describe Registrant do
	it "exist" do
		registrant_1 = Registrant.new('Bruce', 18, true )
		registrant_2 = Registrant.new('Penny', 15 )
		
		expect(registrant_1).to be_an_instance_of (Registrant)
		expect(registrant_2).to be_an_instance_of (Registrant)
	end

	it "has readable attributes" do
		registrant_1 = Registrant.new('Bruce', 18, true )
		registrant_2 = Registrant.new('Penny', 15 )
		
		expect(registrant_1.name).to eq ("Bruce")
		expect(registrant_1.age).to eq (18)
		expect(registrant_1.permit?).to eq (true)
		expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
	
		expect(registrant_2.name).to eq ("Penny")
		expect(registrant_2.age).to eq (15)
		expect(registrant_2.permit?).to eq (false)
		expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
	end

	describe "earn_permit method" do
		it "allows registrant to earn permit" do
			registrant_1 = Registrant.new('Bruce', 18, true )
			registrant_2 = Registrant.new('Penny', 15 )
		
			expect(registrant_2.permit?).to eq(false)
			registrant_2.earn_permit
			expect(registrant_2.permit?).to eq(true)
		end
	end
end