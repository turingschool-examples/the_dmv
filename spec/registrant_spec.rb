require 'spec_helper'

RSpec.describe Registrant do
  describe '#initialize' do
    it 'can initialize' do
      registrant_1 = Registrant.new("Bruce", 18, true)
      registrant_2 = Registrant.new("Penny", 15)
      expect(registrant_1).to be_a(Registrant)
    end

    it 'has a name, age, and a default permit value of false' do
      registrant_1 = Registrant.new("Bruce", 18, true)
      registrant_2 = Registrant.new("Penny", 15)
      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)
      expect(registrant_2.permit).to eq(false)
    end

    it 'has a permit? method that checks if the registrant has a permit' do
      registrant_1 = Registrant.new("Bruce", 18, true)
      registrant_2 = Registrant.new("Penny", 15)
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(false)
    end

    it 'has an empty hash with license data in it' do
      registrant_1 = Registrant.new("Bruce", 18, true)
      registrant_2 = Registrant.new("Penny", 15)
      expected = {
        written: false,
        license: false,
        renewed: false
      }
      expect(registrant_1.license_data).to eq(expected)
    end
  end

  describe '#earn_permit' do
    it 'can allow registrant to earn permit if age 16 or above' do
      registrant_2 = Registrant.new("Penny", 15)
      registrant_3 = Registrant.new("Otis", 16)
      expect(registrant_2.earn_permit).to eq "Registrant is not yet old enough to earn permit."
      expect(registrant_3.permit?).to eq false
      registrant_3.earn_permit
      expect(registrant_3.permit?).to eq true
    end
  end
end