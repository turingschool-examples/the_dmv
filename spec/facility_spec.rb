require 'spec_helper'


RSpec.describe Facility do
  describe 'initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
      expect(@facility.services).to eq([])
      expect(@facility.website).to be nil
      expect(@facility.type).to be nil
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      expect(@facility.add_service("ALL THE SERVICES")).to eq ("Invalid entry. Services offered are: Road Test, Written Test, Renew License, Vehicle Registration")
      @facility.add_service('Road Test')
      @facility.add_service('Written Test')
      @facility.add_service('Renew License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['Road Test', "Written Test", 'Renew License', 'Vehicle Registration'])
    end
  end

  describe "services" do
    it "can register vehicles and store them" do 
      expect(@facility.register_vehicle(@bolt)).to eq("Service not available at selected location.")
      @facility.add_service("Vehicle Registration")
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)
      @facility.register_vehicle(@camaro)
      expect(@facility.registered_vehicles).to eq([@cruz, @bolt, @camaro])      
    end

    it "can record the registration date" do 
      @facility.add_service("Vehicle Registration")
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today.strftime("%Y-%m-%d"))
    end 

    it "can collect fees and total them" do 
      @facility.add_service("Vehicle Registration")
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)
      @facility.register_vehicle(@camaro)
      expect(@facility.collected_fees).to eq(325) 
    end 

    it "can administer written_test to qualified registrants" do 
      expect(@facility.administer_written_test(@registrant_1)).to eq("Service not available at selected location.")
      @facility.add_service('Written Test')
      expect(@facility.administer_written_test(@registrant_2)).to eq("Penny does not qualify for written test.")
      expect(@registrant_1.license_data[:written]).to be false 
      @facility.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data[:written]).to be true 
    end 

    it "can administer road test to qualified registrants" do 
      expect(@facility.administer_road_test(@registrant_1)).to eq("Service not available at selected location.")
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      expect(@facility.administer_road_test(@registrant_2)).to eq("Penny does not qualify for road test.")
      expect(@registrant_1.license_data[:drivers_license]).to be false 
      @facility.administer_written_test(@registrant_1)
      @facility.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data[:drivers_license]).to be true  
    end 

    it "can renew license for qualified registrants" do 
      expect(@facility.renew_drivers_license(@registrant_1)).to eq("Service not available at selected location.")
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      expect(@facility.renew_drivers_license(@registrant_1)).to eq("Service not available at selected location.")
      @facility.add_service('Renew License')
      expect(@facility.renew_drivers_license(@registrant_2)).to eq("Penny does not qualify for license renewal.")
      expect(@registrant_1.license_data[:renewed]).to be false 
      @facility.administer_written_test(@registrant_1)
      @facility.administer_road_test(@registrant_1)
      @facility.renew_drivers_license(@registrant_1)
      expect(@registrant_1.license_data[:renewed]).to be true  
    end 
  end 
end
