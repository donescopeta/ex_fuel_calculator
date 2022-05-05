defmodule FuelCalculator do
  defdelegate compute_landing(fuel, gravity),
    to: FuelCalculator.ComputeLandingFuel,
    as: :call

  defdelegate compute_launch(fuel, gravity),
    to: FuelCalculator.ComputeLaunchFuel,
    as: :call

  defdelegate compute_path(mass, path),
    to: FuelCalculator.FlightPath,
    as: :call
end
