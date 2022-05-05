defmodule FuelCalculator.ComputeLandingFuel do

  @spec call(float() | integer(), float()) :: float()
  def call(fuel, gravity) do
    compute(fuel, gravity, 0)
  end

  defp compute(0, _gravity, sum) do
    sum
  end

  defp compute(mass, gravity, sum) do
    fuel = max(mass * gravity * 0.033 - 42, 0)

    compute(fuel, gravity, sum + fuel)
  end
end
