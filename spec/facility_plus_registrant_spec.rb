require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'creates a facility' do
      expect(@facility.name).to eq('DMV Tremont Branch')
    end
  end

  describe '#administer_written_test' do
    it 'returns true and updates license_data when permit is earned' do
      registrant = Registrant.new('Penny', 16)
      @facility.add_service('Written Test')
      expect(@facility.administer_written_test(registrant)).to eq(true)
      expect(registrant.license_data[:written]).to eq(true)
    end
  end

  describe '#administer_road_test' do
    it 'returns true and updates license_data when license is earned' do
      registrant = Registrant.new('John', 18)
      @facility.add_service('Road Test')
      expect(@facility.administer_road_test(registrant)).to eq(true)
      expect(registrant.license_data[:license]).to eq(true)
    end
  end

  describe '#renew_drivers_license' do
    it 'returns true and updates license_data when license is renewed' do
      registrant = Registrant.new('Rose', 21)
      @facility.add_service('Renew License')
      expect(@facility.renew_drivers_license(registrant)).to eq(true)
      expect(registrant.license_data[:renewed]).to eq(true)
    end
  end
end
