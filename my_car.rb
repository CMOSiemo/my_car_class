#Copyright (c) 2022 Claudio Martínez Ortiz

module Towable
  
  # Couldn't think of a cool, simple functionality to add with module
  def can_tow?(pounds)

    pounds < 2000

  end

end

class Vehicle

  # Getters and setters
  attr_accessor :color, :speed, :ignition
  attr_reader :make, :model, :year

  # Instance counter
  @@vehicles = 0

  def initialize(mk, md, y, c)

    # Instance attributes
    @make = mk
    @model = md
    @year = y
    self.color = c
    self.speed = 0
    self.ignition = false
    @@vehicles += 1

  end

  def info(vehicle)

    # Returns general mostly immutable info on vehicle
    "\nYour #{vehicle} is a #{color} #{make} #{model} #{year}"

  end

  def status(vehicle)

    # Returns current engine and speed status of vehicle
    if self.ignition == true && self.speed != 0

      "\nYour #{vehicle} is going at #{speed}km/h"

    elsif self.ignition == true

      "\nYour #{vehicle} is running on standby"

    else

      "\nYour #{vehicle} is parked and the engine is off"

    end

  end

  def age(vehicle)

    # Returns age of vehicle
    "Your #{vehicle} is #{years} years old"

  end

  def start(vehicle)

    # Starts engine
    if self.ignition == false

      self.ignition = true

    else puts start_error(vehicle)

    end

  end

  def stop(vehicle)

    # Stops engine
    if self.ignition == true

      self.ignition = false

    else puts stop_error(vehicle)

    end

  end

  def accelerate(kmhm, vehicle)

    # Pretty self explanatory
    if self.ignition == true

      self.speed += kmhm

    else puts ignition_error(vehicle)

    end
  
  end

  def brake(kmhm, vehicle)

    # Same as above
    if self.speed > 0 && self.speed - kmhm > 0

      self.speed -= kmhm

    elsif self.speed > 0

      self.speed = 0

    else vehicle_stopped_error(vehicle)

    end
  
  end

  def spray_paint(paint, vehicle)

    # Painting car
    self.color = paint
    puts "You have painted your #{vehicle} #{paint}"

  end

  def self.mileage(liters, km, vehicle)

    # Mileage class method, but in kilometers. Kilometerage
    puts "#{km / liters} kilometers per liter of gas"

  end

  def to_s(vehicle = "vehicle")

    # Replace to_s method
    "My #{vehicle} is a #{color} #{make} #{model} #{year}"

  end

  private

  def self.ammount

    # Returns vehicles counter
    @@vehicles

  end

  def years

  # Returns age of vehicle
  Time.now.year - year

  end

  def start_error(vehicle)

    # Self explanatory
    puts "\n#{vehicle.capitalize} engine is already started"

  end

  def stop_error(vehicle)

    puts "\n#{vehicle.capitalize} engine is already off"

  end

  def ignition_error(vehicle)

    puts "\nCan't accelerate with the #{vehicle} engine off"
 
  end

  def vehicle_stopped_error(vehicle)

    puts "\n#{vehicle.capitalize} is already stopped"

  end

end


class MyCar < Vehicle

  # Most methods replace parent class methods but invoke them passing the TYPE
  # constant of the subclass
  TYPE = "car"

  def initialize(mk, md, y, c)

    super(mk, md, y, c)

  end

  def info

    super(TYPE)

  end

  def status

    super(TYPE)

  end

  def age

    super(TYPE)

  end

  def start

    super(TYPE)

  end

  def stop

    super(TYPE)

  end

  def accelerate(kmhm)

    super(kmhm, TYPE)
  
  end

  def brake(kmhm)

    super(kmhm, TYPE)
  
  end

  def spray_paint(paint)

    super(paint, TYPE)

  end

  def self.mileage(liters, km)

    super(liters, km, TYPE)

  end

  def to_s

    super(TYPE)

  end

end

class MyTruck < Vehicle

  # Same as MyCar but includes Towable module
  include Towable
  TYPE = "truck"

  def initialize(mk, md, y, c)

    super(mk, md, y, c)

  end

  def info

    super(TYPE)

  end

  def status

    super(TYPE)

  end

  def age

    super(TYPE)

  end

  def start

    super(TYPE)

  end

  def stop

    super(TYPE)

  end

  def accelerate(kmhm)

    super(kmhm, TYPE)
  
  end

  def brake(kmhm)

    super(kmhm, TYPE)
  
  end

  def spray_paint(paint)

    super(paint, TYPE)

  end

  def self.mileage(liters, km)

    super(liters, km, TYPE)

  end

  def to_s

    super(TYPE)

  end

end

# Tests
tocomocho = MyCar.new("Suzuki", "Baleno", 2019, "grey")
puts tocomocho.info
puts tocomocho.status
tocomocho.start
puts tocomocho.status
tocomocho.accelerate(60)
puts tocomocho.status
tocomocho.brake(20)
puts tocomocho.status
tocomocho.accelerate(80)
puts tocomocho.status
tocomocho.brake(40)
puts tocomocho.status
tocomocho.brake(40)
puts tocomocho.status
tocomocho.brake(100)
puts tocomocho.status
puts tocomocho.start
puts tocomocho.brake(10)
tocomocho.stop
puts tocomocho.status
tocomocho.accelerate(60)
tocomocho.stop
tocomocho.spray_paint("red")
puts tocomocho.info
MyCar.mileage(20, 300)
puts tocomocho
yunta = MyTruck.new("Mitsubishi", "L200", 2020, "white")
puts yunta.info
puts yunta.status
yunta.start
puts yunta.status
yunta.accelerate(70)
puts yunta.status
yunta.brake(20)
puts yunta.status
yunta.accelerate(30)
puts yunta.status
yunta.brake(40)
puts yunta.status
yunta.brake(20)
puts yunta.status
yunta.brake(100)
puts yunta.status
puts yunta.start
puts yunta.brake(20)
yunta.stop
puts yunta.status
yunta.accelerate(80)
yunta.stop
yunta.spray_paint("black")
puts yunta.info
MyTruck.mileage(30, 600)
puts yunta
puts yunta.can_tow?(1500)
puts yunta.can_tow?(20000)
puts Vehicle.ammount
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors
puts tocomocho.age
puts yunta.age