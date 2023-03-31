class Registrant
  attr_reader :name, :age, :permit
  def initialize(name, age, permit = false, written_status = false, license_status = false, license_renewal_status = false )
    @name = name
    @age = age
    @permit = permit
    @written_status = written_status
    @license_status = license_status
    @license_renewal_status =license_renewal_status
  end

  def permit?
    @permit
  end
  
  def license_data
    {:written => @written_status, :license => @license_status, :renewed => @license_renewal_status}
  end

  def earn_permit
    @permit = true
  end
end