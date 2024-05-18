require 'spec_helper'

RSpec.describe Registrant do
  describe '#initialize' do
    it 'can initialize' do
     registrant = Registrant.new('Bill', 25, true)
     expect(registrant).to be_an_instance_of(Registrant)
     expect(registrant.name).to eq('Bill')
     expect(registrant.age).to eq(25)
     expect(registrant.permit?).to eq(true)
    end
  end

  describe '#permit?' do
    it 'returns permit status' do
     registrant = Registrant.new('Bill', 25, true)
     expect(registrant.permit?).to eq(true)
    end
  end

  describe '#earn_permit' do
    it 'can earn a permit' do
     registrant = Registrant.new('Bill', 15)
     expect(registrant.permit?).to eq(false)
     registrant.earn_permit
     expect(registrant.permit?).to eq(true)
    end
  end

  describe '#license_data' do
    it 'returns license data' do
     registrant = Registrant.new('Bill', 25, true)
     expect(registrant.license_data).to eq({written: false, license: false, renewed: false})
    end
  end
end


