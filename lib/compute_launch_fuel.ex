defmodule FuelCalculator.ComputeLaunchFuel do
  @spec call(float() | integer(), float()) :: float()
  def call(mass, gravity) do
    compute(mass, gravity, 0)
  end

  defp compute(0, _gravity, sum) do
    sum
  end

  defp compute(mass, gravity, sum) do
    fuel = max(mass * gravity * 0.042 - 42, 0)

    compute(fuel, gravity, sum + fuel)
  end
end
