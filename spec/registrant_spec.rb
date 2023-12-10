require 'spec_helper'
require "rspec"
require "./lib/registrant.rb"

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end
    describe "#Initialize" do
    it "exists, has a name, age and reads if has a permit" do
        expect(@registrant_1).to be_an_instance_of(Registrant)
        expect(@registrant_1.name).to eq ("Bruce")
        expect(@registrant_2).to be_an_instance_of(Registrant)
        expect(@registrant_2.age).to eq (15)
        expect(@registrant_1.permit).to eq(true)
    end
    it "returns license process data" do
        expect(@registrant_2.license_data).to eq ({written: false, license: false, renewed: false})
    end
    end
    describe "#Can earn a permit" do
    it "evaluates if the registrant has permit, and after earning the permit upgrades attribute status" do
        expect(@registrant_2.permit?).to eq (false)
        @registrant_2.earn_permit
        expect(@registrant_2.permit?).to eq (true)
    end
    end
    describe "#can change license data attributes" do
    it "can change license data when passes the written test" do
        @registrant_1.pass_written_test
        expect(@registrant_1.license_data).to eq ({written: true, license: false, renewed: false})
    end
    it "can change license data when passes the road test" do
        @registrant_1.pass_written_test
        @registrant_1.pass_road_test
        expect(@registrant_1.license_data).to eq ({written: true, license: true, renewed: false})
    end
    it "earns permit when it passes the road_test" do
        @registrant_1.pass_written_test
        @registrant_1.pass_road_test
        expect(@registrant_1.permit?).to eq (true)
    end
    it "can change license data when it renews the license" do
        @registrant_1.pass_written_test
        @registrant_1.pass_road_test
        @registrant_1.renew_license
        expect(@registrant_1.license_data).to eq ({written: true, license: true, renewed: true})
    end
    end
end