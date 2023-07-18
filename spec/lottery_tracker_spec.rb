require './lib/lottery_data_service'
require './lib/lottery_tracker'

RSpec.describe LotteryTracker do
  describe "#initialize" do
    it "exists" do
      tracker = LotteryTracker.new("placeholder")

      expect(tracker).to be_a LotteryTracker
    end

    it "has a dataset on initialize" do
      tracker = LotteryTracker.new(LotteryDataService.new.ny_lottery_data)
      
      expect(tracker.dataset).to be_an Array
      expect(tracker.dataset).to_not be_empty
    end
  end
  
  describe "#get_all_numbers" do
    it "returns an array of all winning numbers formatted in arrays" do
      tracker = LotteryTracker.new(LotteryDataService.new.ny_lottery_data)
      
      expect(tracker.get_all_numbers).to be_an Array
      expect(tracker.get_all_numbers.size).to be_an Integer
      expect(tracker.get_all_numbers.first).to be_an Array
    end
  end
  
  describe "#winning_numbers_by_column" do
    it "returns a hash of each columns winning numbers tallied" do
      tracker = LotteryTracker.new(LotteryDataService.new.ny_lottery_data)
      wins_by_column = tracker.winning_numbers_by_column(tracker.get_all_numbers)
      
      expect(wins_by_column).to be_a Hash
      expect(wins_by_column.key?(:column_1)).to be true
      expect(wins_by_column.size).to be(6)
    end
  end
  
  describe "#most_likely_number" do
    it "returns a string of the most likely number based on recent drawings" do
      tracker = LotteryTracker.new(LotteryDataService.new.ny_lottery_data)
      wins_by_column = tracker.winning_numbers_by_column(tracker.get_all_numbers)

      expect(tracker.most_likely_number).to be_a String
      expect(tracker.most_likely_number.size).to eq(17)
      # require 'pry';binding.pry
    end
  end
end