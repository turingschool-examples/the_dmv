require '/lib/dmv'
require '/lib/facility'
require '/lib/vehicle'
require '/lib/dmv_data_service'
require '/lib/vehicle_factory'

Class Registrant
  attr_reader :name, :age, :permit, :license_data

  def initialize(name, age, permit)
    @name = name
    @age = age
    @permit = permit
    @license_data = {}
  end

  def permit?
    permit == true
  end

  def earn_permit
    permit = true
  end