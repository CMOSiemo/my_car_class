#Copyright (c) 2022 Claudio Martínez Ortiz

class Student

  attr_accessor :name

  def initialize(n, g)

    name = n
    @grade = g

  end

  def better_grade_than?(rival)

    nota > rival.nota

  end

  protected

  def nota
    
    @grade

  end

end

perico = Student.new("Perico", 6)
fulano = Student.new("Fulano", 5)
puts perico.better_grade_than?(fulano)

