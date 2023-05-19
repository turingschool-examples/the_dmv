require 'spec_helper'


RSpec.describe Facility do
  describe 'initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "services" do
    it "can register vehicles and store them" do 
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)
      @facility.register_vehicle(@camaro)
      expect(@facility.registered_vehicles).to eq([@cruz, @bolt, @camaro])      
    end

    it "can collect fees and total them" do 
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)
      @facility.register_vehicle(@camaro)
      expect(@facility.collected_fees).to eq(325) 
    end 

    it "can administer written_test to qualified registrants" do 
      expect(@facility.administer_written_test(@penny)).to eq("Penny does not qualify for written test.")
      expect(@bruce.license_data[:written]).to be false 
      @facility.administer_written_test(@bruce)
      expect(@bruce.license_data[:written]).to be true 
    end 

  end 
end
