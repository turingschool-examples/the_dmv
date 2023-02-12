class Analytics
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def most_popular_make_model
    "#{@source.most_popular_make} #{@source.most_popular_model}"

  end

  def most_popular_make
    # create hash with make as keys and occurences as values
    # iterate over array and increment count by one each time make(key) occurs
    # sort hash by number of ocurrences
    # return key with highest value and assign to make
    make_and_count = Hash.new(0)
    @source.each{|car| make_and_count[car[:make]] += 1}
    make_and_count.sort_by{|make, count| count}.last[0]
  end
end