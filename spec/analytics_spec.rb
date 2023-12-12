require "rspec"
require "./lib/vehicle"
require "./lib/facility"
require "./lib/analytics"

RSpec.describe Analytics do

    before(:each) do
        @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
        @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
        @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
        @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
        @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
        @tesla_1 = Vehicle.new ({vin: '1981598', year:2020, make:"Tesla", model:"Model 3", engine: :ev})
        @tesla_2 = Vehicle.new ({vin: '251929492', year:2023, make:"Tesla", model:"Model Y", engine: :ev})
        @tesla_3= Vehicle.new ({vin: '5YJ3E1EC6L', year:2020, make:"Tesla", model:"Model 3", engine: :ev})
        @facility_1.add_service('Vehicle Registration')
        @facility_1.register_vehicle(@cruz)
        @facility_1.register_vehicle(@camaro)
        @facility_1.register_vehicle(@bolt)
        @facility_1.register_vehicle(@tesla_1)
        @facility_1.register_vehicle(@tesla_2)
        @facility_1.register_vehicle(@tesla_3)
        @analytics = Analytics.new(@facility_1)
      end

    describe "#Initialize" do
      it "exists and starts with no ev_vehicles registered" do
        expect(@analytics).to be_a(Analytics)
        expect(@analytics.ev_vehicles).to eq ([])
        expect(@analytics.facility).to eq (@facility_1)
      end
      it "brings registered vehicles array when instantiated" do  
        expect(@analytics.facility.registered_vehicles).to eq ([@cruz, @camaro, @bolt, @tesla_1, @tesla_2, @tesla_3])      
      end
    end

    describe "Find the most popular make/model registered" do
      it "can populate the ev vehicles registered" do   
        expect(@analytics.ev_vehicles_registered).to eq ([@bolt, @tesla_1, @tesla_2, @tesla_3])
      end

      it "can populate the registered ev vehicle makes" do
        expect(@analytics.reg_ev_vehicles_makes).to eq (["Chevrolet", "Tesla", "Tesla", "Tesla"])
      end

      it "can return the most popular make registered in a facility" do
        expected = "The most popular vehicle make registered in DMV Tremont Branch facility was Tesla"
        expect(@analytics.ev_registration_analytics).to eq (expected)
      end
    end
    describe "Find the most popular make/model registered" do
      it "can populate model year for every EV vehicle" do
        expect(@analytics.ev_modelyear). to eq(["bolt_2019", "model3_2020", "modelY_2023","model3_2020"])
      end
      it "can count the registered EV vehicles for a model year" do
        expect(@analytics.ev_modelyear_count). to eq({bolt_2019: 1, model3_2020: 2, modelY_2023: 1})
      end
    end
end

