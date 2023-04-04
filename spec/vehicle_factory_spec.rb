require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "Iteration 2: Reading external data sets" do
    it "exists" do
      factory = VehicleFactory.new

      expect(factory).to be_an_instance_of(VehicleFactory)
    end
    it "create vehicles using wa dmv data set" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      new_cars = factory.create_vehicles(wa_ev_registrations)
      
      expect(new_cars[0].engine).to eq(:ev)
      expect(new_cars[0].make).to eq("SMART")
      expect(new_cars[0].model).to eq("Fortwo Electric Drive")
      expect(new_cars[0].vin).to eq("WMEEJ9AA7E")
      expect(new_cars[0].year).to eq("2014")
      expect(new_cars[0].plate_type).to eq(nil)
      expect(new_cars[0].registration_date).to eq(nil)
      expect(new_cars[2].make).to eq("VOLKSWAGEN")
      expect(new_cars[3].model).to eq("e-Golf")
      expect(new_cars[4].vin).to eq("WVWKR7AU7K")
      expect(new_cars[6].year).to eq("2019")
      expect(factory.create_vehicles(wa_ev_registrations)[16].year).to eq("2013")
    end
  end
  
  describe "Iteration 4, option 2" do
    it "finds the most popular make registered" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations  

      expect(factory.most_popular(wa_ev_registrations)).to eq("TESLA")
    end
    
    it "Counts registered vehicle for a model year, returns as hash key = year, value equals count of registered vehicles for that year" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      count = factory.count_model_year(wa_ev_registrations)

      expect(factory.count_model_year(wa_ev_registrations)).to eq(count)
      expect(factory.count_model_year(wa_ev_registrations)).to eq({"2014"=>38, "2019"=>118, "2016"=>103, "2012"=>31, "2017"=>123, "2018"=>137, "2023"=>16, "2013"=>118, "2020"=>70, "2015"=>54, "2021"=>73, "2022"=>87, "2011"=>32})
    end
    
    it "finds county with most registered vehicles" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      expect(factory.most_registered_county(wa_ev_registrations)).to eq("King")
    end
    
    it "has a least popular make" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations  

      expect(factory.least_popular(wa_ev_registrations)).to eq("MITSUBISHI")
    end
    
    it "it finds the amount of cars registered by make, creates hash with key/value pairs" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      
      expect(factory.registered_by_make(wa_ev_registrations)).to eq({"SMART"=>7,
                                                                      "VOLKSWAGEN"=>32,
                                                                      "PORSCHE"=>3,
                                                                      "CHEVROLET"=>151,
                                                                      "TESLA"=>335,
                                                                      "MITSUBISHI"=>2,
                                                                      "NISSAN"=>228,
                                                                      "FORD"=>47,
                                                                      "AUDI"=>21,
                                                                      "CHRYSLER"=>14,
                                                                      "VOLVO"=>28,
                                                                      "TOYOTA"=>43,
                                                                      "BMW"=>41,
                                                                      "FIAT"=>7,
                                                                      "RIVIAN"=>2,
                                                                      "KIA"=>26,
                                                                      "JEEP"=>7,
                                                                      "CADILLAC"=>3,
                                                                      "HONDA"=>3})
    end
  end
end