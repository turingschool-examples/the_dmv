class Registrant
  attr_reader :name, :age, :permit, :license_data

  # Initializes a registrant with a name, age, and permit status
  # Cannot make this a keyword argument because of the way the workflow
  # is set up in the iteration instructions.
  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = { written: false, license: false, renewed: false }
  end

  # Changes permit status to true
  def earn_permit
    @permit = true
  end

  # Returns true if registrant has a permit, false otherwise
  def permit?
    @permit
  end

  # Changes written test status to true
  def administer_written_test
    @license_data[:written] = true
  end

  # Returns true if registrant has taken written test, false otherwise
  def written_test?
    @license_data[:written]
  end

  # Changes road test status to true
  def administer_road_test
    @license_data[:license] = true
  end

  # Returns true if registrant has taken road test, false otherwise
  def road_test?
    @license_data[:license]
  end

  # Changes license status to true
  def renew_drivers_license
    @license_data[:renewed] = true
  end

  # Returns true if registrant has renewed license, false otherwise
  def renewed_drivers_license?
    @license_data[:renewed]
  end
end
