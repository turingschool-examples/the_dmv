class FacilityInfo
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def daily_hours
    @source.map do |facility|
      facility.select{|key, value| key.to_s.include?('day')}
    end
    # format days and times?
  end
end