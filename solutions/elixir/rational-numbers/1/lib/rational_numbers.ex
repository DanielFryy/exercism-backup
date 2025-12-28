defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  1/2 + 2/3 = 
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a, b}, {c, d}) do
    denominator = cond do
      b === d -> b
      true -> b * d
    end
    numerator = (div(denominator, b) * a) + (div(denominator, d) * c)
    reduce({numerator, denominator})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a, b}, {c, d}) do
    denominator = cond do
      b === d -> b
      true -> b * d
    end
    numerator = (div(denominator, b) * a) - (div(denominator, d) * c)
    reduce({numerator, denominator})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a, b}, {c, d}) do
    reduce({a * c, b * d})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a, b}, {c, d}) do
    reduce({a * d, b * c})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    numerator = cond do
      a < 0 -> -1 * a
      true -> a
    end
    denominator = cond do
      b < 0 -> -1 * b
      true -> b
    end
    reduce({numerator, denominator})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) do
    numerator = cond do
      n < 0 -> b ** Kernel.abs(n)
      true -> a ** n
    end
    denominator = cond do
      n < 0 -> a ** Kernel.abs(n)
      true -> b ** n
    end
    reduce({numerator, denominator})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    (x ** a) ** (1 / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    {numerator, denominator} = cond do
      b < 0 -> {-1 * a, -1 * b}
      true -> {a, b}
    end
    gcd = Integer.gcd(numerator, denominator)
    {div(numerator, gcd), div(denominator, gcd)}
  end
end
