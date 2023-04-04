class Registrant
  attr_reader :name,
              :age,
              :license_data

  def initialize(name, age, permit = false)
  @name         = name
  @age          = age
  @permit       = permit
  @license_data = {
    written: false,
    license: false,
    renewed: false
  }
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

  def update_written_test_status
    if permit?
      @license_data[:written] = true
    else
      nil
    end
  end

  def update_license_status
    if @license_data[:written] = true
      @license_data[:license] = true
    else 
      nil
    end
  end

  def update_renew_status
    if @license_data[:license] = true
      @license_data[:renewed] = true
    else
      nil
    end
  end

end