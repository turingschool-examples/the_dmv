require 'spec_helper'

RSpec.describe Registrant do

    before (:each) do
        @registrant = Registrant.new('Bruce', 18, true)
    end

    it "should have a name" do
        expect(@registrant.name).to eq('Bruce')
    end

    it "should have an age" do
        expect(@registrant.age).to eq(18)
    end

    it "should have a permit" do
        expect(@registrant.permit).to eq(true)
    end

    it "should have license data" do
        expect(@registrant.license_data).to eq({ written: false, license: false, renewed: false })
    end

    it "should earn permit" do
        expect(@registrant.earn_permit).to be true
    end


end