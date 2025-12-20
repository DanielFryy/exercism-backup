defmodule Secrets do
  def secret_add(secret) do
    fn value -> secret + value end
  end

  def secret_subtract(secret) do
    fn value -> value - secret end
  end

  def secret_multiply(secret) do
    fn value -> value * secret end
  end

  def secret_divide(secret) do
    fn value -> Integer.floor_div(value, secret) end
  end

  def secret_and(secret) do
    fn value -> Bitwise.band(secret, value) end
  end

  def secret_xor(secret) do
    fn value -> Bitwise.bxor(secret, value) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn value ->
      res = secret_function1.(value) 
      secret_function2.(res)
    end
  end
end
