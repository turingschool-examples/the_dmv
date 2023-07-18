class LotteryTracker
  attr_reader :dataset

  #get_all_numbers => array of arrays
  #winning_numbers_by_column => hash of hashes
  #most_likely_number => string
  def initialize(dataset)
    @dataset = dataset
  end

  def get_all_numbers
    @dataset.map do |draw|
      draw[:winning_numbers].split
    end
  end
end