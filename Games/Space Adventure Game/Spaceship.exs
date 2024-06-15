defmodule Spaceship do
  defstruct name: "", fuel: 100, shields: 100, lasers: 100

  def create(name) do
    %__MODULE__{name: name}
  end

  def status(spaceship) do
    "Nome: #{spaceship.name}\nFuel: #{spaceship.fuel}%\nEscudos: #{spaceship.shields}%\nLasers: #{spaceship.lasers}%"
  end

  def fly(spaceship) do
    %{spaceship | fuel: spaceship.fuel - 10}
  end

  def shoot(spaceship) do
    %{spaceship | lasers: spaceship.lasers - 5}
  end
end
