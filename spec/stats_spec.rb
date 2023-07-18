require_relative 'spec_helper'

describe Stats do
  stats = Stats.new
  describe "#most_popular_make_model" do
    it "returns an array containing a string and an integer" do

      expect(stats.most_popular_make_model).to be_a Array
      expect(stats.most_popular_make_model[0]).to be_a String
      expect(stats.most_popular_make_model[1]).to be_a Integer
    end
  end

  describe "#vehicles_registered_by_year" do
    it "returns a Hash whith all values being an integer" do

      expect(stats.vehicles_registered_by_year).to be_a Hash
      expect(stats.vehicles_registered_by_year.values).to all be_a Integer
    end
  end

  describe "#most_registrations_by_county" do
    it "returns an array containing a string and an integer" do

      expect(stats.most_registrations_by_county).to be_a Array
      expect(stats.most_registrations_by_county[0]).to be_a String
      expect(stats.most_registrations_by_county[1]).to be_a Integer
    end
  end
end