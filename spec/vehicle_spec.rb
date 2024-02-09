require 'spec_helper'

RSpec.describe Vehicle do
  let (:facility_1) { Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'}) }
  let (:facility_2) { Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'}) }
  let (:cruz) { Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice}) }
  let (:bolt) { Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev}) }
  let (:camaro) { Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice}) }
  describe '#initialize' do
    it 'can initialize' do
      expect(cruz).to be_an_instance_of(Vehicle)
      expect(cruz.vin).to eq('123456789abcdefgh')
      expect(cruz.year).to eq(2012)
      expect(cruz.make).to eq('Chevrolet')
      expect(cruz.model).to eq('Cruz')
      expect(cruz.engine).to eq(:ice)
      expect(cruz.registration_date).to eq(nil)
    end
  end

  describe '#antique?' do
    it 'can determine if a vehicle is an antique' do
      expect(cruz.antique?).to eq(false)
      expect(bolt.antique?).to eq(false)
      expect(camaro.antique?).to eq(true)
    end
  end

  describe '#electric_vehicle?' do
    it 'can determine if a vehicle is an ev' do
      expect(cruz.electric_vehicle?).to eq(false)
      expect(bolt.electric_vehicle?).to eq(true)
      expect(camaro.electric_vehicle?).to eq(false)
    end
  end

  describe 'vehicle registration' do
    it 'can update its registration date to today' do
      expect(cruz.registration_date).to eq(nil)

      cruz.update_registration_date

      expect(cruz.registration_date).to eq(Date.today)
    end

    it 'can update its plate type' do
      expect(cruz.plate_type).to eq(nil)
      expect(bolt.plate_type).to eq(nil)
      expect(camaro.plate_type).to eq(nil)

      cruz.update_plate_type
      bolt.update_plate_type
      camaro.update_plate_type

      expect(cruz.plate_type).to eq(:regular)
      expect(bolt.plate_type).to eq(:ev)
      expect(camaro.plate_type).to eq(:antique)
    end
  end
end
