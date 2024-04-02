require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Registrant do

  describe '#initialize' do
    it 'can initialize' do
      registrant_1 = Registrant.new('Bruce', 18, true)
      registrant_2 = Registrant.new('Penny', 16 )
      registrant_3 = Registrant.new('Tucker', 15 )

      expect(registrant_1).to be_instance_of(Registrant)
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to eq true
      expect(registrant_1.license_data?).to eq ({:written=>false, :license=>false, :renewed=>false})
      
      expect(registrant_2).to be_instance_of(Registrant)
      expect(registrant_2.name).to eq('Penny')
      expect(registrant_2.age).to eq(16)
      expect(registrant_2.permit?).to eq false
      expect(registrant_2.license_data?).to eq ({:written=>false, :license=>false, :renewed=>false})
      
      expect(registrant_3).to be_instance_of(Registrant)
      expect(registrant_3.name).to eq('Tucker')
      expect(registrant_3.age).to eq(15)
      expect(registrant_3.permit?).to eq false
      expect(registrant_3.license_data?).to eq ({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#permit?' do
    it 'can earn permit' do
      registrant_2 = Registrant.new('Penny', 15 )

      expect(registrant_2.permit?).to be false
      registrant_2.earn_permit
      expect(registrant_2.permit?).to be true
    end
  end

  describe '#license_data?' do
    it 'can provide license data' do
      registrant_3 = Registrant.new('Tucker', 15 )
      expect(registrant_3.license_data?).to eq ({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#earn_permit' do
    it 'can earn permit' do
      registrant_3 = Registrant.new('Tucker', 15 )
      registrant_3.earn_permit
      expect(registrant_3.permit).to be true
    end
  end

  describe '#written_test_complete' do
    it 'can update lisense data' do
      registrant_3 = Registrant.new('Tucker', 15 )
      registrant_3.written_test_complete
      expect(registrant_3.license_data?).to eq ({:written=>true, :license=>false, :renewed=>false})
    end
  end

  describe '#road_test_complete' do
    it 'can update lisense data' do
      registrant_3 = Registrant.new('Tucker', 15 )
      registrant_3.road_test_complete
      expect(registrant_3.license_data?).to eq ({:written=>false, :license=>true, :renewed=>false})
    end
  end

  describe '#renewed_drivers_license' do
    it 'can update lisense data' do
      registrant_3 = Registrant.new('Tucker', 15 )
      registrant_3.renewed_drivers_license
      expect(registrant_3.license_data?).to eq ({:written=>false, :license=>false, :renewed=>true})
    end
  end

end