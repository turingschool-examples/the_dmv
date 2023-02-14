class FacilityInfo
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def daily_hours
    if @source.size == 169
      @source.map do |facility|
        facility.select{|key, value| key.to_s.include?('day')}
      end
      # format days and times?
    elsif @source.size == 178
      @source.map {|facility| facility[:daysopen]}
    end
  end

  def holidays_closed
    if @source.size == 178
      @source.map {|facility| facility[:holidaysclosed]}
    else
      'Information not available.'
    end
  end
end