require './spec/spec_helper'

class Registrant
  attr_reader :name, :age, :permit, :license_data

  def initialize(name, age, permit=false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written => false, :license => false, :renewed => false}
  end

  def permit?
    @permit
  end

  def earned_permit
    @permit = true
  end
end

r1 = Registrant.new('Bruce', 18, true )
r2 = Registrant.new('Penny', 15 )
pry.binding