require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @tesla_1 = Vehicle.new ({vin: '1981598', year:2020, make:"Tesla", model:"Model 3", engine: :ev})
    @tesla_2 = Vehicle.new ({vin: '251929492', year:2023, make:"Tesla", model:"Model Y", engine: :ev})
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @registrant_4 = Registrant.new('Sara', 27, false )
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end

    it "starts with no registered vehicles and no collected fees" do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#add service' do
    it "can add available services" do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
    it "can't execute services not available" do
    expect(@facility_2.services).to eq([])
    expect(@facility_2.register_vehicle(@bolt)).to eq (nil)
    expect(@facility_2.registered_vehicles).to eq([])
    expect(@facility_2.collected_fees).to eq(0)
    expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
    expect(@facility_1.administer_road_test(@registrant_2)).to eq(false)
    expect(@facility_1.renew_drivers_license(@registrant_3)).to eq(false)
    end
  end

  describe "#register a vehicle" do
    it "can register a vehicle" do
      @facility_1.add_service('Vehicle Registration')
      expect(@cruz.registration_date).to eq (nil)
      expect(@facility_1.registered_vehicles).to eq []
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq (Date.today)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'can collect corresponding fees' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end
  describe "#issue drivers license and guarantee requirements are met" do
    it "guarantees requirements to administer written test are met" do
      expect(@registrant_1.license_data).to eq ({written: false, license: false, renewed: false})
      expect(@registrant_1.permit?).to eq (true)
      
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_written_test(@registrant_2)

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)
      expect(@registrant_1.license_data).to eq ({written: true, license: false, renewed: false})
      expect(@registrant_2.license_data).to eq ({written: true, license: false, renewed: false})

      expect(@registrant_3.age).to eq (15)
      expect(@registrant_3.permit?).to eq (false)
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq ({written: false, license: false, renewed: false})
    end
    it "guarantees requirements to administer road test are met" do
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Written Test')
      
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      expect(@registrant_1.license_data).to eq ({written: true, license: true, renewed: false})

      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)
      expect(@registrant_2.license_data).to eq ({written: true, license: true, renewed: false})
    end

    it "guarantees requirements to renew a driver's license are met" do
      
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Written Test')
      
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)
      expect(@registrant_1.license_data).to eq ({written: true, license: true, renewed: false})
      
      @facility_1.add_service('Renew License')

      expect(@facility_1.administer_road_test(@registrant_4)).to eq(false)
      expect(@facility_1.renew_drivers_license(@registrant_4)).to eq(false)
      expect(@registrant_4.license_data).to eq ({written: false, license: false, renewed: false})

      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.renew_drivers_license(@registrant_1)
      expect(@registrant_1.license_data).to eq ({written: true, license: true, renewed: true})

      expect(@facility_1.renew_drivers_license(@registrant_3)).to eq (false)
      expect(@registrant_3.license_data).to eq ({written: false, license: false, renewed: false})
      
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)
      @facility_1.renew_drivers_license(@registrant_2)
      expect(@registrant_2.license_data).to eq ({written: true, license: true, renewed: true})
    end
  end

  describe "#EV analytics" do
    it "can populate the ev vehicles registered" do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@tesla_1)
      @facility_1.register_vehicle(@tesla_2)
      expect(@facility_1.ev_vehicles_registered).to eq ([@bolt, @tesla_1, @tesla_2])
    end

    it "can populate the registered ev vehicle makes" do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@tesla_1)
      @facility_1.register_vehicle(@tesla_2)
      expect(@facility_1.reg_ev_vehicles_makes).to eq (["Chevrolet", "Tesla", "Tesla"])
    end

    it "can return the most popular make registered in a facility" do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@tesla_1)
      @facility_1.register_vehicle(@tesla_2)
     #require 'pry'; binding.pry
      expect(@facility_1.ev_registration_analytics).to eq ("The most popular vehicle make registered in DMV Tremont Branch facility was Tesla")
    end
  end
end
