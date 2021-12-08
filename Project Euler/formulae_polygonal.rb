module FormulaePolygonal
  def triangle_number(num)
    num * (num + 1) / 2
  end

  def square_number(num)
    num**2
  end

  def pentagonal_number(num)
    num * ((3 * num) - 1) / 2
  end

  def hexagonal_number(num)
    num * ((2 * num) - 1)
  end

  def heptagonal_number(num)
    num * ((5 * num) - 3) / 2
  end

  def octagonal_number(num)
    num * ((3 * num) - 2)
  end
end
