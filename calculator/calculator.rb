class Calculator
  def initialize
    @total = 0
  end

  def total
    @total
  end

  def add(num)
    @total += num
  end

  def clear
    @total = 0
  end

  def subtract(num)
    @total -= num
  end
end
