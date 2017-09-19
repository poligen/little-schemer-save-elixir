defmodule Schemers.Shadows do
  def numberred?([ left, operator, right ]) do
    numberred?(left) && validate(operator) && numberred?(right)
  end

  def numberred?(n), do: is_number(n)

  defp validate(:+), do: true 
  defp validate(:*), do: true 
  defp validate(:^), do: true 
  defp validate(_), do: false 


  def value([left, :+, right]), do: value(left) + value(right)
  def value([left, :*, right]), do: value(left) * value(right)
  def value([left, :^, right]), do: :math.pow(value(left), value(right)) 

  def value(n) when is_number(n), do: n
end
