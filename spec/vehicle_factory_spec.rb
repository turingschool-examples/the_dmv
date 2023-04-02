require 'spec_helper'

RSpec.describe VehicleFactory do
  # require 'pry'; binding.pry
  before(:each) do
    
    @factory = VehicleFactory.new 
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations

  end
    
  describe "Vehicle Factory" do
    
    it "exists" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
    
    it "has a database to access" do
      
      expect(@factory.database).to eq(@wa_ev_registrations)
      expect(@factory.database).to be_an(Array)
      
    end
  end
  
  describe "create_vehicles method" do 
    
    it "has an empty, accessible place to store the cars it's made" do
      expect(@factory.new_vehicles).to be_empty
    end
    
    it "can make a new vehicle with an engine type default to :ev" do
      @factory.create_vehicles
      expect(@factory.new_vehicles[0].engine).to eq(:ev)
    end
    
    it "make a new vehicle with a default make of nil" do
      @factory.create_vehicles
      expect(@factory.new_vehicles[0].make).to eq(nil)

    end

    it "make a new vehicle with a default model of nil" do
      @factory.create_vehicles
      expect(@factory.new_vehicles[0].model).to eq(nil)

    end

    it "make a new vehicle with a default vin of nil" do
      @factory.create_vehicles
      expect(@factory.new_vehicles[0].vin).to eq(nil)

    end

    it "make a new vehicle with a default year of nil" do
      @factory.create_vehicles
      expect(@factory.new_vehicles[0].year).to eq(nil)

    end

    it "make a new vehicle with a default plate_type of nil?" do
      @factory.create_vehicles
      expect(@factory.new_vehicles[0].plate_type).to eq(nil)

    end

    it "make a new vehicle with a default registration_date of nil" do
      @factory.create_vehicles
      expect(@factory.new_vehicles[0].registration_date).to eq(nil)

    end

    it "does" do
      @factory.create_vehicles

      # require 'pry'; binding.pry
    end
    
    # xit "" do
    #   expect(@factory.create_vehicles(wa_ev_registrations)).to eq("SMART")
    #   expect(@factory.model).to eq(nil)
    # end
    
    # xit "plate_type" do
    #   expect(@factory.plate_type).to eq(nil)
    # end
    
    # xit "registration date" do
    #   expect(@factory.registration_date).to eq(nil)
    # end
    
    # xit "vin number defaults to nil" do
    #   expect(@factory.vin).to eq(nil)
    # end
    
    # xit "year defaults to nil" do
    #   expect(@factory.year).to eq(nil)
    # end
    
    # xit "can make a vehicle with a make from the database " do 
      
      
    #   expect(@factory.make).to eq("SMART")
      
    # end
    
    # xit "can create vehicles from the washington data base?" do
    #   #expected (is going to be)= an array of vehicles with specific attributes:
    #   # @engine, @make, @model, @plate_type, @registration_date, @vin, @year, 
    #   # one test per method
      
    #   #I think this is the end goal...call create_vehicles with the database as an argument
    #   #and it will make multiple vehicles with the specific data we want, from the database we're accessing
    #   #In order to do that we need to make sure each specific data point is accessible
    #   # expect(@factory.create_vehicles(wa_ev_registrations)).to eq(...)
    #   #=> [#<Vehicle:0x000000012d3812f0 @engine=:ev, @make="TOYOTA", @model="Prius Plug-in", @plate_type=nil, @registration_date=nil, @vin="JTDKN3DP8D", @year="2013">,
    #   #<Vehicle:0x000000012d3812a0 @engine=:ev, @make="TOYOTA", @model="Prius Prime", @plate_type=nil, @registration_date=nil, @vin="JTDKARFP9J", @year="2018">,
    #   #<Vehicle:0x000000012d381200 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
    #   #<Vehicle:0x000000012d381188 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
    #   #<Vehicle:0x000000012d381138 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
    #   # ...]
      
    # end
    
    # xit "initial data from interaction pattern" do 
    #   #   wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    #   #
    #   #  [{:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
    #   #    :vin_1_10=>"JTDKN3DP8D",
    #   #    :dol_vehicle_id=>"229686908",
    #   #    :model_year=>"2013",
    #   #    :make=>"TOYOTA",
    #   #    :model=>"Prius Plug-in",
    #   #    ...},
    #   #    ...,
    #   #    {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
    #   #     :vin_1_10=>"1G1RD6E47D",
    #   #     :dol_vehicle_id=>"289314742",
    #   #     :model_year=>"2013",
    #   #     :make=>"CHEVROLET",
    #   #     :model=>"Volt",
    #   #     ...}]
      
    # end
    
  end
      
      
    
    
    

end