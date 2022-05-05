defmodule FuelCalculator.FlightPath do
  alias FuelCalculator.ComputeLaunchFuel
  alias FuelCalculator.ComputeLandingFuel

  @spec call(float() | integer(), [{:atom, float()}]) :: float()
  def call(mass, path) do
    compute_path(mass, path) - mass
  end

  @spec compute(float() | integer(), {:land, float()}) :: float()
  def compute(mass, {:land, gravity}) do
    ComputeLandingFuel.call(mass, gravity)
  end

  @spec compute(float() | integer(), {:launch, float()}) :: float()
  def compute(mass, {:launch, gravity}) do
    ComputeLaunchFuel.call(mass, gravity)
  end

  def compute_path(mass, []), do: mass

  @spec compute_path(float() | integer(), list({:atom, float()})) :: float()
  def compute_path(mass, path) do
    {step, path_remaining} = List.pop_at(path, -1)

    mass = compute(mass, step) + mass

    compute_path(mass, path_remaining)
  end
end
