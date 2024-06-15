defmodule Alien do
  defstruct type: "", health: 50, damage: 10

  def create(type) do
    %__MODULE__{type: type}
  end

  def status(alien) do
    "Tipo: #{alien.type}\nSaúde: #{alien.health}%"
  end

  def attack(alien) do
    %{alien | health: alien.health - 10}
  end
end
