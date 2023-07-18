class LotteryTracker
  attr_reader :dataset

  def initialize(dataset)
    @dataset = dataset
  end

  def get_all_numbers
    @dataset.map do |draw|
      draw[:winning_numbers].split
    end
  end

  def winning_numbers_by_column
    number_array = get_all_numbers
    {
      column_1: number_array.map { |winning_numbers| winning_numbers[0] }.sort.tally,
      column_2: number_array.map { |winning_numbers| winning_numbers[1] }.sort.tally,
      column_3: number_array.map { |winning_numbers| winning_numbers[2] }.sort.tally,
      column_4: number_array.map { |winning_numbers| winning_numbers[3] }.sort.tally,
      column_5: number_array.map { |winning_numbers| winning_numbers[4] }.sort.tally,
      column_6: number_array.map { |winning_numbers| winning_numbers[5] }.sort.tally
    }
  end

  def get_likely_pairs
    most_likely_values = []
    numbers_by_column = winning_numbers_by_column
    numbers_by_column.each do |column|
      most_likely_values << column[1].max_by {|key, value| value}
    end
    most_likely_values
  end

  def most_likely_number
    get_likely_pairs.map {|value| value[0]}.join(" ")
  end

  def most_likely_with_percent
    get_likely_pairs.map do |pair|
      draw_percent = "#{(pair[1] / 10.0)}%"
      [pair[0], draw_percent]
    end
  end

  def get_total_chance
    percentages = get_likely_pairs.map {|column| column[1]}
    total_chance = 1.0
    percentages.each {|percent| total_chance = total_chance * (percent / 1000.0)}
    (total_chance * 100.0).round(10)
  end
end