require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new({vin_number: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin_number: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin_number: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin_number).to eq('123456789abcdefgh')
      expect(@cruz.year).to eq(2012)
      expect(@cruz.make).to eq('Chevrolet')
      expect(@cruz.model).to eq('Cruz')
      expect(@cruz.engine).to eq(:ice)
      expect(@cruz.registration_date).to eq(nil)
    end
  end

  describe '#antique?' do
    it 'can determine if a vehicle is an antique' do
      expect(@cruz.antique?).to eq(false)
      expect(@bolt.antique?).to eq(false)
      expect(@camaro.antique?).to eq(true)
    end
  end

  describe '#electric_vehicle?' do
    it 'can determine if a vehicle is an ev' do
      expect(@cruz.electric_vehicle?).to eq(false)
      expect(@bolt.electric_vehicle?).to eq(true)
      expect(@camaro.electric_vehicle?).to eq(false)
    end
  end

  describe '#registration_date' do
    it 'start as nil' do
      expect(@cruz.registration_date).to eq nil
    end

    it 'changes to the vehicle type when registered' do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_1.add_service('Vehicle Registration')
      
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq :regular

      @facility_1.register_vehicle(@camaro)

      expect(@camaro.plate_type).to eq :antique
    end
  end
  
  describe '#change_plate_type' do
    it 'change the vehicle plate to regular type when vehicle registered' do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq :regular   
    end

    it 'change the vehicle plate to ev type when vehicle registered' do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@bolt.plate_type).to eq :ev   
    end

    it 'change the vehicle plate to antique type when vehicle registered' do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@camaro.plate_type).to eq :antique  
    end
  end

  describe '#register' do
    it 'can register vehicle' do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@camaro.registration_date).to eq (Date.today)

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq (Date.today)
    end
  end
end
