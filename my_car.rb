#Copyright (c) 2022 Claudio Martínez Ortiz

class MyCar

  attr_accessor :color, :speed, :ignition
  attr_reader :make, :model, :year

  def initialize(mk, md, y, c)
    @make = mk
    @model = md
    @year = y
    self.color = c
    self.speed = 0
    self.ignition = false

  end

  def info

    "\nYour car is a #{color} #{make} #{model} #{year}"

  end

  def status

    #Car going at n speed, stopped but engine going or completely stopped
    if self.ignition == true && self.speed != 0

      "\nYour car is going at #{speed}km/h"

    elsif self.ignition == true

      "\nYour car is running on standby"

    else

      "\nYour car is parked and the engine is off"

    end

  end

  def start

    #start engine
    if self.ignition == false

      self.ignition = true

    else puts start_error

    end

  end

  def stop

    #stop engine
    if self.ignition == true

      self.ignition = false

    else puts stop_error

    end

  end

  def accelerate(kmhm)

    if self.ignition == true

      self.speed += kmhm

    else puts ignition_error

    end
  
  end

  def brake(kmhm)

    if self.speed > 0 && self.speed - kmhm > 0

      self.speed -= kmhm

    elsif self.speed > 0

      self.speed = 0

    else car_stopped_error

    end
  
  end

  def start_error

    puts "\nCar engine is alreaady started"

  end

  def stop_error

    puts "\nCar engine is already off"

  end

  def ignition_error

    puts "\nCan't accelerate with the car engine off"
 
  end

  def car_stopped_error

    puts "\nCar is already stopped"

  end

  def spray_paint(paint)

    self.color = paint

  end

end

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