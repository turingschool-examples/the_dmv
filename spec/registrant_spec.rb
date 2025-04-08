require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
  describe '#initialize' do
    it 'exists' do
      registrant = Registrant.new("Bruce", 18, true)
      expect(registrant).to be_a(Registrant)
    end
  end

  describe '#permit?' do
    it 'returns the permit statu' do
      registrant = Registrant.new('Bruce', 18, true) # Ensure permit is passed here
      expect(registrant.permit?).to be true
    end
  end

  describe '#earn_permit' do
    it 'allows a registrant to earn their permit' do
      registrant = Registrant.new('Penny', 15, false) # Pass false for permit
      expect(registrant.permit?).to be false
      registrant.earn_permit
      expect(registrant.permit?).to be true
    end
  end
end