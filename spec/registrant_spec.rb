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
end